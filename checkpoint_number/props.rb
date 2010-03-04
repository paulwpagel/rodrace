main {
  center{
    heading :text => "Enter Checkpoint"
        
    input_section {
      input_row{
        label :text => "Innertown: "
        innertown :players => "check_box"
      }
      input_row{
        label :text => "Phylis's: "
        phylis :players => "check_box"
      }
      input_row{
        label :text => "Happy Village: "
        happy_village :players => "check_box"
      }
      input_row{      
        label :text => "Mahoney's: "
        mahoneys :players => "check_box"
      }
      input_row{      
        label :text => "Five Star: "
        five_star :players => "check_box"
      }
      input_row{      
        label :text => "Empty Bottle: "
        empty_bottle :players => "check_box"
      }
    }
  }
}