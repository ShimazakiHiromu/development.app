class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url, notice: 'アカウントが作成されました。ログインしてください。'  # 新規登録後、ログインページへリダイレクト
    else
      flash.now[:alert] = 'アカウントの作成に失敗しました。もう一度お試しください。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
