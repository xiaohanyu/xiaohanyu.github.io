# This file provide two pandoc filters for html and pdf output

module Nanoc::Filters

  class PandocHtml < Nanoc::Filter
    identifier :pandoc_html
    type :text => :text

    def run(content, params = {})
      input_format = case item[:extension]
                     when 'org'
                       'org'
                     when 'md', 'markdown'
                       'markdown'
                     end

      `pandoc --mathjax -f #{input_format} -t html5 < #{item.raw_filename}`
    end

  end

  class PandocPdf < Nanoc::Filter
    identifier :pandoc_pdf
    type :text => :binary

    require 'tempfile'

    def run(content, params = {})
      temp_pdf_file = Tempfile.new(['nanoc_temp_pdf_file', '.pdf'], '/tmp')

      input_format = case item[:extension]
                     when 'org'
                       'org'
                     when 'md', 'markdown'
                       'markdown'
                     end

      `pandoc --mathjax -f #{input_format} -t latex --latex-engine xelatex -V geometry:margin=1in < #{item.raw_filename} -o #{temp_pdf_file.path}`

      FileUtils.mv(temp_pdf_file, output_filename)
    end

  end

end
