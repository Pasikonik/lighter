require 'rails_helper'

describe VideosController do

  context 'index test' do
    subject { get :index }

    it 'should render index template' do
      expect( subject ).to render_template('index')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'show specific video' do
    subject { get :show, id: create(:video) }

    it 'should render show template' do
      expect( subject ).to render_template('show')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'new video' do
    subject { get :new }

    it 'should render new template' do
      expect( subject ).to render_template('new')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'edit video' do
    subject { get :edit, id: create(:video) }

    it 'should render edit template' do
      expect( subject ).to render_template('edit')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'create new video' do
    before { sign_in create(:user) }

    it 'should create video' do
      expect{
        post :create, video: attributes_for(:video)
      }.to change(Video, :count).by(1)
    end

    it 'shouldnt create video' do
      expect{ 
        post :create, video: {} 
      }.to raise_error(ActionController::ParameterMissing)
    end
  end

  context 'edit video' do
    it 'update specific video' do
      user = create(:user)
      sign_in user
      video = create(:video, user: user)
      put :update, id: video, video: attributes_for(:video, title: 'testing')
    end
  end

  context 'destroy video' do
    before { @video = create(:video) }

    it 'destroy specific video' do
      expect {
        delete :destroy, id: @video
      }.to change(Video, :count).by(-1)
    end

    it 'redirect after delete' do
      expect(delete :destroy, id: @video).to redirect_to videos_path
    end
  end

end