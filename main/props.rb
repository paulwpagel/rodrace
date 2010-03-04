main {
  center{
    heading :text => "Enter Team Number"
        
    input_section {
      label :text => "Team number: "
      text_box :id => "team_number", :width => 150
      button :players => "checkin", :id => "checkin_team_button", :text => "Checkin", :width => 150
    }
    
    ticket_table {
      header_row {
        header_cell {
          label :id => "title_header", :text => "Team Number", :name => "header"
        }
        header_cell {
          label :id => "in_time_header", :text => "Check - In Time", :name => "header"
        }
        header_cell {
          label :id => "ttc_header", :text => "Time to Checkout", :name => "header"
        }
        header_cell {
          label :id => "actions_header", :text => "Actions", :name => "header"
        }
      }
      list_teams(:id => "list_teams")
    }
  }
}