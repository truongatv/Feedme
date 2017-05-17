class ImageCommentsController < ApplicationController
  before_action :set_image_comment, only: [:show, :edit, :update, :destroy]

  # GET /image_comments
  # GET /image_comments.json
  def index
    @image_comments = ImageComment.all
  end

  # GET /image_comments/1
  # GET /image_comments/1.json
  def show
  end

  # GET /image_comments/new
  def new
    @image_comment = ImageComment.new
  end

  # GET /image_comments/1/edit
  def edit
  end

  # POST /image_comments
  # POST /image_comments.json
  def create
    @user = current_user
    @image_comment = @user.image_comments.new(image_comment_params)
    respond_to do |format|
      if @image_comment.save
        format.html {redirect_to :back}
        format.js
      end
    end
  end

  # PATCH/PUT /image_comments/1
  # PATCH/PUT /image_comments/1.json
  def update
    respond_to do |format|
      if @image_comment.update(image_comment_params)
        url = "/images/" + @image_comment.image_id.to_s
        format.html { redirect_to url, notice: 'Image comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_comment }
      else
        format.html { render :edit }
        format.json { render json: @image_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_comments/1
  # DELETE /image_comments/1.json
  def destroy
    @image_comment.destroy
    url = "/images/" + @image_comment.image_id.to_s
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Image comment was successfully destroyed.' }
      format.json { head :no_content }
      # format.js
    end
  end

  def live_update
    @old_comment = ImageComment.find(params[:id]).dup
    @old_comment.id = params[:id]
    @image_comment = ImageComment.find(params[:id])
    @image_comment.destroy
    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_comment
      @image_comment = ImageComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_comment_params
      params.require(:image_comment).permit(:user_id, :image_id, :comment)
    end
end
