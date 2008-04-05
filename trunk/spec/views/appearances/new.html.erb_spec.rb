require File.dirname(__FILE__) + '/../../spec_helper'

describe "/appearances/new.html.erb" do
  include AppearancesHelper
  
  before(:each) do
    @appearance = mock_model(Appearance)
    @appearance.stub!(:new_record?).and_return(true)
    @appearance.stub!(:band_id).and_return("1")
    @appearance.stub!(:show_id).and_return("1")
    @appearance.stub!(:headliner).and_return(false)
    @appearance.stub!(:notes).and_return("MyText")
    assigns[:appearance] = @appearance
  end

  it "should render new form" do
    render "/appearances/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", appearances_path) do
      with_tag("input#appearance_headliner[name=?]", "appearance[headliner]")
      with_tag("textarea#appearance_notes[name=?]", "appearance[notes]")
    end
  end
end


