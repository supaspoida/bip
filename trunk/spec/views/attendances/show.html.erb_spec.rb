require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/show.html.erb" do
  include AttendancesHelper
  
  before(:each) do
    @attendance = mock_model(Attendance)
    @attendance.stub!(:user_id).and_return("1")
    @attendance.stub!(:show_id).and_return("1")

    assigns[:attendance] = @attendance
  end

  it "should render attributes in <p>" do
    render "/attendances/show.html.erb"
  end
end

