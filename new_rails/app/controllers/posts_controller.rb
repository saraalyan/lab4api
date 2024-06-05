class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    render json: { status: 'success', data: @posts }
  end

  # GET /posts/1 or /posts/1.json
  def show
    render json: { status: 'success', data: @post }
  end

  # GET /posts/new
  def new
    @post = Post.new
    render json: { status: 'success', data: @post }
  end

  # GET /posts/1/edit
  def edit
    render json: { status: 'success', data: @post }
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: { status: 'created', data: @post }, status: :created, location: @post
    else
      render json: { status: 'error', errors: @post.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      render json: { status: 'updated', data: @post }, status: :ok, location: @post
    else
      render json: { status: 'error', errors: @post.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    render json: { status: 'deleted' }, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :user_id)
  end
end
