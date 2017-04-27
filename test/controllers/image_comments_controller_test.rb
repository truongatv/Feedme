require 'test_helper'

class ImageCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_comment = image_comments(:one)
  end

  test "should get index" do
    get image_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_image_comment_url
    assert_response :success
  end

  test "should create image_comment" do
    assert_difference('ImageComment.count') do
      post image_comments_url, params: { image_comment: { comment: @image_comment.comment, image_id: @image_comment.image_id, user_id: @image_comment.user_id } }
    end

    assert_redirected_to image_comment_url(ImageComment.last)
  end

  test "should show image_comment" do
    get image_comment_url(@image_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_comment_url(@image_comment)
    assert_response :success
  end

  test "should update image_comment" do
    patch image_comment_url(@image_comment), params: { image_comment: { comment: @image_comment.comment, image_id: @image_comment.image_id, user_id: @image_comment.user_id } }
    assert_redirected_to image_comment_url(@image_comment)
  end

  test "should destroy image_comment" do
    assert_difference('ImageComment.count', -1) do
      delete image_comment_url(@image_comment)
    end

    assert_redirected_to image_comments_url
  end
end
