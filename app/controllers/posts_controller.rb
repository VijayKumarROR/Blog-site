class PostsController < ApplicationController
	before_filter :authenticate_user!  

	def index 
		@posts = Post.all
	end

  def new
  	@post = Post.new
	end

	def create
		@post = Post.new(post_params)
  	if @post.save
  		flash[:notice] = "Post was successfully created"
  		redirect_to :controller => "posts", :action => "index"
  	else
  		flash[:error] = "Error while save"
  		render "new"
  	end
	end

	def edit 
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def search
  	@post = Post.find_by_title(params[:title])
  	if @post.present?
  		render "list_title"
  	else
  		flash[:notice] = "No Title found, Try Another"
  	end
  end	

	def update
		@post = Post.find(params[:id])
		if @post.update(:comments => params[:comments])
			flash[:notice] = "Post has been updated successfully"
			redirect_to :controller => "posts", :action => "index"
		else
			flash[:error] = "Error while update"
			render "edit"
		end
	end
 
private
	def post_params
		params.require(:post).permit(:user_id,:title,:description,:comments, {attachment: []})
	end
end
