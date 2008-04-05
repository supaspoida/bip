require File.dirname(__FILE__) + '/../../spec_helper'

describe "/venues/index.html.erb" do
  include VenuesHelper
  
  before(:each) do
    venue_98 = mock_model(Venue)
    venue_98.should_receive(:name).and_return("MyString")
    venue_98.should_receive(:permalink).and_return("MyString")
    venue_99 = mock_model(Venue)
    venue_99.should_receive(:name).and_return("MyString")
    venue_99.should_receive(:permalink).and_return("MyString")

    assigns[:venues] = [venue_98, venue_99]
  end

  it "should render list of venues" do
    render "/venues/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

