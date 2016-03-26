class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, :through :collaborators

  def collaborator_for(user)
    collaborators.where(user_id: user.id).first
  end
end
# edit wiki
# link_to "manange collaborators", wiki_collaborators_path(@wiki)

# collaborators index html
# @users.each do |user|
# <tr>
# if @wiki.users.include?(user)
# collaborator = @wiki.collaborator_for(user)
# link_to "Remove", wiki_collaborator_path(@wiki, collaborator), method: :delete, class:...
# else
# add button
# link_to "Add", wiki_collaboratos_path(@wiki, user_id: user.id), method: :post
# params[:user_id] in controller will be that user's id for creating
# end
