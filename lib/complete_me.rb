require 'pry'  # => true

class Node
  attr_accessor :link, :word, :weight, :value  # => nil

  def initialize( word=false, link={},  weight=0, value="")
    @link = link                                             # => {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
    @word = word                                             # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
    @weight = weight                                         # => 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    @value = value                                           # => "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""

  end


end


class CompleteMe
  attr_accessor :count  # => nil
  attr_reader :root     # => nil

  def initialize
    @root = Node.new  # => #<Node:0x007f9ea3975510 @link={}, @word=false, @weight=0, @value="">
    @count = 0        # => 0
  end

  def insert(word, node=root, value="")
    @count += 1                          # => 1, 2, 3, 4, 5, 6
    word = word.chars                    # => ["p", "i", "z", "z", "a"], ["a", "p", "p", "l", "e"], ["p", "i", "z", "z", "e", "r", "i", "a"], ["a", "a", "r", "d", "v", "a", "r", "k"], ["a", "n", "d", "r", "o", "i", "d"], ["p", "i", "c", "k", "e", "r"]
    add_word(word, node, value)          # => true, true, true, true, true, true
  end

  def add_word(word, node, value)
    if word.empty?                                # => false, false, false, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, true
      node.value = value                          # => "pizza", "apple", "pizzeria", "aardvark", "android", "picker"
      node.word = true                            # => true, true, true, true, true, true
    else
      letter = word.shift                         # => "p", "i", "z", "z", "a", "a", "p", "p", "l", "e", "p", "i", "z", "z", "e", "r", "i", "a", "a", "a", "r", "d", "v", "a", "r", "k", "a", "n", "d", "r", "o", "i", "d", "p", "i", "c", "k", "e", "r"
      value += letter                             # => "p", "pi", "piz", "pizz", "pizza", "a", "ap", "app", "appl", "apple", "p", "pi", "piz", "pizz", "pizze", "pizzer", "pizzeri", "pizzeria", "a", "aa", "aar", "aard", "aardv", "aardva", "aardvar", "aardvark", "a", "an", "and", "andr", "andro", "androi", "android", "p", "pi", "pic", "pick", "picke", "picker"
      if node.link[letter].nil?                   # => true, true, true, true, true, true, true, true, true, true, false, false, false, false, true, true, true, true, false, true, true, true, true, true, true, true, false, true, true, true, true, true, true, false, false, true, true, true, true
        node.link[letter] = Node.new              # => #<Node:0x007f9ea396fb38 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea396ea80 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea396dea0 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea396ca78 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea396e760 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea3964058 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea395f378 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea395ea90 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea395e3d8 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea395dac8 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea3957088 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea3955b20 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea394fb80 @link={}, @word=false, @weight=0, @value="">, #<Node:0x007f9ea394e500 @link={}...
        add_word(word, node.link[letter], value)  # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
      else
        add_word(word, node.link[letter], value)  # => true, true, true, true, true, true, true, true
      end                                         # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
    end                                           # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  end

  def suggest(part_word, node=root)
    part_word = part_word.chars      # => ["p", "i", "z"]
    search_trie(part_word, node)     # => nil
  end

  def search_trie(part_word, node)
    letter = part_word.shift                       # => "p"
      if node.link[letter] == letter               # => false
        search_trie(part_word, node.link[letter])
      elsif part_word.empty?                       # => false
        until node.link[letter].nil?
        return node.value if node.word == true
        end
      end                                          # => nil
  end

  def select

  end

  def populate(word_list)
    word_list.each do |word|
      insert(word)
    end

  end

end




if __FILE__ == $0  # => true

completer = CompleteMe.new  # => #<CompleteMe:0x007f9ea3975538 @root=#<Node:0x007f9ea3975510 @link={}, @word=false, @weight=0, @value="">, @count=0>

completer.insert("pizza")     # => true
completer.insert("apple")     # => true
completer.insert("pizzeria")  # => true
completer.insert("aardvark")  # => true
completer.insert("android")   # => true
completer.insert("picker")    # => true
puts completer.root.link      # => nil
puts completer.count          # => nil
dictionary = File.read("/usr/share/dict/words")
p dictionary 
# p completer.suggest("piz")    # => nil
end                           # => nil
# completer.insert("pizzeria")


# >> {"p"=>#<Node:0x007f9ea396fb38 @link={"i"=>#<Node:0x007f9ea396ea80 @link={"z"=>#<Node:0x007f9ea396dea0 @link={"z"=>#<Node:0x007f9ea396ca78 @link={"a"=>#<Node:0x007f9ea396e760 @link={}, @word=true, @weight=0, @value="pizza">, "e"=>#<Node:0x007f9ea3957088 @link={"r"=>#<Node:0x007f9ea3955b20 @link={"i"=>#<Node:0x007f9ea394fb80 @link={"a"=>#<Node:0x007f9ea394e500 @link={}, @word=true, @weight=0, @value="pizzeria">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">, "c"=>#<Node:0x007f9ea483ca08 @link={"k"=>#<Node:0x007f9ea483c170 @link={"e"=>#<Node:0x007f9ea4837d00 @link={"r"=>#<Node:0x007f9ea48371e8 @link={}, @word=true, @weight=0, @value="picker">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">}, @word=false, @weight=0, @value="">, "a"=>#<Node:0x007f9e...
# >> 6
# >> nil
