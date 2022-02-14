# write a method tha takes a string, returns a hash
# set hash keys and values for 0
# try using String#count

def letter_case_count(str)
  { lowercase: str.count('a-z'),
    uppercase: str.count('A-Z'),
    neither: str.count('^A-Za-z') }
end

p  letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p  letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p  letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p  letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }