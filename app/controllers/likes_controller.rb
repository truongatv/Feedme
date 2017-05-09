class LikesController < ApplicationController
	before_action :load_image
	before_action :load_like, only: :destroy

	def create
		@like = Like.new
		@like.image = @image
		@like.user = current_user
		@like.save
	end

	def destroy
		@like.destroy
	end

	private
	def load_image
		@image = Image.find_by id: params[:image_id]
		unless @image
			flash[:danger] = "Image not exist"
			redirect_to root_path
		end
	end


	def load_like
		@like = Like.find_by id: params[:id]
		unless @like
			flash[:danger] = "Like not exist"
			redirect_to root_path
		end
	end	
end
