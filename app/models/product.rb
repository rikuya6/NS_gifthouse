# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  price      :integer          not null
#  weight     :integer          not null
#  stock      :integer          not null
#  note       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base

  # 関連
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :ordersp


  # バリデーション
  validates :name,      presence: true,
                        uniqueness: true

  validates :price,     presence: true,
                        numericality: {
                          allow_blank: true,
                          greater_than: 0,
                          only_integer: true,
                        }

  validates :weight,    presence: true,
                        numericality: {
                          allow_blank: true,
                          greater_than: 0,
                          only_integer: true,
                        }

  validates :note,      presence: true,
                        length: {
                          maximum: 300,
                          allow_blank: true,
                        }
end
