class UsersController < ApplicationController

  def index
    @users = User.order(points: :desc)
  end

  def create

    @user = User.find_or_initialize_by(email: params[:user][:email])

    if @user.update_attributes!(user_params)
      @user.update_attributes!(points: @user.points + 1)
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      puts "woops"
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :points, :team_id, :name, :real_name, :first_name, :last_name, :image, :email)
  end
end
