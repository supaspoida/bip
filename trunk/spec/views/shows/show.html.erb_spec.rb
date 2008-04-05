require File.dirname(__FILE__) + '/../../spec_helper'

describe "/shows/show.html.erb" do
  include ShowsHelper
  
  before(:each) do
    @show = mock_model(Show)
    @show.stub!(:venue_id).and_return("1")
    @show.stub!(:date).and_return(Time.now)
    @show.stub!(:doors).and_return(Time.now)
    @show.stub!(:notes).and_return("MyText")
    @show.stub!(:announced_at).and_return(Time.now)

    assigns[:show] = @show
  end

  it "should render attributes in <p>" do
    render "/shows/show.html.erb"
    response.should have_text(/MyText/)
  end
end

