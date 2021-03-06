class UsersController < ApplicationController
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
    
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path , notice: 'プロフィールを更新しました'
    else
      render 'edit'
    end
  end

  def followings
     @user = User.find(params[:id])
     @followings = @user.following_users
  end
  def followers
     @user = User.find(params[:id])
     @followers = @user.follower_users
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :area, :profile)
  end
end