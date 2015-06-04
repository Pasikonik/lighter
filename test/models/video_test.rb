require 'test_helper'

describe Video do

  before do
    @video = Video.new
  end

  it "negative validation of attribute" do
    @video.wont_be :valid?
  end

  it "positive validation of attribute with local file" do
    @video.attributes = { title: "Title", kind: 1, source: file }
    @video.must_be :valid?
  end

  it "positive validation of attribute with youtube source" do
    @video.attributes = { title: "Title", kind: 1, remote: 'abcd' }
    @video.must_be :valid?
  end

  it "validation of attribute with wrong youtube format" do
    @video.attributes = { title: "Title", kind: 1, remote: '@#($' }
    @video.wont_be :valid?
  end

  it "validation of attribute with both source" do
    @video.attributes = { title: "Title", 
                          kind: 1, 
                          source: file, 
                          remote: 'abcd' }
    @video.wont_be :valid?
  end

  it "validation of attribute without any source" do
    @video.attributes = { title: "Title", kind: 1 }
    @video.wont_be :valid?
  end   

  it "wrong type" do
    @video.attributes = { title: "Title", kind: 3425 }
    @video.wont_be :valid?    
  end

  it "wrong type 2" do
    @video.attributes = { title: "Title", kind: 0 }
    @video.wont_be :valid?    
  end

  def file
    file_path = "test/fixtures/files/test.mp4"
    Rack::Test::UploadedFile.new(file_path, "video/mp4")   
  end

end