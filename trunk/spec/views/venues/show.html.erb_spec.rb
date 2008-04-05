require File.dirname(__FILE__) + '/../../spec_helper'

describe "/venues/show.html.erb" do
  include VenuesHelper
  
  before(:each) do
    @venue = mock_model(Venue)
    @venue.stub!(:name).and_return("MyString")
    @venue.stub!(:permalink).and_return("MyString")

    assigns[:venue] = @venue
  end

  it "should render attributes in <p>" do
    render "/venues/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

