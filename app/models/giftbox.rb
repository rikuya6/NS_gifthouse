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

  # 関連
  belongs_to :boxes

  # ギフトボックス 商品
  has_many :box_details, dependent: :destroy
  has_many :products, through: :box_details

  accepts_nested_attributes_for :box_details, allow_destroy: true


  # バリデーション
  validates :box_id,      presence: true
end
