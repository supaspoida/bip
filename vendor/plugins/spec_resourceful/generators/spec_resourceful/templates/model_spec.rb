require File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper'

describe <%= class_name %> do
  def valid_attributes(args = {})
    {
      # Fill in with valid attributes!
    }.merge(args)
  end
  
  before(:each) do
    @<%= singular_name %> = <%= class_name %>.new
  end
  
  # Add specs here, please! See lib/spec_resourceful/spec_helpers
  # for a custom matcher to use when spec'ing model associations.
  # Example: 
  #
  # it "should have many foos" do
  #   @<= singular_name %>.should have_many(:foos)
  # end
end