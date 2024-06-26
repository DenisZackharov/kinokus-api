# == Schema Information
#
# Table name: movies
#
#  id                  :bigint           not null, primary key
#  annotation          :string
#  description         :text
#  duration_in_minutes :integer
#  name                :string           not null
#  release_date        :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Movie < ApplicationRecord
  validates :name, presence: true

  has_one_attached :poster
end
