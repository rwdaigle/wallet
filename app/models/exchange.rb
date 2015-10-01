class Exchange < ActiveRecord::Base

  def set_balance(current_balance)
    self.balance = current_balance + credit if credit
    self.balance = current_balance - debit if debit
  end

  def self.current_balance
    self.last.balance
  end

  def self.current_month_expenditures
    this_months_exchanges = self.where("strftime('%m', created_at) = ?", Time.now.utc.strftime("%m"))
    this_months_exchanges.empty? ? 0 : this_months_exchanges.sum('debit')
  end

  def self.last_month_expenditures
    last_months_exchanges = self.where("strftime('%m', created_at) = ?", (Time.now.utc.strftime("%m").to_i-1).to_s)
    last_months_exchanges.empty? ? 0 : this_months_exchanges.sum('debit')
  end

  def self.biggest_expense
    self.maximum('debit')
  end

end
