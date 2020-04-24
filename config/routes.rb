Rails.application.routes.draw do
  get 'comments/index'

  get 're_posts/index'

  get 'responses/index'

  get 'boards/index'

  get 'followers/index'
  post 'followers/:id/create' => 'followers#create'

  get 'likes/index'

  get 'users/index'
  get 'users/:id' => 'users#show'

  get 'posts/index'
  get 'posts/new' => 'posts#new'
  get 'posts/image_index' => 'post#image_index'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'



#ユーザー系　by　Motoya#
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/likes" => "users#likes"

#likes　by Motoya#
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
