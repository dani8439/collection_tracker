# class CollectionsController < ApplicationController
#
#   get '/collections' do
#     @collection = Collection.all
#     @user = User.find_by(params[:user_id])
#     if logged_in?
#       erb :'/collections/collections'
#     else
#       redirect :'/login'
#     end
#   end
#
#   get '/collections/new' do
#     if logged_in?
#       erb :'/collections/create_collection'
#     else
#       redirect :'/login'
#     end
#   end
#
#   get '/collections/:id' do
#     if logged_in?
#       @collection = Collection.find_by_id(params[:id])
#       erb :'/collections/show_collection'
#     else
#       redirect :'/login'
#     end
#   end
#
#   # Do I need this? Want to edit Pieces a collector has, not collection itself?
#   get '/collections/:id/edit' do
#     if logged_in?
#       @collection = Collection.find_by_id(params[:id])
#       erb :'/collections/edit'
#     else
#       redirect :'/login'
#     end
#   end
#
#   post '/collections' do
#     if !params[:collection][:user_id].empty?
#       @collection = Collection.create(params[:collection])
#       @collection.user_id = @user.id
#       @collection.save
#       erb :'/collections/show_collection'
#     else
#       redirect :'/collections/new'
#     end
#   end
#
#   patch '/collections/:id' do
#     # @collection = Collection.find_by_id(params[:id])
#     # if !params[:collection][:]
#   end
#
#   delete '/collections/:id/delete' do
#   end
# end
