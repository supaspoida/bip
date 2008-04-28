require File.dirname(__FILE__) + '/../../spec_helper'

describe "/attendances/index.html.haml" do
  include SpecResourceful::SpecHelpers::Views
  
  before(:each) do
    @page = "/attendances/index.html.haml"
    @attendances = Array.new(3, mock_model(Attendance))
    assigns[:attendances] = @attendances
  end

  it "should have a link or button to show each attendance" do
    render @page
    @attendances.each do |attendance|
      response.should have_link_or_button_to_show(attendance)
    end
  end

  it "should have a link or button to edit each attendance" do
    render @page
    @attendances.each do |attendance|
      response.should have_link_or_button_to_edit(attendance)
    end
  end
  
  it "should have a button to delete each attendance" do
    render @page
    @attendances.each do |attendance|
      response.should have_button_to_delete(attendance)
    end
  end
  
  it "should have a link or button to create a new attendance" do
    render @page
    response.should have_link_or_button_to(new_attendance_path)
  end
end