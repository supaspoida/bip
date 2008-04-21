require File.dirname(__FILE__) + '/../../spec_helper'

describe "/venues/edit.html.erb" do
  include VenuesHelper
  
  before do
    @venue = mock_model(Venue)
    @venue.stub!(:name).and_return("MyString")
    @venue.stub!(:permalink).and_return("MyString")
    assigns[:venue] = @venue
  end

  it "should render edit form" do
    render "/venues/edit.html.erb"
    
    response.should have_tag("form[action=#{venue_path(@venue)}][method=post]") do
      with_tag('input#venue_name[name=?]', "venue[name]")
    end
  end
end


