require 'test_helper'

class Admin::CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { active: @customer.active, address: @customer.address, city: @customer.city, email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name, phone: @customer.phone, store_name: @customer.store_name }
    end

    assert_redirected_to admin_customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { active: @customer.active, address: @customer.address, city: @customer.city, email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name, phone: @customer.phone, store_name: @customer.store_name }
    assert_redirected_to admin_customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to admin_customers_path
  end
end
