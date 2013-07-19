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

  validates_uniqueness_of :license_plate, scope: :state, case_sensitive: false
  validates :license_plate, presence: true
  validates :state, presence: true

  before_save :upcase

  private
  def upcase
    self.license_plate.upcase! if self.license_plate
    self.state.upcase! if self.state
  end

end
