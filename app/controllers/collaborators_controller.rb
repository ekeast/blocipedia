class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    @collaborator = @wiki.collaborators.new(user: @user)

    if @collaborator.save
      flash[:notice] = "Collaborator added successfully."
    else
      flash[:alert] = "Collaborator was not added successfully."
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.username} is no longer a collaborator."
    else
      flash[:alert] = "Collaborator was not successfully removed."
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end


end
