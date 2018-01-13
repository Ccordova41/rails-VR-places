class UserCommentsController < ApplicationController
  before_action :experience_var, only: [:create, :update, :destroy]
  before_action :comments_var, only: [:edit, :update, :destroy]

  def index
    @comments = UserComment.all
    render json: @comments
  end

  def new
    @comments = UserComment.new(experience_id: params[:experience_id], user_id: current_user.id)
  end

  def create
    @comments = UserComment.new(experience_id: @experience.id, user_id: current_user.id, comments: params[:user_comment][:comments])
    if @comments.save
      render json: @comments
    else
      render :new
    end
  end

  def edit

  end

  def update
    if comments_var.update(comments: params[:user_comment][:comments])
      redirect_to venue_experience_path(experience_var.venue, experience_var)
    else
      render :edit
    end
  end

  def destroy
    comments_var.destroy
    redirect_to venue_experience_path(experience_var.venue, experience_var)
  end

  private
    def comments_var
      @comments = UserComment.find_by(id: params[:id])
    end

    def experience_var
      @experience = Artwork.find_by(id: params[:experience_id])
    end

end
