require File.dirname(__FILE__) + '/../../spec_helper'

describe "/shows/new.html.erb" do
  include ShowsHelper
  
  before(:each) do
    @show = mock_model(Show)
    @show.stub!(:new_record?).and_return(true)
    @show.stub!(:venue_id).and_return("1")
    @show.stub!(:date).and_return(Time.now)
    @show.stub!(:doors).and_return(Time.now)
    @show.stub!(:notes).and_return("MyText")
    @show.stub!(:announced_at).and_return(Time.now)
    assigns[:show] = @show
  end

  it "should render new form" do
    render "/shows/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", shows_path) do
      with_tag("textarea#show_notes[name=?]", "show[notes]")
      with_tag("select#show_venue_id[name=?]", "show[venue_id]")
    end
  end
end


