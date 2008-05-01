require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/form.html.haml" do
  include SpecResourceful::SpecHelpers::Views
  
  before(:each) do
    @page = "/attendances/form.html.haml"
    @attendance = mock_model(Attendance)
    assigns[:attendance] = @attendance
  end
  
  it "should submit to the proper action" do
    template.should_receive(:form_for).with(@attendance)
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