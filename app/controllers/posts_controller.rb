class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    json_response(@posts)
  end

  # POST /posts
  def create
    @posts = Post.create!(post_params)
    json_response(@posts, :created)
  end

  # GET /posts/:id
  def show
    json_response(@posts)
  end

  # PUT /posts/:id
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    # whitelist params
    params.permit(:title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
