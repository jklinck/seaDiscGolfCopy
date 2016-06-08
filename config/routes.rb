Rails.application.routes.draw do
  # USERS ROUTES
  get 'users' => 'users#index'

  post 'users' => 'users#create'

  get 'users/new' => 'users#new'

  get 'users/login' => 'users#login'
  # shows user login page

  post 'users/login' => 'users#userLogin'
  # logs in a user

  post 'users/logout' => 'users#logout'
  # logs out a user

  get 'users/:id' => 'users#show'
  # shows a single users profile page

  get 'users/edit/:id' => 'users#edit'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#delete'


  # COURSES ROUTES
  get '/' => 'courses#index'
  # shows all courses

  get 'courses/new' => 'courses#new'
  # shows page to add courses

  get 'courses/:id' => 'courses#show'
  # shows a single courses page/profile

  post 'courses/new' => 'courses#create'
  # creates a new course

  get 'courses/edit/:id' => 'courses#edit'

  patch 'courses/:id' => 'courses#update'

  delete 'courses/:id' => 'courses#delete'


  # COMMENTS ROUTES
  post 'comments' => 'comments#create'

  get 'comments/edit/:id' => 'comments#edit'

  patch 'comments/:id' => 'comments#update'

  delete 'comments/:id' => 'comments#delete'
end
