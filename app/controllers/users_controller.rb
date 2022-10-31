class UsersController
  def update
    # only admins can elevate users to moderator status
    if can? :make_moderator, @user
      @user.moderator = params[:user][:moderator]
    end
  end
end