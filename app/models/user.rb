# require "digest/sha1"

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL }

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test'
  has_many :gists

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  validates :last_name, presence: true
  validates :first_name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "asd #{first_name} #{last_name}"
  end

  def admin?
    is_a?(Admin)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def add_gist(question, url)
    gists.create(question: question, gist: url)
  end

end