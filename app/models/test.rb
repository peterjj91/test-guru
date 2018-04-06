class Test < ApplicationRecord
  def self.tests_titles_by_category (category_title)
    Test.joins('JOIN categories ON categories.id = tests.category_id').where('categories.title = :category', category: category_title).order('tests.title DESC').pluck('tests.title')
  end
end
