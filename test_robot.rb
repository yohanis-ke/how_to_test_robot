require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test



  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    robo = Robot.new
    robo.foreign_model = true
    robo.needs_repairs = true
    # act
    c = robo.station
    # assert
    assert_equal(1, c)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    robo = Robot.new
    robo.vintage_model = true
    robo.needs_repairs = true
    # act
    c = robo.station
    # assert
    assert_equal(2, c)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    robo = Robot.new

    robo.needs_repairs = true
    # act
    c = robo.station
    # assert
    assert_equal(3, c)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    robo = Robot.new

    # act
    c = robo.station
    # assert
    assert_equal(4, c)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    robo = Robot.new
    # act
    c = robo.prioritize_tasks
    # assert
    assert_equal(-1, c)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    robo = Robot.new
    robo.todos = [1, 2, 3]
    # act
    c = robo.prioritize_tasks
    # assert
    assert_equal(3, c)
  end

  def test_workday_on_day_off_returns_false
    robo = Robot.new
    robo.day_off = "tuesday"
    # act
    c = robo.workday?("monday")
    # assert
    assert_equal(true, c)
  end

  def test_workday_not_day_off_returns_true
    robo = Robot.new
    robo.day_off = "tuesday"
    # act
    c = robo.workday?("tuesday")
    # assert
    assert_equal(false, c)
  end

end
