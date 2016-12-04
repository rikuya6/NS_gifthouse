# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  buy_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base
end
