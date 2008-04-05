module ViewableHelper
  
	def page_class
	  controller.controller_name + " " + controller.action_name 
	end
	
	def is_location?(opts = {})
		opts[:controller] ||= controller.controller_name
		opts[:action] ||= controller.action_name
		#return controller.action_name
		if is_controller?(opts[:controller]) and is_action?(opts[:action])
			true
		else
			false
		end
	end
	
	def is_controller?(expected_controller)
		expected_controller == controller.controller_name
	end
	
	def is_action?(expected_action)
		expected_action == controller.action_name
	end
	
	def is_id?(expected_id)
	  expected_id == params[:id]
	end
	
  def flash_header(key)
  	case key
		when "error"
			return 'something went wrong'
		when "notice"
			return 'take note'
		when "warning"
			return 'warning'
		when "message"
			return 'a message for you'
		else
			return 'no heading defined'
		end
  end

  def block_to_partial(partial_name, options = {}, &block)
    options.merge!('@content_for_layout' => capture(&block))
    concat(render(:partial => partial_name, :locals => options),  block.binding)
  end
  
  def default_content_for(name, &block)
    name = name.kind_of?(Symbol) ? ":#{name}" : name
    out = eval("yield #{name}", block.binding)
    concat(out || capture(&block), block.binding)
  end
  
  def feedback_for(object_names = [])
    object_names = [object_names]
    #object_names.flatten!
    html = error_messages_for(object_names, :id => 'feedback', :class => "flash error", :message => nil) unless object_names.empty?
    html += get_flash
  end
  
  def get_flash
    return "" if flash.empty?
    flash.empty? ? "" : render(:partial => 'shared/flash', :locals => { :flash => flash })
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
  
end
