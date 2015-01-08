class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, root: false
  end

  private

    def user_params
      params.require(:user).permit(:name, :age)
    end
end
