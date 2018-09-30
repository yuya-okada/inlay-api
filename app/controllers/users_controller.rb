class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def create

    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /user
  def show
    render json: current_user
  end

  # PATCH /user
  def update
    user = User.find_by(uid: request.headers[:uid])
    if user.update(user_params)
        render json: user
    else
        render json: user.errors, status: :unprocessable_entity
    end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      allowedParamsKey = [:email, :password, :uid, :name, :nickname, :image]
      resultData = {}
      for key in allowedParamsKey
        resultData[key] = params.fetch(key, "")
      end
      
      return resultData
    end
end
