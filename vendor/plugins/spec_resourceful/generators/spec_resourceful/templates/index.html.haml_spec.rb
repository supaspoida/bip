require File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper'

describe "<%= File.join(controller_class_path, controller_singular_name) %>/index.html.haml" do
  include SpecResourceful::SpecHelpers::Views
  
  before(:each) do
    @page = "<%= File.join(controller_class_path, controller_singular_name) %>/index.html.haml"
    @<%= plural_name %> = Array.new(3, mock_model(<%= model_name %>))
    assigns[:<%= plural_name %>] = @<%= plural_name %>
  end

  it "should have a link or button to show each <%= singular_name %>" do
    render @page
    @<%= plural_name %>.each do |<%= singular_name %>|
      response.should have_link_or_button_to_show(<%= singular_name %>)
    end
  end

  it "should have a link or button to edit each <%= singular_name %>" do
    render @page
    @<%= plural_name %>.each do |<%= singular_name %>|
      response.should have_link_or_button_to_edit(<%= singular_name %>)
    end
  end
  
  it "should have a button to delete each <%= singular_name %>" do
    render @page
    @<%= plural_name %>.each do |<%= singular_name %>|
      response.should have_button_to_delete(<%= singular_name %>)
    end
  end
  
  it "should have a link or button to create a new <%= singular_name %>" do
    render @page
    response.should have_link_or_button_to(new_<%= singular_name %>_path)
  end
end