require 'pry'

# class FileReader
#

#
# end


class Node
  attr_accessor :link, :word, :weight, :value

  def initialize( word=false, link={},  weight=0, value="")
    @link = link
    @word = word
    @weight = weight

  end


end


class CompleteMe
  attr_accessor :count
  attr_reader :root

  def initialize
    @root = Node.new
    @count = 0
  end

  def insert(word, node=root, value = "")
    @count += 1
    word = word.chars
    add_word(word, node, value)
  end

  def add_word(word, node, value)
    if word.empty?
      node.value = value
      node.word = true
    else
      letter = word.shift
      value += letter
      if node.link[letter].nil?
        node.link[letter] = Node.new
        add_word(word, node.link[letter], value)
      else
        add_word(word, node.link[letter], value)
      end
    end
  end

  def suggest(word)

  end

  def populate(word_list)
    word_list.each do |word|
      insert(word)
    end

  end

end

completer = CompleteMe.new

completer.insert("pizza")
completer.insert("apple")
completer.insert("pizzeria")
puts completer.root.link
puts completer.count
# completer.insert("pizzeria")

# dictionary = File.read("/usr/share/dict/words")
