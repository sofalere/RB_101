require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    reg = CashRegister.new(0)
    trans = Transaction.new(30)
    trans.amount_paid = 30
    
    starting_amount = reg.total_money
    reg.accept_money(trans)
  
    assert_equal(starting_amount + 30, reg.total_money)
  end
  
  def test_change
    trans = Transaction.new(15)
    trans.amount_paid = 20
    reg = CashRegister.new(1000)
  
    assert_equal( 5, reg.change(trans) )
  end
  
  def test_give_receipt
    trans = Transaction.new(50)
    reg = CashRegister.new(1000)

    assert_output("You've paid $50.\n") do
     reg.give_receipt(trans)
    end
  end
end
