class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def update
    respond_to do |format|
      if @book.update(user_params)
        format.html { redirect_to @user, notice: 'koushin dekitayo'}
        format.json { head :no_conten}
      else
        format.html { render action: 'edit'}
        # format.json {                                                                                                                           render json: @users.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
