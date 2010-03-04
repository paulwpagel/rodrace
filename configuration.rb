CONFIG = {} 
if !File.exists?(File.expand_path("~/rodrace"))
  Dir.mkdir(File.expand_path("~/rodrace"))
end
CONFIG[:data_root] = File.expand_path("~/rodrace")


