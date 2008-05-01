require File.dirname(__FILE__) + '/../../spec_helper'

describe "/appearances/index.html.erb" do
  include AppearancesHelper
  
  before(:each) do
    appearance_98 = mock_model(Appearance)
    appearance_98.should_receive(:band_id).and_return("1")
    appearance_98.should_receive(:show_id).and_return("1")
    appearance_98.should_receive(:headliner).and_return(false)
    appearance_98.should_receive(:notes).and_return("MyText")
    appearance_99 = mock_model(Appearance)
    appearance_99.should_receive(:band_id).and_return("1")
    appearance_99.should_receive(:show_id).and_return("1")
    appearance_99.should_receive(:headliner).and_return(false)
    appearance_99.should_receive(:notes).and_return("MyText")

    assigns[:appearances] = [appearance_98, appearance_99]
  end

  it "should render list of appearances" do
    pending "define view requirements"
    render "/appearances/index.html.erb"
    response.should have_tag("tr>td", false, 2)
    response.should have_tag("tr>td", "MyText", 2)
  end

end

