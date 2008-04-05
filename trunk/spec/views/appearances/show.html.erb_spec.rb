require File.dirname(__FILE__) + '/../../spec_helper'

describe "/appearances/show.html.erb" do
  include AppearancesHelper
  
  before(:each) do
    @appearance = mock_model(Appearance)
    @appearance.stub!(:band_id).and_return("1")
    @appearance.stub!(:show_id).and_return("1")
    @appearance.stub!(:headliner).and_return(false)
    @appearance.stub!(:notes).and_return("MyText")

    assigns[:appearance] = @appearance
  end

  it "should render attributes in <p>" do
    render "/appearances/show.html.erb"
    response.should have_text(/als/)
    response.should have_text(/MyText/)
  end
end

