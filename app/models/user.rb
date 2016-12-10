# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  administrator   :boolean          default("f"), not null
#  password_digest :string           not null
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  include EmailAddressChecker

  # 関連
  has_many :orders


  # バリデーション
  validate  :check_email

  validates :email, presence: true,
                    uniqueness: true


  # メソッド


  # クラスメソッド
  has_secure_password


  # プライベートメソッド
  private

  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end
end
