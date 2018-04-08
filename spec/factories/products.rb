# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string(120)      not null
#  description    :string(65535)
#  product_value  :decimal(12, 2)
#  height         :float            not null
#  weight         :decimal(12, 2)
#  width          :float            not null
#  product_length :float            not null
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
