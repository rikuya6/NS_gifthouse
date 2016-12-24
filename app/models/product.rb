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
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader


  # 関連
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :categories


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

  validates :stock,     presence: true,
                        numericality: {
                          allow_blank: true,
                          greater_than_or_equal_to: 0,
                          only_integer: true,
                        }

  validates :note,      presence: true,
                        length: {
                          maximum: 500,
                          allow_blank: true,
                        }

  validate :check_image


  # プライベートメソッド
  private

  def check_image
    if self.image
      if self.image.size > 10.megabytes
        errors.add(:image, :too_big_image)
      end
    end
  end
end
