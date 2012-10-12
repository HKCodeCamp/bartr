class UsersController < ApplicationController
  before_filter :find_user,                 except: [:index]
  before_filter :authenticate_current_user, only: [:edit, :update, :follow, :un_follow]

  def index
    @users = User.active_sellers
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      render :action => :show
    else
      render :action => :edit
    end
  end

  def follow
    following = @user.followings.build(:follower_id => current_user.id)
    if following.save
      render :action => :show
    else
      render404
    end
  end

  def un_follow

  end

private
  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render404
  end

  def authenticate_current_user
    current_user == @user || render404
  end

end
