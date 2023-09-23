class UsersController < ApplicationController
def index
@users = User.all
end
  def show
  @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
  @user=User.create(user_params)
  if @user.save
    redirect_to @user
  else
    render :new, status: :unprocessable_entity
  end
end

  # strong parameters
  private
  def user_params
    params.require(:user).permit(:name, :email,:password,:password_confirmation)
end
end