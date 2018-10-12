class PatternsController < ApplicationController
  get '/patterns' do
    @pattern = Pattern.all
    erb :'patterns/patterns'
  end


  get '/patterns/new' do
    if logged_in?
      erb :'patterns/new'
    else
      redirect :'/login'
    end
  end

  get '/patterns/:id' do
    if logged_in?
      @pattern = Pattern.find_by_id(params[:id])
      erb :'patterns/show_pattern'
    else
      redirect :'/login'
    end
  end

  post '/patterns' do
    if params[:name] == "" || params[:quantity] == ""
      flash[:message] = "You need to fill in all fields to create a Pattern."
      redirect :'/patterns/new'
    else
      @pattern = Pattern.create(name: params[:name], quantity: params[:quantity])
      if !params[:piece][:name].empty?
        # @piece1.patterns << pattern
        @pattern.pieces << Piece.create(name: params[:piece][:name], size: params[:piece][:size])
      end
      @pattern.save
      flash[:message] = "Successfully created pattern."
      redirect :"/patterns/#{@pattern.id}"
    end
  end

  # post '/patterns' do
  #   @pattern = Pattern.create(name: params[:name], theme: params[:theme])
  #   if !params[:piece][:name].empty?
  #     @pattern.pieces << Piece.create(name: params[:piece][:name], size: params[:piece][:size], quantity: params[:piece][:quantity])
  #   end
  #   @pattern.save
  #   flash[:message] = "Successfully created pattern."
  #   redirect :"/patterns/#{@pattern.id}"
  # end

  get '/patterns/:id/edit' do
    if logged_in?
      @pattern = Pattern.find_by_id(params[:id])
      erb :'/patterns/edit'
    else
      redirect :'/login'
    end
  end

  patch '/patterns/:id' do
    @pattern = Pattern.find(params[:id])
    @pattern.update(params[:pattern])
    if !params[:piece][:name].empty?
      @pattern.pieces = Piece.create(name: params[:piece][:name], size: params[:piece][:size])
    end
    @pattern.save

    redirect :"patterns/#{@pattern.id}"
  end

  delete '/patterns/:id/delete' do
    @pattern = Pattern.find_by_id(params[:id])
    if logged_in?
      if @pattern && @pattern.user_id == current_user
        @pattern.delete
      end
      redirect :'/patterns'
    else
      redirect :'/login'
    end
  end
end
