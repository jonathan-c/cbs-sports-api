class UpdatePlayersController < ApplicationController
  include UpdatePlayersHelper
  
  def basketball
    update_players("basketball")
  end

  def baseball
    update_players("baseball")
  end

  def football
    update_players("football")
  end
end
