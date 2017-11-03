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
      menu = Hash.new
      puts ''
      # Iterate over all pages
      site.pages.each_with_index do |p, index|
        # Encode the HTML to JSON
        p.data['path'] = p.path
        print "#{(100 * index / site.pages.size())}%                                     \r"
        hash = {:content => converter.convert(p.content), :title => p.data['title'], :desc => p.data['desc']}
        title = p.name.downcase.tr(' ', '-').delete('’!')
        title.slice! '.md'

        # Start building the path
        if title == 'index'
          title = ''
        end
        path = ''
        # Add categories to path if they exist
        if p.data['category'].class == String
          path << p.data['category'].tr(' ', '/')
        elsif p.data['category'].class == Array
          path << p.data['category'].join('/')
        end

        # Add the sanitized post title to complete the path
        path << "/#{title}"
        # Create the directories from the path
        FileUtils.mkpath("_site/raw/#{path}") unless File.exists?("_site/raw/#{path}")


        catPath = p.data['path'].split('/')
        catTree = catPath.first catPath.size - 1
        catPath = catTree.join('/')
        unless menu.has_key?(catPath)
          menu[catPath] = Array.new
        end

        menu[catPath].push({:title => p.data['title'], :path => path})
        # Create the JSON file and inject the data
        f = File.new("_site/raw/#{path}/raw.json", 'w+')
        f.puts JSON.generate(hash)
      end
      puts ''
      m = File.new('_site/raw/menu.json', 'w+')
      m.puts JSON.generate(menu)
      puts 'done'
    end

  end

end