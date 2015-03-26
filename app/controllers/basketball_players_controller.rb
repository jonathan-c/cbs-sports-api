class BasketballPlayersController < ApplicationController
  include ApiHelper
  before_filter :load_apad

  def index
    @players = Player.where(sport: "basketball")
    render json: @players.map { |player|
      apad = return_basketball_apad(player)
      player_hash(player, apad)
    }
  end

  def show
    @player = Player.find(params[:id])
    render json: player_hash(@player, Player.apad(@player.position, "basketball"))
  end

  private

    # Save the average_position_age_diff for each position
    # This allows us to only make the query once
    def load_apad
      @sf ||= Player.apad("SF", "basketball")
      @sg ||= Player.apad("SG", "basketball")
      @c ||= Player.apad("C", "basketball")
      @pg ||= Player.apad("PG", "basketball")
      @pf ||= Player.apad("PF", "basketball")
      @g ||= Player.apad("G", "basketball")
      @f ||= Player.apad("F", "basketball")
    end

    # Allows the controller to dynamically find the average_position_age_diff
    def return_basketball_apad(player)
      case player.position
      when "SF"
        apad = @sf
      when "SG"
        apad = @sg
      when "C"
        apad = @c
      when "PG"
        apad = @pg
      when "PF"
        apad = @pf
      when "G"
        apad = @g
      when "F"
        apad = @f
      end
    end

end
