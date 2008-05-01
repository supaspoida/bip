require File.dirname(__FILE__) + '/../../spec_helper'

describe "/venues/new.html.erb" do
  include VenuesHelper
  
  before(:each) do
    @venue = mock_model(Venue)
    @venue.stub!(:new_record?).and_return(true)
    @venue.stub!(:name).and_return("MyString")
    @venue.stub!(:permalink).and_return("MyString")
    assigns[:venue] = @venue
  end

  it "should render new form" do
    render "/venues/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", venues_path) do
      with_tag("input#venue_name[name=?]", "venue[name]")
    end
  end
end


