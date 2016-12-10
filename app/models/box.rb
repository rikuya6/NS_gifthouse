# == Schema Information
#
# Table name: boxes
#
#  id         :integer          not null, primary key
#  capacity   :integer          not null
#  type       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Box < ActiveRecord::Base
end
