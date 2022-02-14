# A stack is a list of values that grows and shrinks dynamically. 
# In ruby, a stack is easily implemented as an Array that just uses the 
# #push and #pop methods.

# A stack-and-register programming language is a language that uses a stack of values. 
# Each operation in the language operates on a register, 
# which can be thought of as the current value. 
# The register is not part of the stack. Operations that require two values pop 
# the topmost item from the stack (that is, the operation removes the most 
# recently pushed value from the stack), perform the operation using the popped 
# value and the register value, and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language. 
# It multiplies the stack value with the register value, removes the value 
# from the stack, and then stores the result back in the register. 
# Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), 
# and a register value of 7, then the MULT operation will transform things to 
# 3 6 on the stack (the 4 is removed), and the result of the multiplication, 
# 28, is left in the register. If we do another MULT at this point, then the 
# stack is transformed to 3, and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register-based programming
# language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, 
#   storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, 
#   storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, 
#   storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, 
#   storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, 
#   storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string
# passed in as an argument. Your program may assume that all programs 
# are correct programs; that is, they won't do anything like try to pop a 
# non-existent value from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

# input: string of 'commands'
# output: integer result or nil
# rules:
# - intialize register to 0
# - the register always has one integer value
# - #push and #pop will be used for adding removing things from the `stack` array
# - all operations are intger operations

# ALGORTHIM
# - register = 0
# - stack = []
# - `n` Place a value `n` in the "register". Do not modify the stack.
# - PUSH Push the register value on to the stack. Leave the value in the register.
#   - append <<
# - ADD Pops a value from the stack and adds it to the register value, 
#   storing the result in the register.
#   - mutate stack, reassign register `+=`
# - SUB Pops a value from the stack and subtracts it from the register value, 
#   storing the result in the register.
#   - mutate stack, reassign register `-=`
# - MULT Pops a value from the stack and multiplies it by the register value, 
#   storing the result in the register.
#   - mutate stack, reassign register `*=`
# - DIV Pops a value from the stack and divides it into the register value, 
#   storing the integer result in the register.
#   - mutate stack, reassign register `/=`
# - MOD Pops a value from the stack and divides it into the register value, 
#   storing the integer remainder of the division in the register.
#   - mutate stack, reassign register `%=`
# - POP Remove the topmost item from the stack and place in register
#   - #pop, reassign `=`
# - PRINT Print the register value
#   - #puts register

# - create an array from the string argument
#   - if element is integer tranform it to an integer (`map`)
# - initialize register = 0
# - initialize stack = []
# - iterate through array (`each`?)
# - case statement for the current value of the parameter
#   - when "PRINT" puts  register
#   - when Integer: register << integer
#   - when etc
# return nothing since "PRINT" is the only display `command`


def minilang(string)
  commands = string.split.map do |command| 
    command.to_i.to_s == command ? command.to_i: command
  end
  register = 0
  stack = []
  commands.each do |command|
    case command
    when Integer then register = command
    when "PUSH" then stack << register
    when "ADD" then register += stack.pop
    when "SUB" then register -= stack.pop
    when "MULT" then register *= stack.pop
    when "DIV" then register /= stack.pop
    when "MOD" then register %= stack.pop
    when "POP" then register = stack.pop
    when "PRINT" then puts register
    end
  end
  register
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)