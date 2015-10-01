require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test "can get current balance" do
    balance = Exchange.current_balance

    assert_equal 0, balance
  end

  # test "balance updates with new exchange" do
  #   assert_equal 45, Exchange.current_balance
  #   Exchange.create(debit:40)
  #   assert_equal 5, Exchange.current_balance
  # end

  test "can get amount spent this month" do
    assert_equal 55,  Exchange.current_month_expenditures
  end

  test "can get amount spent last month" do
    assert_equal 0,  Exchange.last_month_expenditures
  end

  test "can find biggest expense ever" do
    assert_equal 55, Exchange.biggest_expense
  end

  test "can find biggest expense this month" do
    assert_equal 55, Exchange.current_month_biggest_expense
  end

  test "can get number of exchanges this month" do
    assert_equal 3, Exchange.current_month_number_exchanges
  end

  test "can get number of exchanges last month" do
    assert_equal 0, Exchange.last_month_number_exchanges
  end

end
