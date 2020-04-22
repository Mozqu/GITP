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

 get 'signup' => 'users#new'
 post 'users/create' => 'users#create'
 get "users/index" => "users#index"
 get "users/:id" => "users#show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
