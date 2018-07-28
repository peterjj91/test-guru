class CheckAchievements

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @badges = Badge.all
  end

  def call
    result = []
    @badges.each do |badge|
        result << badge if self.send("#{badge.rule_name}?", badge.rule_parameter)
    end
    result
  end

  private

  def all_tests_at_category?(*args)
    @user.tests.where(category_id: args[0]).distinct.count == Test.where(category_id: args[0]).count
  end

  def passing_test_at_first_attempt?(*args)
    @test_passage.passed?
  end

  def all_tests_at_level?(*args)
    @user.tests.where(level: args[0]).distinct.count == Test.where(level: args[0]).count
  end
end