require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should save if all the fields are existing and have correct format is correct" do
    user = User.new(email: "user_email@email.com", username: "user", password:"examplepassword")
    assert user.save, "User save" 
  end 
  
  test "should not save if username field is empty" do
    user = User.new(email: "email@email.com", username: "", password:"examplepassword")
    assert_not user.save, "Saved the user without a username"
  end

  test "username should be unique" do
    user_username = User.new(username: "examplename")
    duplicate_item = user_username.dup
    user_username.save(validate: false)
    duplicate_item.valid? 
    assert duplicate_item.errors
    assert duplicate_item.errors[:username]
  end 

  test "should not save if email field is empty" do
    user_email = User.new(email: "", username: "exampleuser", password:"examplepassword")
    assert_not user_email.save, "Saved the user without a email"
  end

  test "should not save if email format is incorrect" do
    user_email = User.new(email: "sampleemail.com")
    assert_match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, "sample@email.com", "Email invalid" )
    assert_not user_email.save, "Saved the email field with incorrect format"
  end
  
  test "email should be unique" do
    user_email = User.new(email: "example@email.com")
    duplicate_item = user_email.dup
    user_email.save(validate: false)
    duplicate_item.valid? 
    assert duplicate_item.errors
    assert duplicate_item.errors[:email]
  end 

  test "should not save if password fields is empty" do
    user_password = User.new(username: "exampleuser", email: "sampleemail.com", password: "")
    assert_not user_password.save, "Saved the user without a password"
  end

  test "should not save if all fields is empty" do
    user = User.new(username: "", email:"", password: "")
    assert_not user.save, "Saved the user without entering anything"
  end

end
