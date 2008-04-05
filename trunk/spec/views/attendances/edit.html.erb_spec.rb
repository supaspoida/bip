require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/edit.html.erb" do
  include AttendancesHelper
  
  before do
    @attendance = mock_model(Attendance)
    @attendance.stub!(:user_id).and_return("1")
    @attendance.stub!(:show_id).and_return("1")
    assigns[:attendance] = @attendance
  end

  it "should render edit form" do
    render "/attendances/edit.html.erb"
    
    response.should have_tag("form[action=#{attendance_path(@attendance)}][method=post]") do
    end
  end
end


