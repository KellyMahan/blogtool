class Template
  
  LINKED_DIRECTORIES=%w(images stylesheets javascripts content)
  
  def self.create_sym_links
    puts "** [BlogTool] creating template symlinks"
    Template.remove_sym_links
    find_templates.each do |template|
      LINKED_DIRECTORIES.each do |dir_path|
        template_path = "#{RAILS_ROOT}/templates/#{template}/public/#{dir_path}"
        link_path = "#{RAILS_ROOT}/public/#{dir_path}/links/#{template}"
        begin
          File.symlink(template_path,link_path)
        rescue NotImplementedError #error caused by rails setup on windows. We don't recommend a windows rails environment.
          `cmd.exe /C mklink /d #{link_path.gsub(/\//,"\\")} #{template_path.gsub(/\//,"\\")}`
        end
      end
    end
  end
  
  def self.remove_sym_links
    LINKED_DIRECTORIES.each do |dir_path|
      dir = Dir.new("#{RAILS_ROOT}/public/#{dir_path}/links")
      dir.each do |file_path|
        link_path = "#{RAILS_ROOT}/public/#{dir_path}/links/#{file_path}"
        begin
          if File.symlink?(link_path)
            File.unlink(link_path)
          end
        rescue NotImplementedError
          if File.exists?(link_path.gsub(/\//,"\\"))
            File.unlink(link_path.gsub(/\//,"\\"))
          end
        end
      end
    end
    return true
  end
  
  def self.find_templates
    dir = Dir.new("#{RAILS_ROOT}/templates")
    entries = dir.entries - [".",".."]
    entries = entries.select{|entry| File.directory?("#{RAILS_ROOT}/templates/#{entry}")}
    return entries
  end
  
  
end