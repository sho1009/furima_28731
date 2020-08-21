class PostsController < ApplicationController
 def create
   post = Post.create(content: params[:content], checked: false)
   render json:{ post: post }
 end
