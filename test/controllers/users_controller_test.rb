require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  setup do 
      @admin_user =  User.create(username: "admin_user", email: "admin_email@email.com",
                                password: "examplepassword", admin: true)
      
      @user       =  User.create(username: "user", email: "user_email@email.com",
                             password: "examplepassword", admin: false)
      @get_user   = User.last                       
  end

  teardown do
    Rails.cache.clear
  end

  test "1.should go to new user form" do
    get new_user_path
    assert_response :success 
  end 

  test "2.should create user" do
    post create_user_url, params: {user: {username: 'user_user', email: 'user@email.com', password: 'password'}}  
    assert_response :redirect
  end

  test "3.should go to user details form" do
    get '/users/' + @user.id.to_s
    assert_recognizes({ :controller => 'users',
                        :action => 'show',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :get)
  end
  
  test "4.should go to update user details form" do
    get '/users/' + @user.id.to_s
    assert_recognizes({ :controller => 'users',
                        :action => 'update',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :patch)
    assert_response :redirect
  end

  test "5.should go delete user details form" do
    get '/users/' + @user.id.to_s
    assert_recognizes({ :controller => 'users',
                        :action => 'destroy',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :delete)
    assert_response :redirect
  end

  test "6.route test" do
    assert_generates "/users", :controller => "users", :action => "index"
    assert_generates "/users/new", { :controller => "users", :action => "new" }
    assert_generates "/users/1", { :controller => "users", :action => "show", :id => "1" }
    assert_generates "/users/1/edit%20", { :controller => "users", :action => "edit", :id => "1" }
    assert_generates "/users/1", { :controller => "users", :action => "update", :id => "1" }
    assert_generates "/users/1", { :controller => "users", :action => "destroy", :id => "1" }
  end


  test "7.should go to new user form and create user when login as admin" do
    login_user_test(@admin_user) 
    get '/users/new'    
    assert_response :success
    assert_difference "User.count", 1 do
      post create_user_path, params: { user: {email: 'email@email.com', username: 'example_user', password:'example_password' }}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  test "8.should delete user when login as admin" do
    login_user_test(@admin_user) 

    assert_difference('User.count', -1) do
        delete delete_user_path(@get_user)
    end     
  end 

  # test "should update users when login as admin" do
  #   login_user_test(@admin_user) 
     
  #   patch update_user_url(@get_user), params: { user: { username: "username-updated" }}

  #   assert_redirected_to users_path

  #   @get_user.reload
    
  #   assert_equal "username-updated", @get_user.username
  # end

end
