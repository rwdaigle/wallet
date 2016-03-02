class Exchange < ActiveRecord::Base
  validates :recipient, presence: true
  def set_balance(current_balance)
    self.balance ||= 0
    if self
      self.balance = current_balance + credit if credit
      self.balance = current_balance - debit if debit
    end
  end

  def self.current_balance
    self.last.balance rescue 0
  end

  def self.current_month_expenditures
    this_months_exchanges = self.where("to_char(created_at, 'MM') = ?", Time.now.utc.strftime("%m"))
    this_months_exchanges.empty? ? 0 : this_months_exchanges.sum('debit')
  end

  def self.current_month_biggest_expense
    this_months_exchanges = self.where("to_char(created_at, 'MM') = ?", Time.now.utc.strftime("%m"))
    this_months_exchanges.empty? ? 0 : this_months_exchanges.maximum('debit')
  end

  def self.current_month_number_exchanges
    this_months_exchanges = self.where("to_char(created_at, 'MM') = ?", Time.now.utc.strftime("%m")).count
  end

  def self.last_month_expenditures
    last_months_exchanges = self.where("to_char(created_at, 'MM') = ?", (Time.now.utc.strftime("%m").to_i-1).to_s)
    last_months_exchanges.empty? ? 0 : this_months_exchanges.sum('debit')
  end

  def self.last_month_number_exchanges
    self.where("created_at BETWEEN ? AND ?", (Time.now - 1.month).beginning_of_month, (Time.now - 1.month).end_of_month).count
  end

  def self.biggest_expense
    self.maximum('debit')
  end

  def self.chastise_overdrafts
    # output = ""
    # if self.current_balance < 0
    #   output = "YOU HAVE OVERDRAFTED! HOW DARE YOU NOT HAVE ENOUGH MONEY! "
    #   output += "YOUR FRIENDS, FAMILY, AND COWORKERS HAVE BEEN ALERTED OF YOUR NEGLIGENCE!"
    # end
    # output

    output = ""
    if self.current_balance < 0
      choice = rand(1..3)
      case choice
      when 1
        output = "YOU'RE NOT YOUR JOB. YOU'RE NOT HOW MUCH MONEY YOU HAVE IN THE BANK. WHICH IS GOOD BECAUSE YOU HAVE NONE."
      when 2
        output = "THE THINGS YOU OWN END UP OWNING YOU. LUCKILY, YOU OWN NOTHING."
      when 3
        output = "IT'S ONLY AFTER WE'VE LOST EVERYTHING THAT WE'RE FREE TO DO ANYTHING. WELL, LOOKS LIKE YOU'RE FREE."
      end
    end
    output
  end



end
