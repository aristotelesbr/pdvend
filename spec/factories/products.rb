# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  product_value  :decimal(, )
#  height         :integer
#  weight         :decimal(, )
#  width          :integer
#  product_length :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(3) }
    product_value { Faker::Number.decimal(2) }
    height { Faker::Number.between(1, 10) }
    weight { Faker::Number.decimal(2) }
    width { Faker::Number.between(1, 10) }
    product_length { Faker::Number.between(1, 10) }
  end
end
