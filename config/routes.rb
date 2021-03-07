Rails.application.routes.draw do
  get 'books/index' => 'books#index'
  get 'books/show' => 'books#show'
  get 'books/edit' => 'books#edit'
  get 'homes/top' => 'homes#top'
  # ここあとでルートURLに変更する…'homes/top'を'/'にすればおけ？
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs
end
