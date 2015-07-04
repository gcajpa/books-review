Rails.application.routes.draw do

  root 'login#new'

  get 'login' => 'login#new'
  post 'login' => 'login#create'
  delete 'logout' => 'login#destroy'

  get 'signup' => 'signup#new'
  post 'signup' => 'signup#create'

  get 'password/request' => 'password_request#new', as: 'request_password_new'
  post 'password/request' => 'password_request#create', as: false

  get   'password/reset' => 'password_reset#edit', as: 'reset_password'
  patch 'password/reset' => 'password_reset#update', as: false

  get 'user/new' => 'user#new'
  post 'user/create' => 'user#create'

  get ':user_id/books' => 'books#index'

  get 'books' => 'books#index'
  post 'books/new' => 'books#create', as: 'new_book'
  post 'books/update' => 'books#batch_update', as: 'edit_books'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id/edit' => 'books#update', as: false
  get 'books/:id/remove' => 'books#remove', as: 'delete_book'
  delete 'books/:id/remove' => 'books#destroy', as: false

end
