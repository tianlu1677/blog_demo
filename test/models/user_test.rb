require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:                  "kakarot", email: "KAKAROT@123.com", password: "111111",
                     password_confirmation: "111111")
  end

  test "should follow and unfollow a user" do
    follower = users(:follower)
    followed = users(:followed)
    assert_not follower.following?(followed)

    follower.follow(followed)
    assert follower.following?(followed)
    assert followed.followers.include?(follower)

    follower.unfollow(followed)
    assert_not follower.following?(followed)
  end

  test "email must presence" do
    @user.email = "\n"

    assert_not @user.valid?
  end

  test "name must presence" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name max length less 20" do
    @user.name = '*' * 21
    assert_not @user.save
  end

  test "email addresses should be unique" do
    duplicate_user       = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
    #assert_not 断言不是真相,期望这里返回 false or nil
  end

  test "email address should be lower-case" do
    mix_email   = "Example@KK.com"
    @user.email = mix_email
    @user.save
    assert_not_equal mix_email, @user.reload.email
  end
end
