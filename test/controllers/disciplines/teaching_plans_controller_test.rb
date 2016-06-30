require 'test_helper'

class Disciplines::TeachingPlansControllerTest < ActionController::TestCase
  	
  	setup do
   		@discipline = disciplines(:one)
   		@teaching_plan = teaching_plans(:one)
	end 
	
	test "should get index" do
		get :index, discipline_id: @discipline, teaching_plan_id: @teaching_plan.id
		assert_response :success
	end

	test "should get newDate" do
       get :newDate, discipline_id: disciplines(:one).id, teaching_plan: { start: Date.new(2016,03,25), end: Date.new(2016,04,25) }, seg: 0, ter: 0, qua: 0, qui: 0, sex: 0
       assert_response :success
    end
   
	test "should get show" do
		get :show, discipline_id: @discipline, id: @teaching_plan.id
	    assert_response :success
	end

	test "should get new" do
		get :new,  discipline_id: @discipline
		assert_response :success
	end

#   test "should get create" do
#     get :create
#     assert_response :success
#   end

  # test "should get edit" do
  #   get :edit, discipline_id: @discipline, teaching_plan:
  #   assert_response :success
  # end

#   test "should get update" do
#     get :update
#     assert_response :success
#   end

  test "should get destroy" do
 	assert_difference('teaching_plans.count', -1) do
    	get :destroy, discipline_id: @discipline, id: @teaching_plan
    	assert_response :success
    end
    assert_redirected_to teaching_plan_path
  end

end
