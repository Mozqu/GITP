Rails.application.routes.draw do
  get 'comments/index'

  get 're_posts/index'

  get 'responses/index'

  get 'boards/index'

  get 'followers/index'

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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
