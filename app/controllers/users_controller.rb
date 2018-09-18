class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /user
  def show
    render json: current_user
  end

  # PATCH /user
  def update
    user = User.find_by(uid: request.headers[:uid])
    puts "1"
    puts request.headers
    puts user_params
    if user.update(user_params)
        render json: user
    else
        render json: user.errors, status: :unprocessable_entity
    end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {})
    end
end
