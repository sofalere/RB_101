# Modify this class so new will optionally let you specify a fixed banner
# width at the time the Banner object is created. The message in the banner 
# should be centered within the banner of that width. Decide for yourself
# how you want to handle widths that are either too narrow or too wide.

class Banner
  attr_reader :message, :width
  
  def initialize(message, width = message.size)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule]
    .join("\n")
  end

  private


  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    "| #{message.center(width, ' ')} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner.width
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner.width

puts banner
# +--+
# |  |
# |  |
# |  |
# +--+