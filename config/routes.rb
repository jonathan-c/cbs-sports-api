DraftCodeExercise::Application.routes.draw do

  get "update_players/basketball"
  get "update_players/baseball"
  get "update_players/football"

  scope "/api" do
    resources :basketball_players do
    end
    resources :baseball_players do
    end
    resources :football_players do
    end
  end


end
