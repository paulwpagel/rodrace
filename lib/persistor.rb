require "team_entry"
require 'time'
module Persistor

  def self.save_team_entry(team_entry)
    File.open(CONFIG[:data_root] + "/#{team_entry.team_number}_#{CONFIG[:checkpoint]}.team", "w+") do |file|
      file.write(team_entry.in_timestamp.to_s)
      file.write("\n")
      file.write(team_entry.out_timestamp.to_s)
    end
  end
  
  def self.load_teams
    teams = []
    team_entries.each do |team_filename|
      team_number = team_filename.split("_")[0]
      time_in, time_out = IO.read(full_filename_from(team_filename)).split("\n")
      time_out = Time.parse(time_out) if time_out
      teams << TeamEntry.load_from(:team_number => team_number, :in_timestamp => Time.parse(time_in), :out_timestamp => time_out)
    end
    return teams
  end
  
  def self.full_filename_from(team_filename)
    return File.expand_path(CONFIG[:data_root] + "/#{team_filename}.team")
  end
  
  def self.team_entries
    entries = []
    Dir.entries(CONFIG[:data_root]).each do |entry| 
      entries << entry.gsub(/.team/, "") if entry != "." && entry != ".." && entry != ".DS_Store"
    end
    return entries
  end
end