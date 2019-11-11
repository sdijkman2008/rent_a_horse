class UsersController < ApplicationController

  def show
    @user = current_user.user.find(params[:id])
  end
end
