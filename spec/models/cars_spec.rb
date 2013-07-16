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

require 'spec_helper'

describe Cars do
  pending "add some examples to (or delete) #{__FILE__}"
end
