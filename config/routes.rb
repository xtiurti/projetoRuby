Rails.application.routes.draw do

  resources :disciplines do  	
    resources :teaching_plans, controller: 'disciplines/teaching_plans'
  end

  get '/disciplines/teaching_plans/newDate'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
end
