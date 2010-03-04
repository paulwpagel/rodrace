require "persistor"
class TeamEntry
  attr_reader :team_number, :in_timestamp, :out_timestamp
  
  def initialize(options = {})
    @team_number = options[:team_number]
    @in_timestamp = options[:in_timestamp]
    @out_timestamp = options[:out_timestamp]
  end
  
  def save
    Persistor::save_team_entry(self)
  end
  
  def self.load_from(data_elements)
    entry = TeamEntry.new(data_elements)
    return entry
  end
  
  def self.load_teams
    Persistor::load_teams
  end
  
  def self.find(conditions = {})
    Persistor::load_teams.each do |team|
      return team if team.team_number == conditions[:team_number]
    end
  end
  
  def checkin
    @in_timestamp = Time.now
  end
  
  def checkout
    @out_timestamp = Time.now
  end

end