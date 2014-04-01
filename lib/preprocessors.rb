# Preprocessor helpers
#
# This file has a collection of methods that are meant to be used in the
# preprocess-block in the Nanoc Rules file.

def create_github_cname
  @items << Nanoc3::Item.new(@site.config[:github][:cname],
                             {:is_hidden => true},
                             '/cname/')
end

def create_sitemap
  @items << Nanoc3::Item.new("<%= xml_sitemap %>",
                             {},
                             '/sitemap/')
end

def create_atom
  content = <<EOS
<%= atom_feed \
:title => '#{@site.config[:meta_data][:title]}',
:author_name => '#{@site.config[:meta_data][:author]}',
:author_uri => '#{@site.config[:base_url]}',
:limit => 10 %>
EOS

  @items << Nanoc3::Item.new(content,
                             {:extension => 'xml', :is_hidden => true},
                             '/atom/')
end
