Rails.application.routes.draw do

  get 'homes/index' => 'homes#index'


  post 'board_likes/:id/create_like' => 'board_likes#create_like'
  post 'board_likes/:id/destroy_like' => 'board_likes#destroy_like'
  post 'board_likes/:id/create_dislike' => 'board_likes#create_dislike'
  post 'board_likes/:id/destroy_dislike' => 'board_likes#destroy_dislike'


  get 'comments/index'

  get 're_posts/index'

  get 'responses/index'
  post 'responses/:id/create' => 'responses#create'
  post 'response/:id/destroy' => 'responses#destroy'

  get 'boards/index' => 'boards#index'
  get 'boards/new' => 'boards#new'
  get 'boards/post_test' => 'boards#post_test'
  get 'boards/:id/edit' => 'boards#edit'
  get 'boards/:id' => 'boards#show'
  post 'boards/create' => 'boards#create'
  post 'boards/update' => 'boards#update'
  post 'boards/:id/destroy' => 'boards#destroy'

  get 'followers/index'
  post 'followers/:id/create' => 'followers#create'

  get 'likes/index'

  get 'users/index'
  get 'users/:id' => 'users#show'

  get 'posts/index'
  get 'posts/new' => 'posts#new'
  get 'posts/post_test' => 'posts#post_test'
  get 'posts/image_index' => 'posts#image_index'
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
  get "login_form" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/likes" => "users#likes"

#likes　by Motoya#
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
