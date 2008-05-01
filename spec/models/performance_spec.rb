require File.dirname(__FILE__) + '/../spec_helper'

describe Performance do
  before(:each) do
    @performance = Performance.new
  end

  it "should be valid" do
    @performance.should be_valid
  end
end
