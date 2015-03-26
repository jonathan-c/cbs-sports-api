class UpdatePlayersController < ApplicationController
  include UpdatePlayersHelper

  def basketball
    update_players("basketball")
    @total = Player.where(sport: "basketball").count
  end

  def baseball
    update_players("baseball")
    @total = Player.where(sport: "baseball").count
  end

  def football
    update_players("football")
    @total = Player.where(sport: "football").count
  end
end
