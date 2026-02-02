class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @articles = @user.articles.published.recent
    @collections = @user.collections.recent
    @followers = @user.followers
    @following = @user.following_users
  end

  def follow
    authorize @user, policy_class: ProfilePolicy
    current_user.follow(@user)
    redirect_to profile_path(@user.username), notice: "You are now following #{@user.username}."
  end

  def unfollow
    authorize @user, policy_class: ProfilePolicy
    current_user.unfollow(@user)
    redirect_to profile_path(@user.username), notice: "You unfollowed #{@user.username}."
  end

  private

  def set_user
    @user = User.find_by!(username: params[:username])
  end
end
