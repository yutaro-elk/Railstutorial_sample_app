require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end

  test "セッションが無い時、「current_user」は 正しいユーザーを返す" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "remember digestが間違っている時、「current_user」はnilを返す" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end