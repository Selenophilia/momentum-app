require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @name = Tag.new(name: "sample_tag")
  
  end 
  
  test "should save if all the fields are existing and have correct format is correct" do
    assert user.save, "User save" 
  end 
  
end
