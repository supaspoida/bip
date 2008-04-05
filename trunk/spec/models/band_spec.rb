require File.dirname(__FILE__) + '/../spec_helper'

describe Band do
  before(:each) do
    @band = Band.new
  end

  it "should be valid" do
    @band.should be_valid
  end
  
  it "should have many appearances at shows" do
    @band.should have_many(:appearances)
    @band.should have_many(:shows)
  end
  
  it "should have many songs" do
    @band.should have_many(:songs)
  end
  
end
