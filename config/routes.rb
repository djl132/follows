Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do

      get '/followings' => 'followings#index'

      resources :questions do

          resources :answers, except: [:index]
          resources :followings, only: [:create, :destroy]


        end

        resources :groups do

          resources :questions

        end


        resources :answers, only: [] do

          resources :comments

            post '/up-vote' => 'votes#up_vote', as: :up_vote
            post '/down-vote' => 'votes#down_vote', as: :down_vote
            # put '/upvote' => 'answers#upvote'
            # put '/dwonvote' => 'answers#downvote'

        end
      end
    end


      root to: 'application#angular'

      # PASS ALL UNRECOGNIZED, FRONTEND(ANGULAR) ROUTES TO APPLICATION LAYOUT, WHERE UI-ROUTER EXISTS.
      get "*unmatched_route", to: "application#angular"
end
