Rails.application.routes.draw do
  get 'comments/index'

  get 're_posts/index'

  get 'responses/index'

  get 'boards/index'

  get 'followers/index'

  get 'likes/index'

  get 'users/index'

  get 'posts/index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
