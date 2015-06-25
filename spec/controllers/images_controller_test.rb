require 'rails_helper'

describe ImagesController do

  context 'index test' do
    subject { get :index }

    it 'should render index template' do
      expect( subject ).to render_template('index')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'creating image' do
    subject { post :create, image: attributes_for(:image) }
    before do
      sign_in create(:admin)
    end

    it 'should create image' do
      expect{ subject }.to change(Image, :count).by(1) 
    end

    it 'shouldnt create image' do
      expect{ post :create, image: {} }.to raise_error(ActionController::ParameterMissing)
    end
  end

end
