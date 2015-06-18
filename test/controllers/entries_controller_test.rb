require 'test_helper.rb'

class EntriesControllerTest < ActionController::TestCase

  setup do
    @admin = FactoryGirl.create(:admin)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should create entry' do
    sign_in @admin

    assert_difference('Entry.count', +1) do
      post :create, entry: { title: 'Title',
                             body: 'Body',
                             thumbnail: Rack::Test::UploadedFile.new("test/fixtures/files/test.jpg", "image/jpeg") }
    end

    assert_redirected_to entries_path
  end

  test 'shouldnt create entry' do
    exception = assert_raise(ActionController::ParameterMissing) {
      post :create, entry: {}
    }

    assert_equal 'param is missing or the value is empty: entry', exception.message
  end

end