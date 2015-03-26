class Player < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name, :position, :cbs_id, :sport

  def name_brief
    if self.sport == "basketball"
      first_name+" "+last_name[0]+"."
    elsif self.sport == "baseball"
      first_name[0]+". "+last_name[0]+"." if !first_name.blank?
    elsif self.sport == "football"
      first_name[0]+". "+last_name if !first_name.blank?
    else
    end
  end

  def average_position_age_diff
    # What if age is NULL?
    # NULL values are causing this function to be inaccurate
    Player.average(:age, :conditions => {:position => self.position, :sport => self.sport}).to_f
  end

end
