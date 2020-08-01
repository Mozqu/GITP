Rails.application.routes.draw do

  get 'comments/index' => 'comments#index'
  get 'comments/new' => 'comments#new'
  get 'communities/index' => 'communities#index'
  get 'communities/create_form' => 'communities#new'
  get 'communities/:id' => 'communities#show'
  post 'communities/create' => 'communities#create'
  post 'communities/:id/home' => 'communities#home'
  post 'communities/:id/board' => 'communities#board'
  post 'communities/:id/member' => 'communities#member'
  post 'communities/:id/media' => 'communities#media'
  post 'communities/:id/add_member' => 'communities#add_member'
  post 'communities/:id/remove_member' => 'communities#remove_member'


  get 'practice/index'
  post 'practice/index'

  get 'homes/index' => 'homes#index'
  get 'homes/sort' => 'homes#sort'
  post 'homes/sort' => 'homes#sort'

  resources :homes
   root 'homes#index'

  post 'board_likes/:id/create_like' => 'board_likes#create_like'
  post 'board_likes/:id/destroy_like' => 'board_likes#destroy_like'
  post 'board_likes/:id/create_dislike' => 'board_likes#create_dislike'
  post 'board_likes/:id/destroy_dislike' => 'board_likes#destroy_dislike'




  get 're_posts/index'

  post 'responses/:id/create' => 'responses#create'
  delete 'response/:id/destroy' => 'responses#destroy'

  get 'boards/index' => 'boards#index'
  get 'boards/new' => 'boards#new'
  get 'boards/post_test' => 'boards#post_test'
  get 'boards/:id/edit' => 'boards#edit'
  get 'boards/:id' => 'boards#show'
  post 'boards/create' => 'boards#create'
  post 'boards/update' => 'boards#update'
  delete 'boards/:id/destroy' => 'boards#destroy'

  get 'followers/index'
  post 'followers/:id/create' => 'followers#create'
  post 'followers/:id/destroy' => 'followers#destroy'

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
  delete 'posts/:id/destroy' => 'posts#destroy'



#ユーザー系　by　Motoya#
  get "users/:id/edit" => "users#edit"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "login_form" => "users#login_form"
  get "users/:id/likes" => "users#likes"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  post "users/:id/action" => "users#action"
  post 'users/:id/home' => 'users#home'
  post 'users/:id/media' => 'users#media'

#likes　by Motoya#
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
