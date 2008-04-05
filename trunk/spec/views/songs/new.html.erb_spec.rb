require File.dirname(__FILE__) + '/../../spec_helper'

describe "/songs/new.html.erb" do
  include SongsHelper
  
  before(:each) do
    @song = mock_model(Song)
    @song.stub!(:new_record?).and_return(true)
    @song.stub!(:band_id).and_return("1")
    @song.stub!(:name).and_return("MyString")
    @song.stub!(:lyrics).and_return("MyText")
    assigns[:song] = @song
  end

  it "should render new form" do
    render "/songs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", songs_path) do
      with_tag("input#song_name[name=?]", "song[name]")
      with_tag("textarea#song_lyrics[name=?]", "song[lyrics]")
    end
  end
end


