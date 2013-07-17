# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  car_id     :integer
#  kind       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  belongs_to :car
end
