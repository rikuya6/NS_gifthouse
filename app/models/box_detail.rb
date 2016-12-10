# == Schema Information
#
# Table name: box_details
#
#  id         :integer          not null, primary key
#  giftbox_id :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BoxDetail < ActiveRecord::Base
end
