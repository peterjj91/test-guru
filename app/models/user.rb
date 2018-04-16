class User < ApplicationRecord
  has_many :tests
  has_many :participating_tests, through: :tests_users, source: :test
  has_many :tests_users

  def test_by_level(level)
    Test.joins("JOIN tests_users ON tests_users.test_id = tests.id")
        .where(tests_users: {user_id: id})
        .where(level: level)
  end
end
