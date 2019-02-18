class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # user names including term
    term = params[:term]
    if term.blank? # 入力文字列がnilまたは空である場合
      return render :partial => "blank"
    end

    users = User.search(term)
    if users.blank? # search結果がnilまたは空である場合
      return render :partial => "no_result"
    end

    render :partial => "users_result", :collection => users, :as => :user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
    @saved = Post.joins(:bookmarks).where("bookmarks.user_id=?", current_user.id).includes(:photos, :likes, :comments) if @user == current_user
  end
end
