class TextAnalyzer
  def process
    mock = File.open("mock.txt")
    yield(mock.read)
    mock.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(" ").count} word" }

# # 3 paragraphs
# 15 lines
# 126 words