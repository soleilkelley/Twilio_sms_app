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

class Cars < ActiveRecord::Base
  has_many :contacts, dependent: :destroy

end
