class ExperiencesController < ApplicationController
  def index
    if params[:category_id]
      category = Category.find(params[:category_id])
      render json: category.experiences
    end
  end

  def new
    @experience = Experience.new(venue_id: params[:venue_id])
  end

  def create
    @venue = Venue.find_by(id: params[:experience][:venue_id])
    @experience = @venue.experiences.build(experience_params)
    if @experience.save
      redirect_to venue_experience_path(@venue, @experience)
    else
      render :new
    end
  end

  def show
    if params[:venue_id]
      venue_variable
      experience_variable
      if user_signed_in?
        @comments = UserComment.new(experience_id: @experience.id, user_id: current_user.id)
      end
    end
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @experience }
    end
  end

  def edit
    if params[:venue_id]
      venue_variable
      experience_variable
    else
      @experience = Experience.find(params[:id])
    end
  end

  def update
    @venue = Venue.find_by(id: params[:experience][:venue_id])
    @experience = @venue.experiences.find_by(id: params[:id])
    if @experience.update(experience_params)
      redirect_to venue_experience_path(@venue, @experience)
    else
      render :edit
    end
  end

  def destroy
    venue_variable
    experience_variable
    @experience.destroy
    redirect_to venue_path(@venue)
  end

  private
    def experience_params
      params.require(:experience).permit(:title, :genre, :description, :venue_id, category_ids:[], categories_attributes: [:name])
    end

    def venue_variable
      @venue = Venue.find_by(id: params[:venue_id])
    end

    def experience_variable
      @experience = venue_variable.experiences.find_by(id: params[:id])
    end


end
