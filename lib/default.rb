# -*- coding: utf-8 -*-
# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
# encoding: utf-8

include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

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
