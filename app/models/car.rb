# == Schema Information
#
# Table name: cars
#
#  id            :integer          not null, primary key
#  license_plate :string(255)
#  state         :string(255)
#  zip           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  nickname      :string(255)
#

class Car < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts

  validates_acceptance_of :terms, as: true

  validates :license_plate, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
