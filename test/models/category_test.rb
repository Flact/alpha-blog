
require 'test_helper'

class CtegoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sport")
  end
  
  test "should be valid category" do
    assert @category.valid?
  end
  
  test "should be name present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "should be name unique" do
    @category.save
    category2 = Category.new(name: "sport")
    assert_not category2.valid?
  end
  
  test "should not be too long name" do
    @category.name = "a" * 28
    assert_not @category.valid?
  end
  
  test "should not be too short name" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end