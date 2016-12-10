# == Schema Information
#
# Table name: giftboxes
#
#  id         :integer          not null, primary key
#  box_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Giftbox < ActiveRecord::Base
end
