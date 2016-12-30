# == Schema Information
#
# Table name: rules
#
#  id           :integer          not null, primary key
#  category_id1 :integer          not null
#  category_id2 :integer          not null
#

class Rule < ActiveRecord::Base

  # 関連
  belongs_to :category1, class_name: :Category
  belongs_to :category2, class_name: :Category


  # バリデーション
  validates :category1_id, presence: true

  validates :category2_id, presence: true
end
