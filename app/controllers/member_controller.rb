class MemberController < ApplicationController
  before_action :login_required

  # プライベートメソッド
  private

  def login_required
    redirect_to :root, notice: 'ログインしてください。' unless current_user
  end
end
