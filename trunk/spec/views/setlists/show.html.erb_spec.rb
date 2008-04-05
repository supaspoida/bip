require File.dirname(__FILE__) + '/../../spec_helper'

describe "/setlists/show.html.erb" do
  include SetlistsHelper
  
  before(:each) do
    @setlist = mock_model(Setlist)
    @setlist.stub!(:appearance_id).and_return("1")
    @setlist.stub!(:band_id).and_return("1")
    @setlist.stub!(:user_id).and_return("1")
    @setlist.stub!(:approved).and_return(false)
    @setlist.stub!(:performances_cache).and_return("1")

    assigns[:setlist] = @setlist
  end

  it "should render attributes in <p>" do
    render "/setlists/show.html.erb"
    response.should have_text(/als/)
    response.should have_text(/1/)
  end
end

