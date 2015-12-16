require 'minitest/autorun'
require 'complete_me'

class NodeTest < Minitest::Test

  def setup

    @node = Node.new
  end

  def test_new_object_gets_created_in_the_Node_class

    assert_equal Node, @node.class
  end

end

class TrieTest < Minitest::Test

  def setup

    @trie = Trie.new
  end

  def test_new_object_gets_created_in_the_Trie_class

    assert_equal Trie, @trie.class
  end

  def test_
end


class CompleteMeTest < Minitest::Test

  def setup

    @completion = CompleteMe.new
  end

  def test_new_object_gets_created_in_the_CompleteMe_class

    assert_equal CompleteMe, @completion.class
  end

  def test_word_gets_inserted_to_the_trie_correctly

    assert_equal 1, @completion.count
  end

  def test_correctly_tells_me_how_many_words_are_in_the_dictionary

    assert_equal 235866, @completion.count
  end
  
end
