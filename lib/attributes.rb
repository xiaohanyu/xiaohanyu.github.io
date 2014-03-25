module Attributes
  extend Nanoc::Memoization

  # Collect all attributes from articles
  #
  # :call-seq:
  #   all_attributes(key, posts) -> array
  #
  # By default all posts are scanned. Add a collection to limit the
  # posts scanned. The items in the array are Nanoc::Items where the
  # +kind+ is +article+
  #
  # Returns an array of strings with the name of attributes on those posts.
  def all_attributes(key, posts=articles)
    attribs = []
    posts.each do |article|
      next if article[key].nil?
      attribs << article[key]
    end
    attribs.flatten.compact.sort.uniq
  end
  memoize :all_attributes

  # Find all articles with a specific attribute.
  #
  # :call-seq:
  #   articles_with_attribute(key, attrib, posts) -> array
  #
  # By default all articles are checked. Pass in an array to limit the
  # search to a subset of articles.
  def articles_with_attribute(key, attrib, posts=articles)
    posts.select { |article| article[key].include? (attrib) }
  end
  memoize :articles_with_attribute

  # Collect all articles and return them in sub-arrays by attribute.
  #
  # :call-seq:
  #   articles_by_attribute(key, posts) -> [[attrib, array]]
  #
  #  By default all articles are checked. Pass in an array to limit the
  # search to a subset of articles.
  def articles_by_attribute(key, posts=articles)
    attribs = []
    all_attributes(key).each do |attrib|
      attribs << [attrib, articles_with_attribute(key, attrib)]
    end
    attribs.sort_by { |attrib, post_list | post_list.length }.reverse
  end
  memoize :articles_by_attribute

  def link_attribute(key, attrib)
    case key
    when :categories
      "<a href=/categories/index.html##{attrib.downcase}>#{attrib}</a>"
    when :tags
      "<a href=/tags/index.html##{attrib.downcase}>#{attrib}</a>"
    end
  end

end

include Attributes
