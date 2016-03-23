class UsersController < ApplicationController
  def downgrade
    current_user.standard!
    current_user.wikis.update_all(private:false)
    redirect_to wikis_path
  end
end
