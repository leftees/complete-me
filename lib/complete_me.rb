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
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word, node=root, value = "")
      if word.empty?
        node.value = value
        node.word = true
      else
    letter = word.shift
    value += letter
        if node.link[letter].nil?
          node.link[letter] = Node.new
          insert(word, node.link[letter], value)
        else
          insert(word, node.link[letter], value)
        end
      end
  end


    # def insert(word, node=root)
    #   word_array = word.chars
    #   until word_array.empty?
    #     letter = word_array.shift
    #     value += letter
    #       if word_array.empty?
    #         node.value = value
    #         node.word = true
    #       else
    #         if node.link[letter].nil?
    #           node.link[letter] = Node.new
    #           word = word_array.join
    #           insert(word, node.link[letter])
    #         else
    #           word = word_array.join
    #           insert(word, node.link[letter])
    #         end
    #       end
    #     @root
    #     binding.pry
    #   end
    # end



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

completer.insert("pizza".chars)
completer.insert("apple".chars)
completer.insert("pizzeria".chars)
puts completer.root.link
# completer.insert("pizzeria")

# dictionary = File.read("/usr/share/dict/words")
