require 'test_helper'

class ImagesControllerTest < ActionController::TestCase

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should create link' do
    sign_in FactoryGirl.create(:admin)

    assert_difference('Image.count', +1) do
      post :create, image: { src: Rack::Test::UploadedFile.new("test/fixtures/files/test.jpg", "image/jpeg"),
                             kind: Random.rand(1..2) }
    end
  end

end
