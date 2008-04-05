require File.dirname(__FILE__) + '/../../spec_helper'

describe "/appearances/edit.html.erb" do
  include AppearancesHelper
  
  before do
    @appearance = mock_model(Appearance)
    @appearance.stub!(:band_id).and_return("1")
    @appearance.stub!(:show_id).and_return("1")
    @appearance.stub!(:headliner).and_return(false)
    @appearance.stub!(:notes).and_return("MyText")
    assigns[:appearance] = @appearance
  end

  it "should render edit form" do
    render "/appearances/edit.html.erb"
    
    response.should have_tag("form[action=#{appearance_path(@appearance)}][method=post]") do
      with_tag('input#appearance_headliner[name=?]', "appearance[headliner]")
      with_tag('textarea#appearance_notes[name=?]', "appearance[notes]")
    end
  end
end


