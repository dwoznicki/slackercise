class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    p params
    p "*" * 50
    p user_params
    @user = User.new(user_params)
    if @user.save
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      puts "woops"
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :points, :team_id, :name, :real_name, :first_name, :last_name, :image_original, :email)
  end
end
