# This file provides filters that convert yaml to json.

module Nanoc::Filters

  class YamlToJson < Nanoc::Filter
    identifier :yaml_to_json
    type :text => :text

    require 'json'
    require 'yaml'

    def run(content, params = {})
      JSON.dump(YAML::load(content))
    end
  end
end
