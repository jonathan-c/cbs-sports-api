class Player < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name, :position, :cbs_id, :sport

  def name_brief
    if !first_name.blank? && !last_name.blank?
      case self.sport
      when "basketball"
        "#{first_name} #{last_name[0]}."
      when "baseball"
        "#{first_name[0]}. #{last_name[0]}."
      when "football"
        "#{first_name[0]}. #{last_name}"
      else
        ""
      end
    end
  end

  def average_position_age_diff
    # There are errors in the CBS API. Some players are returning age 'NULL' or '2015'
    # which resulted in inaccurate average_position_age_diff values
    # Issue fixed by only querying players who are ages 1-100
    players = Player.where('age > 0').where('age < 100').where(sport: self.sport, position: self.position)
    ages = players.map{|player| player.age}
    (ages.sum.to_f / ages.length).to_s
  end

  def self.apad(position, sport)
    players = Player.where('age > 0').where('age < 100').where(sport: sport, position: position)
    ages = players.map{|player| player.age}
    (ages.sum.to_f / ages.length).to_s
  end

end
