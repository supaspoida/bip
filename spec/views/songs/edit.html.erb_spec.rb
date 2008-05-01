require File.dirname(__FILE__) + '/../../spec_helper'

describe "/songs/edit.html.erb" do
  include SongsHelper
  
  before do
    @song = mock_model(Song)
    @song.stub!(:band_id).and_return("1")
    @song.stub!(:name).and_return("MyString")
    @song.stub!(:lyrics).and_return("MyText")
    assigns[:song] = @song
  end

  it "should render edit form" do
    render "/songs/edit.html.erb"
    
    response.should have_tag("form[action=#{song_path(@song)}][method=post]") do
      with_tag('input#song_name[name=?]', "song[name]")
      with_tag('textarea#song_lyrics[name=?]', "song[lyrics]")
    end
  end
end


