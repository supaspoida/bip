require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bands/edit.html.erb" do
  include BandsHelper
  
  before do
    @band = mock_model(Band)
    @band.stub!(:name).and_return("MyString")
    @band.stub!(:biography).and_return("MyText")
    @band.stub!(:permalink).and_return("MyString")
    assigns[:band] = @band
  end

  it "should render edit form" do
    render "/bands/edit.html.erb"
    
    response.should have_tag("form[action=#{band_path(@band)}][method=post]") do
      with_tag('input#band_name[name=?]', "band[name]")
      with_tag('textarea#band_biography[name=?]', "band[biography]")
      with_tag('input#band_permalink[name=?]', "band[permalink]")
    end
  end
end


