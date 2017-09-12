class UsersController < ApplicationController
 #before_action :admin_user,     only: [:index, :destroy]
 
  def new
  	@user = User.new
    @skill = Skill.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    	redirect_to @user
    else
      flash[:error] =  @user.errors.full_messages.join(', ')  
      redirect_to :action => 'new'
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @skill = Skill.all
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end  


  def current_user_home
    redirect_to @current_user
  end

  private
  def user_params
    params.require(:user).permit(:role, :name,:email, :password, :password_confirmation, :skill_ids => [])
  end
end
