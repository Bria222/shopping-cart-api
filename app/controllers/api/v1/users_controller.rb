class Api::V1::UsersController < ApplicationController
  def index
    @users = User.order('created_at desc')
    if @users
      render json: @users, status: :ok
    else
      render json: @users.errors.full_messages, status: :bad_request
    end
  end

  def show
    @user = User.where(id: params[:id])
    if @user
      render json: @user, status: :ok
    else
      render json:'no user was found', status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user,status: 201
    else
      render json: @user.errors.full_messages, status: 500
    end

  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.destroy
      render json: 'user successfully deleted', status: 200
    else
      render json: 'unable to delete this user', status: unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    render json: 'user updated successfully', status: 201
    else
      render json: 'failed to update user', status: unprocessable_entity
    end
  end

 private

 def user_params
  params.require(:user).permit(:name, :email, :password)
end

end
