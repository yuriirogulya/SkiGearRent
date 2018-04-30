class UsersController < ApplicationController
  def index
    @users = User.all
    render json: JSON.pretty_generate(@users.as_json)
  end #index

  def show
    @user = User.find(params[:id])
    render json: JSON.pretty_generate(@user.as_json)
  end #show
end #UserController
