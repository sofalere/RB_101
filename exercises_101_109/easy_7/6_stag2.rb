def staggered_case(str)
  stag = ''
  need_upper = true
  str.chars do |let|
    if let =~ /[a-zA-Z]/
      if need_upper
        stag << let.upcase
      else
        stag << let.downcase
      end
      need_upper = !need_upper
    else
        stag << let
    end
  end
  stag
end


p  staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p  staggered_case('ALL CAPS') == 'AlL cApS'
p  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'