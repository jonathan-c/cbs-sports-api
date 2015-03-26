DraftCodeExercise::Application.routes.draw do
  get "update_players/basketball"

  get "update_players/baseball"

  get "update_players/football"

  # namespace :api do
  #   namespace :baseball do
  #     resources :players
  #   end
  #   namespace :basketball do
  #     resources :players
  #   end
  #   namespace :football do
  #     resources :players
  #   end
  # end

  scope "/api" do
    resources :basketball_players do
    end
  end


end
