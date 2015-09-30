require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test "can get current balance" do
    balance = Exchange.current_balance

    assert_equal 0, balance
  end
end
