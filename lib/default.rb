# -*- coding: utf-8 -*-
# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
# encoding: utf-8

require 'nanoc/cachebuster'
require 'nanoc/toolbox'

include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::XMLSitemap
include Nanoc::Helpers::CacheBusting
include Nanoc::Toolbox::Helpers::GoogleAnalytics

class NilClass
  def titleize
    ""
  end
end

class String
  def titleize
    split(/(\W)/).map(&:capitalize).join
  end
end

def get_date(datetime)
  datetime.strftime(format="%Y-%m-%d")
end

def previous_link
  prev = sorted_articles.index(@item) + 1
  prev_article = sorted_articles[prev]
  if prev_article.nil?
    ''
  else
    title = prev_article[:title]
    html = "&larr; Prev"
    link_to(html, prev_article.reps[0], :class => "previous", :title => title)
  end
end

def next_link
  nxt = sorted_articles.index(@item) - 1
  if nxt < 0
    ''
  else
    post = sorted_articles[nxt]
    title = post[:title]
    html = "Next &rarr;"
    link_to(html, post.reps[0], :class => "next", :title => title)
  end
end

def all_js(files)
  js_arr = []
  for file in files
    item = @items.find { |i| i.identifier == "/assets/js/#{file}/" }
    puts "File #{file} doesn't exist!" unless item
    js_arr << item.compiled_content
  end
  js_arr.join("\n")
end

def all_css(files)
  css_arr = []
  for file in files
    item = @items.find { |i| i.identifier == "/assets/css/#{file}/" }
    puts "File #{file} doesn't exist!" unless item
    css_arr << item.compiled_content
  end
  css_arr.join("\n")
end
