# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  order_id   :integer          not null
#  dest       :string           not null
#  zipcode    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base


  # 関連
  belongs_to :order


  # バリデーション
  validates :dest,      presence: true

  validates :zipcode,   presence: true,
                        format: {
                          allow_blank: true,
                          with: /\A\d{3}[-]\d{4}/,
                        }
end
