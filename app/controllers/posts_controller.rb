class PostsController < ApplicationController

 def index
   @posts = Post.all  # すべてのレコードを@postsに代入
 end
 
 # def create
 #   post = Post.create(content: params[:content], checked: false)
 #   render json:{ post: post }
 # end
end