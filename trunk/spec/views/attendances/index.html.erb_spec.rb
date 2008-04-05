require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/index.html.erb" do
  include AttendancesHelper
  
  before(:each) do
    attendance_98 = mock_model(Attendance)
    attendance_98.should_receive(:user_id).and_return("1")
    attendance_98.should_receive(:show_id).and_return("1")
    attendance_99 = mock_model(Attendance)
    attendance_99.should_receive(:user_id).and_return("1")
    attendance_99.should_receive(:show_id).and_return("1")

    assigns[:attendances] = [attendance_98, attendance_99]
  end

  it "should render list of attendances" do
    render "/attendances/index.html.erb"
  end
end

