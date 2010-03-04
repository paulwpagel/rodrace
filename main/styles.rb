@@secondary_bg_color = "f7f7ff"
@@table_header_text_color = "2060a0"

list_teams {
  horizontal_alignment "center"  
  width "100%"
}

team_row_common{
  width "100%"
  border_width "1"
  border_color "3B75AF"
}

expired_team_row {
  extends :team_row_common
  background_color :green  
}

team_row {
  background_color :red  
  extends :team_row_common
}

warning_team_row{
  background_color :yellow 
  extends :team_row_common  
}

team_number_cell {
  border_width 1
  border_color "204060"
  width "20%"
}

ticket_table {
  transparency "25%"
  width "100%"
  right_margin 15
  bottom_margin 15
  left_margin 15
  rounded_corner_radius 10
  padding 15
  border_width 1
  border_color "204060"
  background_color "e0e0f0"
  secondary_background_color @@secondary_bg_color
  gradient :on
}

header_row {
  width "100%"
  transparency 100
  height 50
}

header_cell {  
  width "24%"
  top_padding 7
  height "100%"
}

header {
  font_size 12
  text_color @@table_header_text_color
  font_style :bold
}

cell {
  width "24%"
}

action_text {
  padding 3
  hover {
    text_color "2564A3"
    bottom_border_color "2564A3"
  }
}


checkout_confirm_modal {
  float "on"
  x 0
  y 0
  width "100%"
  height "100%"
  background_color "black"
  transparency "50"
  horizontal_alignment "center"
  vertical_alignment "center"
}


confirmation_box {
  padding 20
  border_width 1
  border_color "204060"
  background_color @@secondary_bg_color
  secondary_background_color "DDD"
  gradient :on
  gradient_angle 270
  gradient_penetration 100
  rounded_corner_radius "10"
  horizontal_alignment "center"
  vertical_alignment "center"
  width 500
}

confirmation_message{
  font_size 20
  width 500
  horizontal_alignment "center"
  vertical_alignment "center"
  padding 22
}


cancel_checkout_button {
  font_size 24
  width "50%"
  border_color "black"
  background_color @@secondary_bg_color
  rounded_corner_radius "10"
  border_width 2
  horizontal_alignment "center"
  vertical_alignment "center"
  margin 10
  padding 5
  hover {
    background_color "#CCCCCC"
  }
}

checkout_confirm_button{
  font_size 24
  width "50%"
  border_color "black"
  background_color @@secondary_bg_color
  rounded_corner_radius "10"
  border_width 2
  horizontal_alignment "center"
  vertical_alignment "center"
  margin 10
  padding 5
  hover {
    background_color "#CCCCCC"
  }}
