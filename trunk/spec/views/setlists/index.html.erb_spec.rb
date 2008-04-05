require File.dirname(__FILE__) + '/../../spec_helper'

describe "/setlists/index.html.erb" do
  include SetlistsHelper
  
  before(:each) do
    setlist_98 = mock_model(Setlist)
    setlist_98.should_receive(:appearance_id).and_return("1")
    setlist_98.should_receive(:band_id).and_return("1")
    setlist_98.should_receive(:user_id).and_return("1")
    setlist_98.should_receive(:approved).and_return(false)
    setlist_98.should_receive(:performances_cache).and_return("1")
    setlist_99 = mock_model(Setlist)
    setlist_99.should_receive(:appearance_id).and_return("1")
    setlist_99.should_receive(:band_id).and_return("1")
    setlist_99.should_receive(:user_id).and_return("1")
    setlist_99.should_receive(:approved).and_return(false)
    setlist_99.should_receive(:performances_cache).and_return("1")

    assigns[:setlists] = [setlist_98, setlist_99]
  end

  it "should render list of setlists" do
    pending "define view requirements"
    render "/setlists/index.html.erb"
    response.should have_tag("tr>td", false, 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

