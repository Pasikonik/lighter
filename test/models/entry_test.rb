require 'test_helper'

describe Entry do

  before do
    @entry = Entry.new
  end

  it "negative validation of attribute" do
    @entry.wont_be :valid?
  end

  it "positive validation of attribute" do
    file_path = "test/fixtures/files/test.jpg"
    file = Rack::Test::UploadedFile.new(file_path, "image/jpeg")
    @entry.attributes = {title: 'Title', body: 'Body', thumbnail: file}    
    @entry.must_be :valid?, "Entry must be valid"
  end

end
