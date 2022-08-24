class UsersController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def account
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def  update
    @user = User.find([:id])
    if @user.update(params.require(:user).permit(:user_avater, :name, :profile))
      flash[:notice] = "更新しました"
      redirect_to :users_profile_path
    else
    flash.now[:notice]="更新に失敗しました。もう一度入力し直してください"
      render "users/profile"
    end
  end

  def account
    @user = current_user
  end

end
