Rails.application.routes.draw do
  get 'comments/index'
  get 're_posts/index'
  get 'responses/index'
  get 'boards/index'
  get 'followers/index'
  get 'likes/index'
  get 'users/index'
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
