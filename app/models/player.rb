class Player < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name, :position, :cbs_id, :sport

  def name_brief
    if self.sport == "basketball"
      first_name+" "+last_name[0]+"."
    elsif self.sport == "baseball"
      fisrt_name[0]+". "+last_name[0]+"."
    elsif self.sport == "football"
      first_name[0]+". "+last_name
    else
    end
  end

  def average_position_age_diff

  end

end
