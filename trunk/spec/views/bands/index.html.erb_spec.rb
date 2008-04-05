require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bands/index.html.erb" do
  include BandsHelper
  
  before(:each) do
    band_98 = mock_model(Band)
    band_98.should_receive(:name).and_return("MyString")
    band_98.should_receive(:biography).and_return("MyText")
    band_98.should_receive(:permalink).and_return("MyString")
    band_99 = mock_model(Band)
    band_99.should_receive(:name).and_return("MyString")
    band_99.should_receive(:biography).and_return("MyText")
    band_99.should_receive(:permalink).and_return("MyString")

    assigns[:bands] = [band_98, band_99]
  end

  it "should render list of bands" do
    render "/bands/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

