# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  price        :integer          not null
#  weight       :integer          not null
#  stock        :integer          not null
#  note         :text             not null
#  image        :binary
#  content_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base

  # 定数
  IMAGE_TYPES = { 'image/jpeg' => 'jpg', 'image/gif' => 'gif', 'image/png' => 'png' }


  # アクセサ
  attr_reader :uploaded_image


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


  # メソッド
  def uploaded_image=(image)
    self.content_type = convert_content_type(image.content_type)
    self.image = image.read
    @uploaded_image = image
  end

  def extension
    IMAGE_TYPES[content_type]
  end


  # プライベートメソッド
  private

  def convert_content_type(ctype)
    ctype = ctype.rstrip.downcase
    case ctype
      when 'image/pjpeg'  then 'image/jpeg'
      when 'image/jpg'    then 'image/jpeg'
      when 'image/x-png'  then 'image/png'
      else ctype
    end
  end

  def check_image
    if @uploaded_image
      if image.size > 64.kilobytes
        errors.add(:uploaded_image, :too_big_image)
      end
      unless IMAGE_TYPES.has_key?(content_type)
        errors.add(:uploaded_image, :invalid_image)
      end
    end
  end
end
