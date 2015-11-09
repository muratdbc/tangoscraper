require './app'
require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cross_origin'

get '/api/events' do
  cross_origin
  Bar.all.to_json
end
get '/api/event/:id' do
  p params[:id]
   t = Bar.find(params[:id])
   p t
  if t.nil?
    halt 404
  end
  t.to_json
end