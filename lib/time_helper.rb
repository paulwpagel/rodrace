

module TimeHelper
  
  def self.in_minutes(seconds)
    minutes = seconds / 60
    seconds = seconds % 60
    return "#{left_pad(minutes)}:#{left_pad(seconds)}"
  end
  
  def self.left_pad(integer)
    return "0#{integer}" if integer.to_s.size == 1
    return integer
  end
end