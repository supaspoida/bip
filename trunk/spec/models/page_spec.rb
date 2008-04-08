require File.dirname(__FILE__) + '/../spec_helper'

module PageSpecHelper
  def valid_page_attributes
    { :title => "This is my page",
      :permalink => "this-is-my-permalink", 
      :body => "Hello from the body of the valid page." }
  end
end

describe Page do
  include PageSpecHelper
  
  before(:each) do
    @page = Page.new
  end

  it "should be valid" do
    @page.attributes = valid_page_attributes
    @page.should be_valid
  end
  
  it "should be invalid with no page title" do
    @page.attributes = valid_page_attributes.except(:title)
    @page.should_not be_valid
  end
  
  it "should be invalid with a short page title" do
    @page.title = 'a'
    @page.should_not be_valid
  end
  
  it "should be invalid with a long page title" do
    title = "This is a string of 34 characters. This is a string of 34 characters. This is a string of 34 characters. This is a string of 34 characters. This is a string of 34 characters. This is a string of 34 characters. This is a string of 34 characters. This is a string of 34 characters."
    @page.title = title
    @page.should_not be_valid
  end
  
  it "should create a permalink on save" do
    pending "this test is not doing anything"
    @page.attributes = valid_page_attributes
    @page.permalink.should match(/[^a-zA-Z0-9_]+/)
  end
  
end