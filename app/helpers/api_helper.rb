module ApiHelper

  def player_hash(player, apad)
    { :id => player.id,
      :name_brief => player.name_brief,
      :first_name => player.first_name,
      :last_name => player.last_name,
      :position => player.position,
      :age => player.age,
      :average_position_age_diff => apad }
  end

end
