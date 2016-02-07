require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'uri'
require 'net/http'
require 'json'


get '/' do
  erb :index
end

get '/uru' do
  suuji = params[:uruu].to_i
  if suuji%4==0 && suuji%100!=0
     @result = "閏年です"
   elsif suuji%4==0 && suuji%100==0 && suuji%400==0
     @result = "閏年です"
   else
     @result = "閏年ではないです"
   end
  erb :show
end

get '/football' do
  uri = URI.parse('http://api.football-data.org/v1/teams/5/players')
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)
  p result
  players = result['players'].map { |e| e['name']  }
  players
end
