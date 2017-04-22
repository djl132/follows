Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'application#angular'



  resources :questions do

      resources :answers, except: [:index]

    end

    resources :groups do

      resources :questions

    end


    resources :answers, only: [] do

      resources :comments, only: [:create, :destroy]

      member do
        post '/up-vote' => 'votes#up_vote', as: :up_vote
        post '/down-vote' => 'votes#down_vote', as: :down_vote
        # put '/upvote' => 'answers#upvote'
        # put '/dwonvote' => 'answers#downvote'
      end

    end
end
