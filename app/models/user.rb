class User < ApplicationRecord
  has_many :tests
  has_many :participating_tests, through: :tests_users, source: :test
  has_many :tests_users

  validates :email, presence: true, uniqueness: true

  def test_by_level(level)
    Test.by_level(level)
  end
end
