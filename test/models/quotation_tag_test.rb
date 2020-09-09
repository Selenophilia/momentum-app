require 'test_helper'

class QuotationTagTest < ActiveSupport::TestCase
  setup do 
    @tag    = Tag.create(name: "sample_tag_name")
    @author = Author.create(author_name: "sample_author_name") 
    @quote  = Quote.create(description: "sample_quote_name", author_id: @author.id)
  end 

  test "should not save if tag_id  is not existing" do
    tag = QuotationTag.new(tag_id: "", quote_id: 1)
    assert_not tag.save, "Tag not save" 
  end 

  test "should not save if quotation_id  is not existing" do
    tag = QuotationTag.new(tag_id: 1 , quote_id: "")
    assert_not tag.save, "Tag not save" 
  end 

  test "should  save if all fields are present" do
    @quotation_tag = QuotationTag.new(tag_id: @tag.id , quote_id: @quote.id)
    assert @quotation_tag.save, "Tag save" 
  end 
end
