Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'top/:id/edit' => 'homes#edit'
  patch 'top/:id/update' => 'homes#update'
  get 'top/practice_new' => 'homes#new'
  post 'top/practice_create' => 'homes#create'
end
