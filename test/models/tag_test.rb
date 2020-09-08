require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "should  save if all of the fields are existing" do
    tag = Tag.new(tag_id: 1 , quotation_id: 1)
    assert tag.save, "Tag save" 
  end   

  test "should not save if tag_id  is not existing" do
    tag = Tag.new(tag_id: "", quotation_id: 1)
    assert_not tag.save, "Tag save" 
  end 

  test "should not save if quotation_id  is not existing" do
    tag = Tag.new(tag_id: 1 , quotation_id: "")
    assert_not tag.save, "Tag save" 
  end 
end
