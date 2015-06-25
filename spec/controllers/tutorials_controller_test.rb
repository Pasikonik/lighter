require 'rails_helper'

describe TutorialsController do
  
  context 'index test' do
    subject { get :index }

    it 'should render index template' do
      expect( subject ).to render_template('index')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'show specific tutorial' do
    subject { get :show, id: create(:tutorial) }

    it 'should render show template' do
      expect( subject ).to render_template('show')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'new tutorial' do
    subject { get :new }

    it 'should render new template' do
      expect( subject ).to render_template('new')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'create a new tutorial'    
    before { sign_in create(:admin) }

    it 'should create tutorial' do
      expect{
        post :create, tutorial: attributes_for(:tutorial)
      }.to change(Tutorial, :count).by(1)
    end

    it 'shouldnt create tutorial' do
      expect{ 
        post :create, tutorial: {} 
      }.to raise_error(ActionController::ParameterMissing)
    end

end


