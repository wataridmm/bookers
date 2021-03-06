Rails.application.routes.draw do
  root :to => 'books#top'
  get 'books/new'
  get 'top' => 'home#top'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'book_todolist'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
