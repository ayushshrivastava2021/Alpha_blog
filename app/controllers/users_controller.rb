class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

    def show
      @articles = @user.articles
    end

    def index
      @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
      @user = User.new
    end
    def edit

    end

    def update
      if @user.update(user_params)
        flash[:notice] = "Your profile successfully updated"
        redirect_to user_path
      else 
        render 'edit'
      end

    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice]= "Welcome to Alphablog #{@user.username}, You are successfully signed up "
        redirect_to articles_path
      else
        render 'new'
      end
    end
  
    private

    def user_params
      params.require(:user).permit(:username,:email,:password,)
    end

    def set_user
      @user = User.find(params[:id])
    end


end