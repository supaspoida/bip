require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bands/new.html.erb" do
  include BandsHelper
  
  before(:each) do
    @band = mock_model(Band)
    @band.stub!(:new_record?).and_return(true)
    @band.stub!(:name).and_return("MyString")
    @band.stub!(:biography).and_return("MyText")
    @band.stub!(:permalink).and_return("MyString")
    assigns[:band] = @band
  end

  it "should render new form" do
    render "/bands/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", bands_path) do
      with_tag("input#band_name[name=?]", "band[name]")
      with_tag("textarea#band_biography[name=?]", "band[biography]")
      with_tag("input#band_permalink[name=?]", "band[permalink]")
    end
  end
end


