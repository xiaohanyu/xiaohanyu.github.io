require 'slim'
Slim::Engine.options[:pretty] = true

include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
