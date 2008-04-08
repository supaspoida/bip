require File.dirname(__FILE__) + '/../spec_helper'

describe Show do
  before(:each) do
    @show = Show.new
  end

  it "should be valid" do
    @show.should be_valid
  end
  
  it "should have one venue" do
    @show.should have_one(:venue)
  end
  
  it "should have many appearances by bands" do
    @show.should have_many(:appearances)
    @show.should have_many(:bands)
  end
  
  it "should collect upcoming shows" do
    pending "how do you spec named_scope?"
    show = mock_model('show')
    show.should_recieve(:upcoming)
  end
end
=begin
class HaveUpcoming
  def initialize(expected)
    @expected = expected
  end
  def matches?(target)
    @target = target
    @target.upcoming
  end
end
=end