arr = ['10', '11', '9', '7', '8']

p arr.sort_by { |st| st.to_i }.reverse


#or

puts arr.sort { |a, b| b.to_i <=> a.to_i }


# CAREFUL when I ran this with the do..end syntax of a block it returned the orginal array
# because the puts was bound more tightly to <arr> than the block