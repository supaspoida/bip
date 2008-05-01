require File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper'

describe "<%= File.join(controller_class_path, controller_singular_name) %>/show.html.haml" do
  include SpecResourceful::SpecHelpers::Views
  
  before(:each) do
    @page = "<%= File.join(controller_class_path, controller_singular_name) %>/show.html.haml"
    @<%= singular_name %> = mock_model(<%= model_name %>)
    assigns[:<%= singular_name %>] = @<%= singular_name %>
  end
  
  # There's nothing to see here because you need to write real content for the template
end