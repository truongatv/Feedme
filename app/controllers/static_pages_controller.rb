class StaticPagesController < ApplicationController
  def home
    @image_comment = ImageComment.new
  end
end
