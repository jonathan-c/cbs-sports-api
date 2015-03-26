class FootballPlayersController < ApplicationController
  include ApiHelper

  def index
    @players = Player.where(sport: "football")
    render json: @players.map { |player| player_hash(player) }
  end

  def show
    @player = Player.find(params[:id])
    render json: player_hash(@player)
  end

end
