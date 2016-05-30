class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.new
    
    if @user.save
      render :show
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end

  def show
  end

  def update
    @user.update(user_params)
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_title, :current_employer, :graduation_date, :cohort_id, :user_type, :phone)
    end
end
