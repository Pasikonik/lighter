require 'rails_helper'

describe 'Rates' do

  scenario 'add rate', js: true do
    video = create(:video)
    login_as create(:user)
    visit video_path(id: video.id)
    first('.rating > span').click
    expect( find('#score').text ).to eq 5
  end

end