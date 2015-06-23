require 'rails_helper'

describe Tutorial do

  it 'negative validation of attribute' do
    expect(Tutorial.new).to_not be_valid
  end

  it 'positive validation of attribute' do
    expect(build(:tutorial)).to be_valid
  end

  it 'wrong level' do
    expect(build(:tutorial, level: 123)).to_not be_valid
  end

end
