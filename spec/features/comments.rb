require 'rails_helper'

feature 'Comments' do

  scenario 'add comment', js: true do
    sign_in create(:user)
    video = create(:video)
    visit video_path(id: video.id)
    fill_in 'comment[comment]', with: 'test'
    click_button 'comment'
    expect(page).to have_content 'test'
  end

end