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
