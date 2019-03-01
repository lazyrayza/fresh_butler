class UsersController < ApplicationController
before_action :find_user, only: [:show, :update, :destroy, :edit]

  def index
    @butlers = User.where(butler: true)
    @butlers = @butlers.select{ |butler| butler.latitude != nil && butler.longitude != nil}

    @markers = @butlers.map do |butler|
      {
        lng: butler.longitude,
        lat: butler.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { butler: butler }),
        image_url: helpers.asset_url('butler.png')
      }
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def update
    if @user.update(users_params)
      redirect_to profile_path, notice: 'User was updated!'
    else
      render :new
    end
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to user_session_path(@user), notice: 'User has been made!'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to new_user_session_path
  end

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :butler)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
