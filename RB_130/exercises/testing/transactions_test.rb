require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative "transaction"

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(40)
    input = StringIO.new('40\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 40, transaction.amount_paid
  end
end
