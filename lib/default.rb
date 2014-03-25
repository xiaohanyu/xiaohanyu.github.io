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
        `pandoc --mathjax -f org -t html < #{item.raw_filename}`
      elsif ["md", "markdown"].include?(item[:extension])
        `pandoc --mathjax -f markdown -t html < #{item.raw_filename}`
      end
    end

  end

  class PandocPdf < Nanoc::Filter
    identifier :pandoc_pdf
    type :text => :binary

    require 'tempfile'

    def run(content, params = {})
      temp_pdf_file = Tempfile.new(['nanoc_temp_pdf_file', '.pdf'], '/tmp')

      if item[:extension] == 'org'
        `pandoc --mathjax -f org -t latex < #{item.raw_filename} -o #{temp_pdf_file.path}`
      elsif ["md", "markdown"].include?(item[:extension])
        `pandoc --mathjax -f markdown -t latex < #{item.raw_filename} -o #{temp_pdf_file.path}`
      end

      FileUtils.mv(temp_pdf_file, output_filename)
    end

  end

end

def get_date(datetime)
  datetime.strftime(format="%Y-%m-%d")
end
