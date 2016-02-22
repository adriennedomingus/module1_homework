
class Classifier
  attr_reader :feature_count, :classification_count

  def initialize
    @feature_count = {}
                # => { 'word' => { 'bad' => 0, 'good'=> 6}, 'another' => { 'bad' => 3, 'good' => 3} }
    @classification_count = {}
                       # => { 'bad' => 3, 'good' => 9}
  end

  def getwords(doc)
    #Split document into words. Decide whether a word is actually your feature?
    #Downcase all of them, but caps can be a determining factor too ('yelling')
    doc.split(/\W/).map do |word|
      word.downcase
    end
  end

  #Increase count of feature/category pair
  def increase_feature_count(word, category)
    if !@feature_count[word]
      @feature_count[word] = {}
    end
    if !@feature_count[word][category]
      @feature_count[word][category] = 0
    end
    @feature_count[word][category] += 1
  end

  #Increase count of category
  def increase_classification_count(category)
    @classification_count[category] ||= 0
    @classification_count[category] += 1
  end

  #Number of times a feature has appeared in a category
  def word_count(word, category)
    if !@feature_count[word]
      0
    elsif @feature_count[word][category]
      @feature_count[word][category]
    else
      0
    end
  end

  #Number of items in a category
  def category_count(category)
    if @classification_count[category]
      @classification_count[category]
    else
      0
    end
  end

  #Total number of unique features
  def total_count
    @classification_count.values.reduce(:+)
  end

  #List of all categories
  def categories
    @classification_count.keys
  end

  def train(document, category)
    features = getwords(document)
    features.each do |word|
      increase_feature_count(word, category)
      increase_classification_count(category)
    end
    feature_count
  end

  #Divide the number of times the word appears in a document by the total number of documents in that category
  #Conditional probability Pr(A | B)
  def feature_probability(feature, category)
    (word_count(feature, category).to_f) / (category_count(category).to_f)
  end
end


classifier = Classifier.new
puts classifier.train("This is a string string a", "good")
puts classifier.train("This is a nother string alkdjfa;", "bad")
puts classifier.classification_count
puts classifier.feature_probability("string", "good")
