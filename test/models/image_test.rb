require 'test_helper'

describe Image do

  before do
    @image = Image.new
  end

  it "negative validation of attributes" do
    @image.wont_be :valid?
  end

  it "positive validation of attributes" do
    @image.src = file
    @image.kind = 1
    @image.must_be :valid?
  end

  it "wrong type" do
    @image.src = file
    @image.kind = 2342734
    @image.wont_be :valid?
  end

  def file
    file_path = "test/fixtures/files/test.jpg"
    Rack::Test::UploadedFile.new(file_path, "image/jpeg")
  end

end
