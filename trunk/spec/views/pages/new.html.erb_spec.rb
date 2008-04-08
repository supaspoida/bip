require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/new.html.erb" do
  include PagesHelper
  
  before(:each) do
    @page = mock_model(Page)
    @page.stub!(:new_record?).and_return(true)
    @page.stub!(:user_id).and_return("1")
    @page.stub!(:title).and_return("MyString")
    @page.stub!(:body).and_return("MyText")
    assigns[:page] = @page
  end

  it "should render new form" do
    render "/pages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", pages_path) do
      with_tag("input#page_title[name=?]", "page[title]")
      with_tag("textarea#page_body[name=?]", "page[body]")
    end
  end
end


