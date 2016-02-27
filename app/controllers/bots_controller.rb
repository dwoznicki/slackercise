class BotsController < ApplicationController
	def new
		p "*" * 50
		p params
	end

	def create
		p "-" * 50
		p params
		redirect_to root_path
	end
end
