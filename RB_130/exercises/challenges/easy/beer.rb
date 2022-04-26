=begin
PROBLEM
- prgoram that generates all the lyricsc to the beer song

RULES
- one bottle changes the string, no 's'

- verse method(arg)
  - return lyrics for that arg (they go one down)
  
- verses method(args)
  - return lyrics for range

- lyrics method
  - return all lyrics
  
< 2 bottles = "3 bottles of beer on the wall, 3 bottles of beer.\n" \
      "Take one down and pass it around, 2 bottles of beer on the wall.\n"
2 bottles ="2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
1 bottle = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
0 bottles = "No more bottles of beer on the wall, no more bottles of beer.\n" 
\ "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

APPROACH
have verse instance method be called for verses and lyrics

when >= 2 `#{num} bottles`
when == 1 `#{num} bottle`
when == 0 `no more bottles'\ "Go to the store and buy some more, 
            99 bottles of beer on the wall.\n" Capitalize verse

=end

class BeerSong
  def self.lyrics
    verses(99, 0)
  end

  def self.verses(start_point, end_point)
    h = []
    start_point.downto(end_point) do |bottles|
      h << verse(bottles)
    end
    h.join("\n")
  end

  def self.verse(bots)
    return none_left if bots.zero?

    tn = bots == 1 ? 'it' : 'one'
    <<~BEERSONG
      #{str_it(bots)} of beer on the wall, #{str_it(bots)} of beer.
      Take #{tn} down and pass it around, #{str_it(bots-1)} of beer on the wall.
    BEERSONG
  end

  def self.str_it(bottles)
    case bottles
    when 1 then"#{bottles} bottle"
    when 0 then 'no more bottles'
    else "#{bottles} bottles"
    end
  end

  def self.none_left
    <<~BEERSONG
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    BEERSONG
  end
end
