class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
    include SessionsHelper
before_action:login_require

def login_require
 if session[:user_id] == nil
  redirect_to login_path
  end
end

  private

 def redirect_away(*params)
  session[:original_uri] = request.request_uri
  redirect_to(*params)
end

# returns to the original url from a redirect_away or to a default url
def redirect_back(*params)
  uri = session[:original_uri]
  session[:original_uri] = nil
  if uri
    redirect_to uri
  else
    redirect_to(*params)
  end
end
end

