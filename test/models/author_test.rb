require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "should not save if author_name field is empty" do
    author = Author.new(author_name: "")
    assert_not author.save, "Saved the author without a author_name"
  end

  test "author name should be unique" do
    author_authorname = Author.new(author_name: "exampleauthor")
    duplicate_item = author_authorname.dup
    author_authorname.save(validate: false)
    duplicate_item.valid? 
    assert duplicate_item.errors
    assert duplicate_item.errors[:author_name]
  end 
end
