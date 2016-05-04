ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  post '/links' do
    link = Link.create(url: params[:URL], title: params[:Title])
    tag = Tag.create(name: params[:tag])
    link.tag << tag
    link.save
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
