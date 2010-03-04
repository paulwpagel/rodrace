module CheckoutConfirm
  
  def mouse_clicked(event = nil)
    team_number = self.id.gsub(/checkout_/, "")
    scene.build(:team_number => team_number) do
      __install "main/checkout_confirm_props.rb", :team_number => @team_number
    end
    
  end
end