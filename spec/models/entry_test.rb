require 'rails_helper'

describe Entry do

  it 'negative validation of attributes' do
    expect(Entry.new).to_not be_valid
  end

  it 'positive validation of attributes' do
    expect(build(:entry)).to be_valid
  end

end
