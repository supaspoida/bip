require File.dirname(__FILE__) + '/../spec_helper'

describe SessionsHelper do
  
  it "should display a link that destroys the session" do
    logout_link.should have_tag('a', 'Logout')
  end
  
  it "should display a link to start a new session" do
    login_link.should have_tag('a', 'Login')
  end
    
  it "should render the session links partial" do
    self.should_receive(:render).
      with(:partial => "shared/session_links")

    session_links
  end
  
end
