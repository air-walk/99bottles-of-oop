class Bottles

  def verse(bottle_num)
    <<-VERSE
#{pluralize("bottle", "bottles", bottle_num).capitalize} of beer on the wall, #{pluralize("bottle", "bottles", bottle_num)} of beer.
#{second_half(bottle_num)}
VERSE
  end

  def pluralize(input_str_singular, input_str_plural, num)
    case num
    when 1
      "1 #{input_str_singular}"
    when 0
      "no more #{input_str_plural}"
    else
      "#{num} #{input_str_plural}"
    end
  end

  def second_half(bottle_num)
    case bottle_num - 1
    when - 1
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{bottle_num == 1 ? "it" : "one"} down and pass it around, #{pluralize("bottle", "bottles", bottle_num - 1)} of beer on the wall."
    end
  end

  def verses(start_num, end_num)
    result = []

    (start_num.downto(end_num)).each{ |bottle_num| result << verse(bottle_num) } 
    result.join("\n")
  end

  def song
    verses(99, 0)
  end
end