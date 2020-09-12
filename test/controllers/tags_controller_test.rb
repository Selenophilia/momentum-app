require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
    setup do
      Tag.create(name: 'sample_tag', id:1)     
    end
  test "1.should go to new tag form" do
    get new_tag_path
    assert_response :success 
  end 

  test "2.should create tag" do
    post create_tag_path  
    assert_response :redirect
  end

  test "3.should go to tag details form" do
    get '/tag/1'
    assert_recognizes({ :controller => 'tags',
                        :action => 'show',
                        :id => '1' },
                        :path => '/tag/1',
                        :method => :get)
  end

  test "4.should update the tag  in tag details form" do
    get '/tag/1'
    assert_recognizes({ :controller => 'tags',
                        :action => 'update',
                        :id => '1'  },
                        :path => '/tag/1',
                        :method => :patch)
    assert_response :success
  end

  test "5,should delete the tag  in tag details form" do
    get '/tag/1'
    assert_recognizes({ :controller => 'tags',
                        :action => 'destroy',
                        :id => '1' },
                        :path => '/tag/1',
                        :method => :delete)
    assert_response :success
  end
end 
