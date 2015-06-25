require 'rails_helper'

describe HomeController do

  context 'index test' do
    subject { get :index }

    it 'should render index template' do
      expect( subject ).to render_template('index')
    end

    it 'should returns a success status' do
      expect( subject ).to have_http_status(:success)
    end
  end

end
