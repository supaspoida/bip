require File.dirname(__FILE__) + '/../spec_helper'

describe Venue do
  before(:each) do
    @venue = Venue.new
  end

  it "should be valid" do
    @venue.should be_valid
  end
  
  it "should have many shows" do
    @venue.should have_many(:shows)
  end
end
