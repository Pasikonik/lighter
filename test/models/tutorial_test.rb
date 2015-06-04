require 'test_helper'

describe Tutorial do

  before do
    @tutorial = Tutorial.new
  end

  it "negative validation of attribute" do
    @tutorial.wont_be :valid?
  end

  it "positive validation of attribute" do
    @tutorial.attributes = {title: "Title", level: 1, video: file}
    @tutorial.must_be :valid?
  end

  it "wrong level" do
    @tutorial.attributes = {title: "Title", level: 123, video: file}
    @tutorial.wont_be :valid?
  end

  def file
    file_path = "test/fixtures/files/test.mp4"
    Rack::Test::UploadedFile.new(file_path, "video/mp4")   
  end

end
