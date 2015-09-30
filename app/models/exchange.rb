class Exchange < ActiveRecord::Base

  def self.current_balance
    self.last.balance
  end
end
