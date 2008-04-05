require File.dirname(__FILE__) + '/../spec_helper'

describe Attendance do
  before(:each) do
    @attendance = Attendance.new
  end

  it "should be valid" do
    @attendance.should be_valid
  end
  
  it "should belong to a user" do
    @attendance.should belong_to(:user)
  end
  
  it "should belong to a show" do
    @attendance.should belong_to(:show)
  end
  
end
