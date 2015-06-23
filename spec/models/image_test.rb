require 'rails_helper'

describe Image do

  it 'negative validation of attributes' do
    expect(Image.new).to_not be_valid
  end

  it 'positive validation of attributes' do
    expect(build(:image)).to be_valid
  end

  it 'wrong type' do
    expect(build(:image, kind: 123)).to_not be_valid
  end

end
