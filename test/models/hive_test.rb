require "test_helper"

class HiveTest < ActiveSupport::TestCase
  test "invalid if name has a length of 5 or less" do
    0.upto(5).each do |i|
      hive = Hive.new(name: "?" * i)
      hive.valid?
      assert_not hive.errors[:name].empty?
    end
  end

  test "valid if name has a length of 6 or more" do
    hive = Hive.new(name: "Hive66")
    hive.valid?
    assert_empty hive.errors[:name]

    hive = Hive.new(name: "A long name for a hive")
    hive.valid?
    assert_empty hive.errors[:name]
  end
end
