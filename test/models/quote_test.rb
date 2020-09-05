require 'test_helper'

class QuoteTest < ActiveSupport::TestCase

  test "should not save if description field is empty" do
    quotes_description = Quote.new(description: " ")
    assert_not quotes_description.save, "Saved the quote without a description"
  end

  test "should not update if description field is empty" do
    quotes_description = Quote.new(description: " ")
    assert_not quotes_description.save, "Updated the quote without a description"
  end

  test "should not delete if description field is empty" do
    quotes_description = Quote.new(description: " ")
    assert_not quotes_description.save, "deleted the quote without a description"
  end
end
