class WikiPolicy < ApplicationPolicy
  def update?
    user.present? && (!record.private? || record.user == user)
  end
end
