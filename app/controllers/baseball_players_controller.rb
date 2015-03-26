class BaseballPlayersController < ApplicationController
  include ApiHelper
  before_filter :load_apad

  def index
    @players = Player.where(sport: "baseball")
    render json: @players.map { |player|
      apad = return_baseball_apad(player)
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

    def load_apad
      @firstb ||= Player.apad("1B", "baseball")
      @secondb ||= Player.apad("2B", "baseball")
      @thirdb ||= Player.apad("3B", "baseball")
      @ps ||= Player.apad("PS", "baseball")
      @rp ||= Player.apad("RP", "baseball")
      @lf ||= Player.apad("LF", "baseball")
      @rf ||= Player.apad("RF", "baseball")
      @c ||= Player.apad("C", "baseball")
      @sp ||= Player.apad("SP", "baseball")
      @ss ||= Player.apad("SS", "baseball")
      @p ||= Player.apad("P", "baseball")
      @cf ||= Player.apad("CF", "baseball")
      @dh ||= Player.apad("DH", "baseball")
      @of ||= Player.apad("OF", "baseball")
    end

    def return_baseball_apad(player)
      case player.position
      when "PS"
        apad = @ps
      when "RP"
        apad = @rp
      when "1B"
        apad = @firstb
      when "LF"
        apad = @lf
      when "RF"
        apad = @rf
      when "2B"
        apad = @secondb
      when "C"
        apad = @c
      when "SP"
        apad = @sp
      when "SS"
        apad = @ss
      when "3B"
        apad = @thirdb
      when "P"
        apad = @p
      when "CF"
        apad = @cf
      when "DH"
        apad = @dh
      when "OF"
        apad = @of
      end
    end

end
