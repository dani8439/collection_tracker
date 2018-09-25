class CollectionsController < ApplicationController

  get '/collections' do
    @collection = Collections.all
    @user = User.find_by(params[:user_id])
    if logged_in?
      erb :'/collections'
  end
end
