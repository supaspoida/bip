require File.dirname(__FILE__) + '/../../spec_helper'

describe "/shows/index.html.erb" do
  include ShowsHelper
  
  before(:each) do
    show_98 = mock_model(Show)
    show_98.should_receive(:venue_id).and_return("1")
    show_98.should_receive(:date).and_return(Time.now)
    show_98.should_receive(:doors).and_return(Time.now)
    show_98.should_receive(:notes).and_return("MyText")
    show_98.should_receive(:announced_at).and_return(Time.now)
    show_99 = mock_model(Show)
    show_99.should_receive(:venue_id).and_return("1")
    show_99.should_receive(:date).and_return(Time.now)
    show_99.should_receive(:doors).and_return(Time.now)
    show_99.should_receive(:notes).and_return("MyText")
    show_99.should_receive(:announced_at).and_return(Time.now)

    assigns[:shows] = [show_98, show_99]
  end

  it "should render list of shows" do
    render "/shows/index.html.erb"
    response.should have_tag("tr>td", "MyText", 2)
  end
end

