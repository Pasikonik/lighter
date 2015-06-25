require 'rails_helper.rb'

describe EntriesController do

  context 'index test' do
    subject { get :index }

    it 'should render index template' do
      expect( subject ).to render_template('index')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

  context 'creating entry' do
    subject { post :create, entry: attributes_for(:entry) }
    before { sign_in create(:admin) }

    it 'should create entry' do
      expect{ subject }.to change(Entry, :count).by(1) 
    end

    it 'should redirect after created' do
      expect( subject ).to redirect_to( entries_path )
    end

    it 'shouldnt create entry' do
      expect{ post :create, entry: {} }.to raise_error(ActionController::ParameterMissing)
    end
  end

end