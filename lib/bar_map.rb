module BarMap
  
  def self.checkpoint(checkpoint)
    CONFIG[:checkpoint] = "1" if checkpoint == :innertown
    CONFIG[:checkpoint] = "2" if checkpoint == :phylis
    CONFIG[:checkpoint] = "3" if checkpoint == :happy_village
    CONFIG[:checkpoint] = "4" if checkpoint == :mahoneys
    CONFIG[:checkpoint] = "5" if checkpoint == :five_star
    CONFIG[:checkpoint] = "6" if checkpoint == :empty_bottle
    
  end
  
end