class PublicController < ApplicationController
  
  def get_file
    template = BlogTool.config["template"]
    path = params[:path]
    
  end
  
  private
  
  def sanitize_path(path)
    
  end
  
  def get_extension(path)
    
  end
  
  def allowed_extensions
    BlogTool.config["allowed_template_extensions"]
  end
  
end