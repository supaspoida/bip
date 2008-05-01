require File.dirname(__FILE__) + '/../../spec_helper'

describe "/performances/edit.html.erb" do
  include PerformancesHelper
  
  before do
    @performance = mock_model(Performance)
    @performance.stub!(:appearance_id).and_return("1")
    @performance.stub!(:song_id).and_return("1")
    @performance.stub!(:notes).and_return("MyText")
    @performance.stub!(:position).and_return("1")
    @performance.stub!(:segue).and_return(false)
    assigns[:performance] = @performance
  end

  it "should render edit form" do
    render "/performances/edit.html.erb"
    
    response.should have_tag("form[action=#{performance_path(@performance)}][method=post]") do
      with_tag('textarea#performance_notes[name=?]', "performance[notes]")
      with_tag('input#performance_position[name=?]', "performance[position]")
      with_tag('input#performance_segue[name=?]', "performance[segue]")
    end
  end
end


