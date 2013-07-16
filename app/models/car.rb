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
#  contacts_id   :integer
#

class Car < ActiveRecord::Base
  has_many :contacts, dependent: :destroy

  validates_acceptance_of :terms

  validates :license_plate, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
