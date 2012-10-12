class UsersController < ApplicationController
  respond_to :json, :html

  before_filter :find_user,                 except: [:index]
  before_filter :authenticate_current_user, only: [:edit, :update]

  def index
    @users = User.active_sellers
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def edit
    respond_with(@user)
  end

  def update
    if @user.update_attributes(params[:user])
      render :action => :show
    else
      render :action => :edit
    end
  end

  def follow
    f = @user.followings.build(:followed_by_id => current_user.id)
    if  f.save
      redirect_to :action => :show
    else
      render404
    end
  end

  def un_follow
    if (f = @user.followings.find_by_followed_by_id(current_user.id)) && f.destroy
      redirect_to :action => :show
    else
      render404
    end
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
