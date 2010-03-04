require "team_entry"
require "time_helper"
TWENTY_MINUTES = 1200
FIVE_MINUTES = 300
module ListTeams
  
  def list_teams
    teams_prop = scene.find("list_teams")
    teams_prop.remove_all
    
    TeamEntry.load_teams.each do |team|
      seconds = ((team.in_timestamp + TWENTY_MINUTES) - Time.now).to_i
      row = nil
      if seconds > 30 && team.out_timestamp.nil?
        row = build_row(team, seconds, "team_row")
      elsif seconds > 0 && team.out_timestamp.nil?  
        row = build_row(team, seconds, "warning_team_row")  
      elsif team.out_timestamp.nil?
        row = build_row(team, seconds, "expired_team_row")
      end
      teams_prop.add(row) if row
    end
    
  end  
    
  def build_row(team, seconds, name)
    row = Limelight::Prop.new(:id => "row_#{team.team_number}", :name => name)
    row.add(Limelight::Prop.new(:text => team.team_number, :name => "cell"))
    row.add(Limelight::Prop.new(:text => team.in_timestamp.strftime("%H:%M:%S"), :name => "cell"))
    row.add(Limelight::Prop.new(:text => TimeHelper::in_minutes(seconds), :name => "cell"))
    
    actions_prop = Limelight::Prop.new(:name => "cell")
    actions_prop.add(Limelight::Prop.new(:text => "check out", :name => "action_text", :id => "checkout_#{team.team_number}", :players => "checkout_confirm"))
    row.add(actions_prop)
    return row
  end
  
  
end