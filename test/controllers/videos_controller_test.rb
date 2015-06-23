require 'test_helper'

class VideosControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @video = FactoryGirl.create(:video)
  end
  
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create video with local source' do

    assert_difference('Video.count', +1) do
      post :create, video: { 
                             title: 'Title',
                             description: 'description',
                             kind: 1,
                             source: Rack::Test::UploadedFile.new('test/fixtures/files/test.jpg', 'video/mp4') 
                           }
    end
    assert_redirected_to video_path(assigns(:video))
  end

  test 'should create video with remote source' do

    assert_difference('Video.count', +1) do
      post :create, video: { 
                             title: 'Title',
                             description: 'description',
                             kind: 2,
                             remote: 'FiMtlfHTGRE'
                           }
    end
    assert_redirected_to video_path(assigns(:video))
  end

  test 'should show video' do
    get :show, id: @video
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @video
    assert_response :success
  end

  test 'should update video' do
    patch :update, id: @video, video: { title: 'test2', kind: 1, remote: 'dfsd6sDD' }
    assert_redirected_to video_path(assigns(:video))
  end

  test 'should destroy video' do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end
    assert_redirected_to videos_path
  end

end