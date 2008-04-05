require File.dirname(__FILE__) + '/../../spec_helper'

describe "/performances/index.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    performance_98 = mock_model(Performance)
    performance_98.should_receive(:appearance_id).and_return("1")
    performance_98.should_receive(:song_id).and_return("1")
    performance_98.should_receive(:notes).and_return("MyText")
    performance_98.should_receive(:position).and_return("1")
    performance_98.should_receive(:segue).and_return(false)
    performance_99 = mock_model(Performance)
    performance_99.should_receive(:appearance_id).and_return("1")
    performance_99.should_receive(:song_id).and_return("1")
    performance_99.should_receive(:notes).and_return("MyText")
    performance_99.should_receive(:position).and_return("1")
    performance_99.should_receive(:segue).and_return(false)

    assigns[:performances] = [performance_98, performance_99]
  end

  it "should render list of performances" do
    pending "define view requirements"
    render "/performances/index.html.erb"
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", false, 2)
  end
end

