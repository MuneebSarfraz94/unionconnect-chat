Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  resources :conversations do
    resources :chat_messages
    match 'chat_messages', to: 'chat_messages#create', :via => 'options'
    resources :chat_participants
  end

end
