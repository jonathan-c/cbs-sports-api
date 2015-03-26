require 'open-uri'

module UpdatePlayersHelper

  def update_players(sport)
    url = "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=#{sport}&response_format=JSON"
    buffer = open(url).read
    result = JSON.parse(buffer)

    result["body"]["players"].each do |player|

      conditions = { :first_name => player["firstname"],
                 :last_name => player["lastname"],
                 :cbs_id => player["id"] }

      player_obj = Player.find(:first, :conditions => conditions) || Player.create(conditions)

      player_obj.update_attributes(position: player["position"], age: player["age"], sport: sport)

    end
  end

end
