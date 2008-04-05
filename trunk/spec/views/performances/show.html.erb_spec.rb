require File.dirname(__FILE__) + '/../../spec_helper'

describe "/performances/show.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    @performance = mock_model(Performance)
    @performance.stub!(:appearance_id).and_return("1")
    @performance.stub!(:song_id).and_return("1")
    @performance.stub!(:notes).and_return("MyText")
    @performance.stub!(:position).and_return("1")
    @performance.stub!(:segue).and_return(false)

    assigns[:performance] = @performance
  end

  it "should render attributes in <p>" do
    render "/performances/show.html.erb"
    response.should have_text(/MyText/)
    response.should have_text(/1/)
    response.should have_text(/als/)
  end
end

