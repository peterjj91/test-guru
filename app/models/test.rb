class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_titles_by_category (category_title)
    Test.joins('JOIN categories ON categories.id = tests.category_id').where('categories.title = :category', category: category_title).order('tests.title DESC').pluck('tests.title')
  end
end
