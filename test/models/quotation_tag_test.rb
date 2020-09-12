require 'test_helper'

class QuotationTagTest < ActiveSupport::TestCase
  test "should create data when tag id is not present" do
    @tag = QuotationTag.new(tag_id: nil, quote_id: 1)
    assert_not @tag.save
  end

  test "should create data when quote id is not present" do
    @tag = QuotationTag.new(tag_id: 1, quote_id: nil)
    assert_not @tag.save
  end

  test "should create data when quote id  and tag id is present" do
    @tag = QuotationTag.new(tag_id: 1, quote_id: 1)
    assert_not @tag.save
  end
end
