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
FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    annotation { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    duration_in_minutes { rand(100..3000) }
  end
end
