class FootballPlayersController < ApplicationController
  include ApiHelper
  before_filter :load_apad

  def index
    @players = Player.where(sport: "football")
    render json: @players.map { |player|
      apad = return_football_apad(player)
      if apad
        player_hash(player, apad)
      else
        player_hash(player, player.average_position_age_diff)
      end
    }
  end

  def show
    @player = Player.find(params[:id])
    render json: player_hash(@player, @player.average_position_age_diff)
  end

  private

    # Save the average_position_age_diff for each position
    # This allows us to only make the query once
    def load_apad
      @qb ||= Player.apad("QB", "football")
      @wr ||= Player.apad("WR", "football")
      @rb ||= Player.apad("RB", "football")
      @te ||= Player.apad("TE", "football")
      @k ||= Player.apad("K", "football")
      @st ||= Player.apad("ST", "football")
      @lb ||= Player.apad("LB", "football")
      @dl ||= Player.apad("DL", "football")
      @db ||= Player.apad("DB", "football")
    end

    # Allows the controller to dynamically find the average_position_age_diff
    def return_football_apad(player)
      case player.position
      when "QB"
        apad = @qb
      when "WR"
        apad = @wr
      when "RB"
        apad = @rb
      when "TE"
        apad = @te
      when "K"
        apad = @k
      when "ST"
        apad = @st
      when "LB"
        apad = @lb
      when "DL"
        apad = @dl
      when "DB"
        apad = @db
      end
    end

end
