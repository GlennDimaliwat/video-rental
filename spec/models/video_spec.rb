# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  name           :string
#  genre          :string
#  year_released  :integer
#  classification :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Video, type: :model do

  context 'when video is saved' do
    subject { Video.new(name: 'Star Wars', genre: 'Action', year_released: 2017, classification: 'PG-13', description: 'Spider-man saves the day' ) }
    it {
      is_expected.to be_valid
    }
  end

  context 'when name is missing' do
    subject { Video.new(genre: 'Action', year_released: 2017, classification: 'PG-13', description: 'Spider-man saves the day' ) }
    it {
      is_expected.to be_invalid
    }
  end

  context 'when genre is missing' do
    subject { Video.new(name: 'Star Wars', year_released: 2017, classification: 'PG-13', description: 'Spider-man saves the day' ) }
    it {
      is_expected.to be_invalid
    }
  end

  context 'when year released is missing' do
    subject { Video.new(name: 'Star Wars', genre: 'Action', classification: 'PG-13', description: 'Spider-man saves the day' ) }
    it {
      is_expected.to be_invalid
    }
  end

  context 'when year released is not integer' do
    subject { Video.new(name: 'Star Wars', genre: 'Action', year_released: '2017', classification: 'PG-13', description: 'Spider-man saves the day' ) }
    it {
      is_expected.to be_kind_of(integer)
    }
    subject { Video.new(name: 'Star Wars', genre: 'Action', year_released: 'Hello World', classification: 'PG-13', description: 'Spider-man saves the day' ) }
    it {
      is_expected.to be_kind_of(integer)
    }
  end


end
