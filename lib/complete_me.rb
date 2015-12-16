require 'pry'

# class FileReader
#

#
# end


class Node
  attr_accessor :link, :word, :weight

  def initialize( word=false, link={},  weight=0)
    @link = link
    @word = word
    @weight = weight

  end


end


class CompleteMe
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word, node=root)
    word_array = word.chars
    until word_array.empty?
      letter = word_array.shift
        if word_array.empty?
          node.word = true
        else
          if node.link[letter].nil?
            node.link[letter] = Node.new
            word = word_array.join
            insert(word, node.link[letter])
          else
            word = word_array.join
            insert(word, node.link[letter])
          end
        end
      @root
      binding.pry
    end
  end


  def suggest(word)

  end

  def count

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

# dictionary = File.read("/usr/share/dict/words")
