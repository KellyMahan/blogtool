class LoginController < ApplicationController
  
  
  #self.append_view_path("views/templates/#{BlogTool.config["template"]}")
  
  self.prepend_view_path(File.join(Rails.root, "templates", BlogTool.config["template"], "views"))
  
  def index
    
  end
  
  def submit
    user = User.find(:first, :conditions=>["username = ? and password = ? and is_admin = true", params[:username], params[:password]])
    if user
      session[:user] = user
      redirect_to session[:last_page]
    else
      redirect_to "/login"
    end
  end
  
end
