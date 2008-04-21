require File.dirname(__FILE__) + '/../spec_helper'

describe Attendance do
  
  include AttendancesHelper
  
  before(:each) do
    @attendance = Attendance.new
  end

  it "should be valid with valid attributes" do
    @attendance.attributes = valid_attributes
    @attendance.should be_valid
  end
  
  it "should belong to a user" do
    @attendance.should belong_to(:user)
  end
  
  it "should belong to a show" do
    @attendance.should belong_to(:show)
  end
  
  it do
    @attendance.should validate_presence_of(:user_id)
  end
  
  it do
    @attendance.should validate_presence_of(:show_id)
  end
  
end

module AttendancesHelper
  def valid_attributes
    { :user_id => 1, :show_id => 1 }
  end
end
