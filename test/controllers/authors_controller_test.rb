require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user =  User.create(username: "admin_user", email: "admin_email@email.com",
                   password: "examplepassword", admin: true)
    @author     =  Author.create(author_name: "author_sample_name", id:1)
    @get_author =  authors(:one)
  end

  test "should go to author index form" do
    get authors_path
    assert_response :redirect 
  end 

  test "should go to new author form" do
    get new_author_path
    assert_response :redirect 
  end 

  test "should create user" do
    post create_author_url, params: {author: {author_name: 'user_user'}}  
    assert_response :redirect
  end

  test "should go to author details form" do
    get '/authors/' + @author.id.to_s
    assert_recognizes({ :controller => 'authors',
                        :action => 'show',
                        :id => '1' },
                        :path => '/authors/1',
                        :method => :get)
    assert_response :redirect
  end
  
  test "should  update author data" do
    get '/authors/' + @author.id.to_s
    assert_recognizes({ :controller => 'authors',
                        :action => 'update',
                        :id => '1' },
                        :path => '/authors/1',
                        :method => :patch)
    assert_response :redirect
  end

  test "should go delete user details form" do
    get '/authors/' + @author.id.to_s
    assert_recognizes({ :controller => 'authors',
                        :action => 'destroy',
                        :id => '1' },
                        :path => 'authors/1',
                        :method => :delete)
    assert_response :redirect
  end


  test "should go to new author form and create author when login as admin" do
    login_user_test(@admin_user) 
    get '/authors/new'    
    assert_response :success
    assert_difference "Author.count", 1 do
      post create_author_path, params: { author: {author_name: 'example_author_name', }}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  test "should delete author when login as admin" do
    login_user_test(@admin_user) 

    assert_difference('Author.count', -1) do
        delete delete_author_path(@get_author)
    end     
  end 

end
