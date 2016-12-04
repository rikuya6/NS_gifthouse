# == Schema Information
#
# Table name: boxes
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  physical_box_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Box < ActiveRecord::Base
end
