modal_base(:id => "checkout_confirm_modal") {
  confirmation_box {
    confirmation_message :text => "Are you sure you want to checkout \"#{@team_number}\"", :id => "confirmation_message"
    checkout_confirm_button :text => "Checkout", :id => "confirm_checkout_#{@team_number}", :players => "checkout"
    cancel_checkout_button :text => "Cancel", :id => "cancel_checkout_#{@team_number}", :players => "cancel_checkout"
  }
}
