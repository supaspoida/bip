module SessionsHelper
  def session_links
    render(:partial => 'shared/session_links')
  end
  
  def logout_link
    link_to 'Logout', logout_path
  end
  
  def login_link
    link_to 'Login', login_path
  end
  
  def signup_link
    link_to 'Signup', signup_path
  end
  
end