# == Schema Information
#
# Table name: physical_boxes
#
#  id         :integer          not null, primary key
#  capacity   :float            not null
#  type       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhysicalBox < ActiveRecord::Base
end
