require 'test_helper'

feature 'comment features' do

  before do
    @video = FactoryGirl.create(:video)
  end

  scenario 'add comment to video', js: true do
    visit video_path(@video)
    page.fill_in 'comment[comment]', with: 'comment content'
    click_link 'comment'
    page.must_have_content 'comment content'
  end

end