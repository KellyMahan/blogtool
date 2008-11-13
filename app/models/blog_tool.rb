class BlogTool
  
  def self.config
    YAML.load_file("#{RAILS_ROOT}/config/blogtool.yml")
  end
  
  
end
