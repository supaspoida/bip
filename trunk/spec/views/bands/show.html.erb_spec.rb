require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bands/show.html.erb" do
  include BandsHelper
  
  before(:each) do
    @band = mock_model(Band)
    @band.stub!(:name).and_return("MyString")
    @band.stub!(:biography).and_return("MyText")
    @band.stub!(:permalink).and_return("MyString")

    assigns[:band] = @band
  end

  it "should render attributes in <p>" do
    render "/bands/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

