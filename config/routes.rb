Rails.application.routes.draw do
  get 'comments/index'

  get 're_posts/index'

  get 'responses/index'

  get 'boards/index'

  get 'followers/index'

  get 'likes/index'



  get 'posts/index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'


#ユーザー登録系　by　Motoya#
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
