class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
    render json: { status: 'success', data: @users }
  end

  # GET /users/1 or /users/1.json
  def show
    render json: { status: 'success', data: @user }
  end

  # GET /users/new
  def new
    @user = User.new
    render json: { status: 'success', data: @user }
  end

  # GET /users/1/edit
  def edit
    render json: { status: 'success', data: @user }
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'created', data: @user }, status: :created, location: @user
    else
      render json: { status: 'error', errors: @user.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render json: { status: 'updated', data: @user }, status: :ok, location: @user
    else
      render json: { status: 'error', errors: @user.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    render json: { status: 'deleted' }, head: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
