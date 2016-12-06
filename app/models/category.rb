# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base

  # アクセサ


  # 関連
  has_many :product_category
  has_many :products, through: :product_category


  # バリデーション
end
