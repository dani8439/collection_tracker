class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect :'/collections'
    else
      erb :'users/create_user'
    end
  end

  get '/login' do
    if logged_in?
      redirect :'/collections'
    else
      erb :'users/login'
    end
  end

  get '/logout' do
    logout
    redirect :'/login'
  end

end
