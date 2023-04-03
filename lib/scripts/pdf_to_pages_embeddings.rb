require 'tokenizer'

$de_tokenizer = Tokenizer::WhitespaceTokenizer.new

# count the number of tokens in a string"
def count_tokens(text)
  return $de_tokenizer.tokenize(text).length()
end

puts count_tokens("hello")