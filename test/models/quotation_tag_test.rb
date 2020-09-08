require 'test_helper'

class QuotationTagTest < ActiveSupport::TestCase
  setup do
    @name = QuotationTag.new(name: "sample_tag")
  
  end 
  
  test "should not save if name is not existing" do
    assert_not @name.save, "Tag save" 
  end 
  test "name  should have a minimum of atleast 2 characters" do
    product.title = 'testitout'
    name = Tag.new(name: "n")
    assert name.invalid?
    assert_not @name.save, 'name must be at least 2 chars long'
  end
end
