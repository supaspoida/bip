module SpecResourceful
  module SpecHelpers
    module Helpers
      def have_link_to(path)
        have_tag("a[href='#{path}']")
      end
    end
    
    module Views
      include ActionController::PolymorphicRoutes
      include Helpers
      
      def have_link_or_button_to(path)
        have_tag(
          "a[href='#{path}'],
          form[action='#{path}'] input,
          form[action='#{path}'] button"
        )
      end
      
      def have_link_or_button_to_show(instance)
        path = polymorphic_path(instance)
        have_tag(
          "a[href='#{path}'],
          form[action='#{path}'] div input:only-child,
          form[action='#{path}'] div button:only-child"
        )
      end
      
      def have_link_or_button_to_edit(instance)
        path = edit_polymorphic_path(instance)
        have_tag(
          "a[href='#{path}'],
          form[action='#{path}'] input,
          form[action='#{path}'] button"
        )
      end
      
      def have_button_to_delete(instance)
        path = polymorphic_path(instance)
        have_tag(
          "form[action='#{path}'] input[name='_method'][value='delete'] + input,
          form[action='#{path}'] input[name='_method'][value='delete'] + button"
        )
      end
      
      def allow_editing(instance, attribute)
        instance_name = instance.class.name.underscore.downcase
        if instance.send(attribute).is_a?(Time)
          have_tag(
            "input[name='#{instance_name}[#{attribute}]'],
            select[name=?]", /#{instance_name}\[#{attribute}\(.*\)\]/
          )
        else
          have_tag(
            "input[name='#{instance_name}[#{attribute}]'],
            select[name='#{instance_name}[#{attribute}]'],
            textarea[name='#{instance_name}[#{attribute}]'],
            input[type='checkbox'][name='#{instance_name}[#{attribute}]'],
            input[type='checkbox'][name='#{instance_name}[#{attribute.to_s.tableize.singularize}_ids][]']"
          )
        end
      end
      
      # This completely sucks. I know.
      def have_submit_button
        have_tag(
          "input[type='submit'],
          button[type='submit']"
        )
      end
      
      # This is even _more_ naïve. I know.
      def have_cancel_button
        have_tag(
          "input[type='submit'][name=?],
          button[type='submit'][name=?]", /cancel/i, /cancel/i
        )
      end
      
      # For iterating over collections
      def each_attribute_in(collection, &block)
        self.class.each_attribute_in(collection, &block)
      end

      def self.included(base)
        base.class_eval do
          def self.each_attribute_in(collection, &block)
            collection.each{|attribute| yield attribute}
          end
        end
      end
    end
    
    module Controllers
      def mock_resourceful!(klass, specific_return = nil)
        member = mock_model(klass)
        collection = Array.new(3, member)
        klass.stub!(:new).and_return(member)
        klass.stub!(:find)
        klass.stub!(:find).with(member.id.to_s).and_return(member)
        klass.stub!(:find).with(:all).and_return(collection)
        case specific_return
        when :member_only
          member
        when :collection_only
          collection
        else
          [member, collection]
        end
      end
      
      # Currently only handles belongs_to/has_many association
      def mock_proxy!(instance, proxy, options = {})
        klass = options[:class] || proxy.to_s.classify.constantize
        child = mock_model(klass,
          instance.class.name.foreign_key.to_sym => instance.id,
          :save => true,
          :destroy => true
        )
        if options[:stub_child]
          options[:stub_child].each do |method_id, value|
            child.stub!(method_id).and_return(value)
          end
        end
        returning Array.new(options[:size] || 1, child) do |proxy_collection|
          proxy_collection.stub!(:build).and_return(proxy_collection.first)
          proxy_collection.each do |proxy_member|
            klass.stub!(:find).with(proxy_member.id.to_s).and_return(proxy_member)
          end
          proxy_collection.stub!(:find).with(:all).and_return(proxy_collection)
          instance.stub!(proxy).and_return(proxy_collection)
        end
      end
    end
    
    module Models
      class AssociationMatcher
        def initialize(associated, macro)
          @associated = associated
          @macro = macro
          @options = {}
        end

        def matches?(main_model)
          unless main_model.respond_to?(:reflect_on_association)
            if main_model.class.respond_to?(:reflect_on_association)
              main_model = main_model.class
            else
              @not_model = main_model
              return false
            end
          end
          if @association = main_model.reflect_on_association(@associated)
            @options.all?{|k, v| @association.options[k] == v ||
              [@association.options[k]] == v} # Stupid to_a being obsoleted!
          end
        end

        def failure_message
          if @not_model
            " expected: #{@not_model} to be a subclass of ActiveRecord::Base class, but was not"
          elsif @association
            " expected: #{association_with(@options)}\n      got: #{association_with(@association.options)}"
          else
            " expected: #{association_with(@options)}, but the association does not exist"
          end
        end

        def negative_failure_message
          if @association
            " expected: #{association_with(@options)}\n      got: #{association_with(@association.options)}"
          else
            " expected: #{association_with(@options)} to not occur but it does"
          end
        end

        # The following public methods are chainable extensions on the main matcher
        # Examples:
        # 
        #   Foo.should have_many(:bars).through(:foobars).with_dependent(:destroy)
        #   Bar.should belong_to(:baz).with_class_name("Unbaz")
        def through(through_model)
          @options[:through] = through_model
          self
        end

        def and_includes(included_models)
          @options[:include] = included_models
          self
        end

        def and_extends(*modules)
          @options[:extends] = modules
          self
        end

        def with_counter_cache(counter_cache = false)
          if counter_cache
            @options[:counter_cache] = counter_cache
          end
          self
        end

        def uniq(*irrelevant_args)
          @options[:uniq] = true
          self
        end
        alias and_is_unique uniq
        alias with_unique uniq

        def polymorphic(*irrelevant_args)
          @options[:polymorphic] = true
          self
        end
        alias and_is_polymorphic polymorphic
        alias with_polymorphic polymorphic

        def as(interface)
          @options[:as] = interface
        end

        # Use this to just specify the options as a hash.
        # Note: It will completely override any previously set options
        def with_options(options = {})
          options.each{|k, v| @options[k] = v}
          self
        end

      private
        # Takes care of methods like with_dependent(:destroy)
        def method_missing(method_id, *args, &block)
          method_name = method_id.to_s
          if method_name =~ /^with_(.*)/
            @options[$1.to_sym] = args
            self
          else
            super method_id, *args, &block
          end
        end

        def association_with(options)
          option_string = (options.nil? || options.empty?) ? "" : options.inspect
          unless option_string.blank?
            option_string.sub! /^\{(.*)\}$/, ', \1'
            option_string.gsub! /\=\>/, ' => '
          end
          "#{@macro} :#{@associated}#{option_string}"
        end
      end

      def belong_to(model)
        AssociationMatcher.new model, :belongs_to
      end

      def have_one(model)
        AssociationMatcher.new model, :has_one
      end

      def have_many(models)
        AssociationMatcher.new models, :has_many
      end

      def have_and_belong_to_many(models)
        AssociationMatcher.new models, :has_and_belongs_to_many
      end
    end
  end
end