require 'test_helper'

class TagTest < ActiveSupport::TestCase

  setup do
    @name = Tag.new(name: "sample_tag")
  
  end 
  
  test "should not save if name is not existing" do
    assert_not @name.save, "Tag save" 
  end 
  test "name  should have a minimum of atleast 2 characters" do
    name = Tag.new(name: "n")
    assert name.invalid?
    assert_not @name.save, 'name must be at least 2 chars long'
  end
  
end
