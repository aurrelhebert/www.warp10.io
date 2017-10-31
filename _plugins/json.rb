# encoding: utf-8
#
# Title:
# ======
# Jekyll to JSON Generator
#
# Description:
# ============
# A plugin for generating JSON representations of your
# site content for easy use with JS MVC frameworks


module Jekyll
  require 'json'

  class JSONGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # Converter for .md > .html
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      # Iterate over all pages
      site.pages.each do |p|
        # Encode the HTML to JSON
        hash = {:content => converter.convert(p.content), :title => p.data['title'] , :desc => p.data['desc'] }
        title = p.name.downcase.tr(' ', '-').delete('’!')
        title.slice! '.md'
        # Start building the path
        if title == 'index'
            title = ''
        end
        path = '_site/raw/'
        # Add categories to path if they exist
        if p.data['category'].class == String
          path << p.data['category'].tr(' ', '/')
        elsif p.data['category'].class == Array
          path <<  p.data['category'].join('/')
        end

        # Add the sanitized post title to complete the path
        path << "/#{title}"
        # Create the directories from the path
        FileUtils.mkpath(path) unless File.exists?(path)

        # Create the JSON file and inject the data
        f = File.new("#{path}/raw.json", 'w+')
        f.puts JSON.generate(hash)
      end

    end

  end

end