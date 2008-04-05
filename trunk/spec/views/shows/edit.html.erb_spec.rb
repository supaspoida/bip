require File.dirname(__FILE__) + '/../../spec_helper'

describe "/shows/edit.html.erb" do
  include ShowsHelper
  
  before do
    @show = mock_model(Show)
    @show.stub!(:venue_id).and_return("1")
    @show.stub!(:date).and_return(Time.now)
    @show.stub!(:doors).and_return(Time.now)
    @show.stub!(:notes).and_return("MyText")
    @show.stub!(:announced_at).and_return(Time.now)
    assigns[:show] = @show
  end

  it "should render edit form" do
    render "/shows/edit.html.erb"
    
    response.should have_tag("form[action=#{show_path(@show)}][method=post]") do
      with_tag('textarea#show_notes[name=?]', "show[notes]")
    end
  end
end


