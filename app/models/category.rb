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

  # 関連
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_category


  # バリデーション
  validates :name,  presence: true,
                    uniqueness: true
end
