Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'blog_index#index'

  resources :posts

  get "/blog_index", to: "blog_index#index"
  get "/blog_index/show/:id", to: "blog_index#show"
  get "/blog_index/about", to:"blog_index#about"
  get "/blog_index/create", to:"blog_index#new"
  get "/blog_index/contact", to:"blog_index#contact"

end
