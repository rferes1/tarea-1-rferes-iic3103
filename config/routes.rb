Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'pages/show_episode/:eid', to: 'pages#show_episode', as: 'episode'

  get 'pages/show_character/:character_name', to: 'pages#show_character', as: 'character'


 
end
