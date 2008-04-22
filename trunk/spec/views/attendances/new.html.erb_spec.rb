require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/new.html.erb" do
  include AttendancesHelper
  
  before(:each) do
    @show = mock_model(Show, :id => "1", :to_param => "1")
    @attendance = mock_model(Attendance)
    @attendance.stub!(:new_record?).and_return(true)
    @attendance.stub!(:user_id).and_return("1")
    @attendance.stub!(:show_id).and_return("1")
    assigns[:attendance] = @attendance
  end

  it "should render new form" do
    render "/attendances/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", show_attendances_path(@show)) do
    end
  end
end


