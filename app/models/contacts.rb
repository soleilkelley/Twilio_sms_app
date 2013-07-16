# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Contacts < ActiveRecord::Base
  has_one :car
end
