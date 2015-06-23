require 'rails_helper'

describe Video do

  it 'negative validation of attribute' do
    expect(Video.new).to_not be_valid
  end

  it 'positive validation of attribute with local file' do
    expect(build(:video, source: file, remote: nil)).to be_valid
  end

  it 'positive validation of attribute with youtube source' do
    expect(build(:video, remote: 'xxjGzH1shyA')).to be_valid
  end

  it 'validation of attribute with wrong youtube format' do
    expect(build(:video, remote: '@#($')).to_not be_valid
  end

  it 'validation of attribute with both source' do
    expect(build(:video, remote: 'jGzH1', source: file)).to_not be_valid
  end

  it 'validation of attribute without any source' do
    expect(build(:video, source: nil, remote: nil)).to_not be_valid
  end

  it 'wrong type first example' do
    expect(build(:video, kind: 123)).to_not be_valid
  end

  it 'wrong type second example' do
    expect(build(:video, kind: 0)).to_not be_valid
  end

  def file
    file_path = 'test/fixtures/files/test.mp4'
    Rack::Test::UploadedFile.new(file_path, 'video/mp4')
  end

end