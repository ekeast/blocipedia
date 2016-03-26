class CollaboratorsController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = collaborators.build(wiki: @wiki, user: @user)

    if collaborator.save
      flash[:notice] = "Collaborator added successfully."
    else
      flash[:alert] = "Collaborator was not added successfully."
    end
  end

  def destroy
  end
end
