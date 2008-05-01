require File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper'

describe "<%= File.join(controller_class_path, controller_singular_name) %>/form.html.haml" do
  include SpecResourceful::SpecHelpers::Views
  
  before(:each) do
    @page = "<%= File.join(controller_class_path, controller_singular_name) %>/form.html.haml"
    @<%= singular_name %> = mock_model(<%= model_name %>)
    assigns[:<%= singular_name %>] = @<%= singular_name %>
  end
  
  it "should submit to the proper action" do
    template.should_receive(:form_for).with(@<%= singular_name %>)
    render @page
  end
  
  # Spec attribute editing here, please! Like this:
  #
  # it "should allow editing of @<= model_name %>.foo" do
  #   render @page
  #   response.should allow_editing(@<= model_name %>, :foo)
  # end
  
  it "should have a submit button" do
    render @page
    response.should have_submit_button
  end
  
  it "should have a cancel button" do
    render @page
    response.should have_cancel_button
  end
end