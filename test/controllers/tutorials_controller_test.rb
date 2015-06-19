require 'test_helper'

class TutorialsControllerTest < ActionController::TestCase
  
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should show tutorial' do
    get :show, id: FactoryGirl.create(:tutorial)
    assert_response :success
  end

  test 'should get new' do
    sign_in FactoryGirl.create(:admin)

    get :new
    assert_response :success
  end

  test 'should create tutorial' do
    sign_in FactoryGirl.create(:admin)

    assert_difference('Tutorial.count', +1) do
      post :create, tutorial: { title: 'Title',
                                video: Rack::Test::UploadedFile.new("test/fixtures/files/test.mp4", "video/mp4"),
                                level: Random.rand(1..5) }
    end
  end

  test 'shouldnt create tutorial without attributes' do
    exception = assert_raise(ActionController::ParameterMissing) {
      post :create, tutorial: {}
    }

    assert_equal 'param is missing or the value is empty: tutorial', exception.message
  end



end
