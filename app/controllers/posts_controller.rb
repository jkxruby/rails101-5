class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy, :update]

def new
  @group = Group.find(params[:group_id])
  @post = Post.new
end

def create
  @group = Group.find(params[:group_id])
  @post = Post.new(post_params)
  @post.group = @group
  @post.user = current_user
  if @post.save
    redirect_to group_path(@group)
  else
    render :new
  end
end


def edit
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
  @post.group =  @group
end

def destroy
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to account_posts_path, notice: "删除快乐！"
end

def update
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
  @post.group = @group
   if @post.update(post_params)
     redirect_to account_posts_path, notice: "更新真好！"
   else
     render :edit
   end
 end


private
def post_params
  params.require(:post).permit(:content)

end
end
