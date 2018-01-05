class UserExperiencesController < ApplicationController

  def create
  userexperience = UserExperience.find_or_create_by(experience_id: params[:experience_id], user_id: current_user.id)
  if userexperience
    redirect_to user_path(current_user)
  else
    redirect_to root_path
  end
end

end
