require File.dirname(__FILE__) + '/../../spec_helper'

describe "/songs/show.html.erb" do
  include SongsHelper
  
  before(:each) do
    @song = mock_model(Song)
    @song.stub!(:band_id).and_return("1")
    @song.stub!(:name).and_return("MyString")
    @song.stub!(:lyrics).and_return("MyText")

    assigns[:song] = @song
  end

  it "should render attributes in <p>" do
    render "/songs/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

