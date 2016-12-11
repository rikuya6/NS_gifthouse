# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  user_id     :integer          not null
#  wrapping_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base

  # 関連
  belongs_to :user
  belongs_to :product
  belongs_to :wrapping
  has_many :addresses, dependent: :destroy


  # 委譲メソッド
  def product_name; product.name end
  def product_price; product.price end
  def product_weight; product.weight end
  def product_stock; product.stock end
  def product_note; product.note end
  def wrapping_name; wrapping.try(:name) end
  def address_name; addresses.dest end

  # バリデーション
end
