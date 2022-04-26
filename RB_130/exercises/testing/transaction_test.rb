require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    trans = Transaction.new(30)
    str_input = StringIO.new('30\n')
    str_output = StringIO.new
    before_payment = trans.amount_paid

    trans.prompt_for_payment(input: str_input, output: str_output)
    assert_equal(before_payment + 30, trans.amount_paid)
  end
end