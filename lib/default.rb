# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
# encoding: utf-8

include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

module Nanoc::Filters

  class PandocSystem < Nanoc::Filter
    identifier :pandoc_system
    type :text => :text

    def run(content, params = {})
      if item[:extension] == 'org'
        `pandoc -f org -t html < #{item.raw_filename}`
      elsif ["md", "markdown"].index(item[:extension])
        `pandoc -f markdown -t html < #{item.raw_filename}`
      end
    end

  end

end
