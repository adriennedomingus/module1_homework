require 'faraday'
require 'json'

class TopStories

  def self.response(key, section, response_format)
    Faraday.get("http://api.nytimes.com/svc/topstories/v1/#{section}.#{response_format}?api-key=#{key}")
  end

  def self.article(key, section, response_format)
    the_response = response(key, section, response_format).body
    JSON.parse(the_response)["results"].first
  end

  def self.title
    @article["title"]
  end

  def self.author_name
    @article["byline"]
  end

  def self.date_published
    @article["published_date"]
  end

  def self.abstract
    @article["abstract"]
  end

  def self.url
    @article["url"]
  end

  def self.all(key, section, response_format)
    @article = article(key, section, response_format)
    "#{title}\n#{author_name}\n#{date_published}\n#{abstract}\n#{url}"
  end
end

if __FILE__ == $0
  key = ARGV[0]
  section = ARGV[1]
  puts TopStories.all(key, section, "json")
end
