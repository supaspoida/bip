require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/new.html.erb" do
  include AttendancesHelper
  
  before(:each) do
    @attendance = mock_model(Attendance)
    @attendance.stub!(:new_record?).and_return(true)
    @attendance.stub!(:user_id).and_return("1")
    @attendance.stub!(:show_id).and_return("1")
    assigns[:attendance] = @attendance
  end

  it "should render new form" do
    render "/attendances/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", attendances_path) do
    end
  end
end


