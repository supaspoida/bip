# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '7ac44687e66618afaffd84dae8c526b1'
  
  include AuthenticatedSystem
  
  def access_denied
    respond_to do |format|
      format.html do 
        store_location
        redirect_to new_session_path
      end
    end
  end
end
