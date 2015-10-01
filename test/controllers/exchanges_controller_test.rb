require 'test_helper'

class ExchangesControllerTest < ActionController::TestCase
  setup do
    @exchange = exchanges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exchanges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "new should not have balance" do
    get :new
    refute response.body.include?("balance")
  end

  test "should create exchange" do
    assert_difference('Exchange.count') do
      post :create, exchange: { balance: @exchange.balance, credit: @exchange.credit, debit: @exchange.debit, recipient: @exchange.recipient }
    end

    assert_redirected_to exchanges_path
  end

  test "should show exchange" do
    get :show, id: @exchange
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exchange
    assert_response :success
  end

  test "should update exchange" do
    patch :update, id: @exchange, exchange: { balance: @exchange.balance, credit: @exchange.credit, debit: @exchange.debit, recipient: @exchange.recipient }
    assert_redirected_to exchanges_path
  end

  test "should destroy exchange" do
    assert_difference('Exchange.count', -1) do
      delete :destroy, id: @exchange
    end

    assert_redirected_to exchanges_path
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end






end
