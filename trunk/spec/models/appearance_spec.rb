require File.dirname(__FILE__) + '/../spec_helper'

describe Appearance do
  before(:each) do
    @appearance = Appearance.new
  end

  it "should be valid" do
    @appearance.should be_valid
  end
  
  it "should belong to a show" do
    @appearance.should belong_to(:show)
  end
  
  it "should belong to a band" do
    @appearance.should belong_to(:band)
  end
  
  it "should have many performances of songs" do
    @appearance.should have_many(:performances)
    @appearance.should have_many(:songs)
  end
  
  it "should have many setlists" do
    @appearance.should have_many(:setlists)
  end
end
