require File.dirname(__FILE__) + '/../../spec_helper'

describe "/setlists/new.html.erb" do
  include SetlistsHelper
  
  before(:each) do
    @setlist = mock_model(Setlist)
    @setlist.stub!(:new_record?).and_return(true)
    @setlist.stub!(:appearance_id).and_return("1")
    @setlist.stub!(:band_id).and_return("1")
    @setlist.stub!(:user_id).and_return("1")
    @setlist.stub!(:approved).and_return(false)
    @setlist.stub!(:performances_cache).and_return("1")
    assigns[:setlist] = @setlist
  end

  it "should render new form" do
    render "/setlists/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", setlists_path) do
      with_tag("input#setlist_approved[name=?]", "setlist[approved]")
      with_tag("input#setlist_performances_cache[name=?]", "setlist[performances_cache]")
    end
  end
end


