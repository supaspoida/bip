require File.dirname(__FILE__) + '/../../spec_helper'

describe "/songs/index.html.erb" do
  include SongsHelper
  
  before(:each) do
    song_98 = mock_model(Song)
    song_98.should_receive(:band_id).and_return("1")
    song_98.should_receive(:name).and_return("MyString")
    song_98.should_receive(:lyrics).and_return("MyText")
    song_99 = mock_model(Song)
    song_99.should_receive(:band_id).and_return("1")
    song_99.should_receive(:name).and_return("MyString")
    song_99.should_receive(:lyrics).and_return("MyText")

    assigns[:songs] = [song_98, song_99]
  end

  it "should render list of songs" do
    render "/songs/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

