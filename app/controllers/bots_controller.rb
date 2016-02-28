require 'pp'
class BotsController < ApplicationController
	def new
		oauth_response = HTTParty.post("https://slack.com/api/oauth.access?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&code=#{params['code']}")
		pp oauth_response
		redirect_to root_path
	end

	def create
		p "-" * 50
		p params
		redirect_to root_path
	end
end
