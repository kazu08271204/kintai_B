class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy] 
    #index,show,edit,updateアクションが実行される直前のみ、logged_in_userが実行
  before_action :correct_user, only: [:edit, :update]
 
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  
  
  def show
  end
  
  
  
  def new
    @user = User.new  # ユーザーオブジェクトを生成し、インスタンス変数に代入します。
  end
  
  def create
    @user = User.new(user_params)# 保存成功後、ログインします。
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = "新規作成に成功しました。"
       redirect_to @user #=redirect_to user_url(@user)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデーターを削除しました。"
    redirect_to users_url
  end



  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
   # beforeフィルター

  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
     # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  end


   # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?# unless ~ end 条件式がfalseの時、処理が実行される構文
      store_location
      flash[:danger] = "ログインしてください。"# :danger→赤色 
      redirect_to login_url 
    end
  end 
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
  end
  
  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  
end 




