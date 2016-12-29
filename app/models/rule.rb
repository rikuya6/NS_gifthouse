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


  # バリデーション
  validates :category_id1, presence: true

  validates :category_id2, presence: true
end
