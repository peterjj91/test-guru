class User < ApplicationRecord
  def test_by_level(level)
    Test.where(level: level)
  end
end
