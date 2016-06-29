require 'test_helper'

class Disciplines::TeachingPlansControllerTest < ActionController::TestCase
  	
  	setup do
   		@discipline = disciplines(:one)
   		@teaching_plan = teaching_plans(:one)
	end 
	
	test "should get index" do
		get :index, discipline_id: disciplines(:one).id, teaching_plan_id: @teaching_plan.id
		assert_response :success
	end

	test "should get newDate" do
       get :newDate, discipline_id: disciplines(:one).id, teaching_plan: { start: Date.new(2016,03,25), end: Date.new(2016,04,25) }, seg: 0, ter: 0, qua: 0, qui: 0, sex: 0
       assert_response :success
    end
   
	test "should get show" do
		get :show, discipline_id: disciplines(:one), teaching_plan_id: @teaching_plan.id
	    assert_response :success
	end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should get create" do
#     get :create
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit
#     assert_response :success
#   end

#   test "should get update" do
#     get :update
#     assert_response :success
#   end

#   test "should get destroy" do
#     get :destroy
#     assert_response :success
#   end

end
