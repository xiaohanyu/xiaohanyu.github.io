# default nanoc helpers
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap

# slim options
require 'slim'
Slim::Engine.options[:pretty] = true

# extend ruby's string
class NilClass
  def titleize
    ""
  end
end

class String
  def upcase?
    match(/\p{Lower}/) == nil
  end

  def titleize
    split(/(\W)/).map { |w| w.upcase? ? w : w.capitalize }.join
  end
end

def previous_link
  prev_index = sorted_articles.index(@item) + 1
  prev_article = sorted_articles[prev_index]
  if prev_article.nil?
    link_to("Archive", "/archive", :class => "item", :title => "Archive")
  else
    title = prev_article[:title]
    link_to("Prev", prev_article.path, :class => "item", :title => title)
  end
end

def next_link
  next_index = sorted_articles.index(@item) - 1
  if next_index < 0
    link_to("Archive", "/archive", :class => "item", :title => "Archive")
  else
    post = sorted_articles[next_index]
    title = post[:title]
    link_to("Next", post.path, :class => "item", :title => title)
  end
end

def get_quotes(lang)
  require 'json'
  require 'yaml'

  case lang
  when :en
    JSON.dump(YAML::load(@items['/quotes/words-en.txt'].raw_content))
  when :cn
    JSON.dump(YAML::load(@items['/quotes/words-cn.txt'].raw_content))
  end
end
