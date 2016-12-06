# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  price      :integer          not null
#  weight     :float            not null
#  stock      :integer          not null
#  note       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base

  # アクセサ


  # 関連
  has_many :product_category
  has_many :category, through: :product_category


  # バリデーション
end
