require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/show.html.haml" do
  include SpecResourceful::SpecHelpers::Views
  
  before(:each) do
    @page = "/attendances/show.html.haml"
    @attendance = mock_model(Attendance)
    assigns[:attendance] = @attendance
  end
  
  # There's nothing to see here because you need to write real content for the template
end