require 'sinatra'
require 'json'
require 'rubygems'


def all_data
  json = IO.read("roster.json")
  teams = JSON.parse(json)
end


get "/teams" do
  erb :indext, locals: { all_data: all_data }
end

get "/teams/:team_name" do
  erb :showt, locals: { team_name: params[:team_name], all_data: all_data }
end

###################################################
first_team = all_data.values[0]
position_list = first_team.keys


get "/positions" do
  erb :indexp, locals: { position_list: position_list }
end

get "/positions/:position_name" do
  erb :showp, locals: { position_name: params[:position_name], all_data: all_data, position_list: position_list }
end
