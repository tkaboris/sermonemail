require 'test_helper'

class SermonTest < ActiveSupport::TestCase
  
  def setup
    @pastor = Chef.create(pastorname: "bob", email: "bob@example.com")
    @sermon = @pastor.recipes.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever",
              description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")
  end
  
  test "sermon should be valid" do
    assert @sermon.valid?
  end
  
  test "pastor_id should be present" do
    @sermon.pastor_id = nil
    assert_not @sermon.valid?
  end
  
  
  test "name should be present" do
    @sermon.name = " "
    assert_not @sermon.valid?
  end
  
  test "name length should not be too long" do
    @sermon.name = "a" * 101
    assert_not @sermon.valid?
  end
  
  test "name length should not be too short" do
    @sermon.name = "aaaa"
    assert_not @sermon.valid?
  end
  
  test "summary should be present" do
    @sermon.summary = " "
    assert_not @sermon.valid?
  end
  
  test "summary length should not be too long" do
    @sermon.summary = "a" * 151
    assert_not @sermon.valid?
  end
  
  test "summary length should not be too short" do
    @sermon.summary = "a" * 9
    assert_not @sermon.valid?
  end
  
  test "description must be present" do
    @sermon.description = " "
    assert_not @sermon.valid?
  end
  
  test "description should not be too long" do
    @sermon.description = "a" * 501
    assert_not @sermon.valid?
  end
  
  test "description should not be too short" do
    @sermon.description = "a" * 19
    assert_not @sermon.valid?
  end
  
end