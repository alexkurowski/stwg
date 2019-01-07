require 'fileutils'
require 'slim'

require_relative 'slim'

class Template
  def initialize(route, template: 'index', layout: 'default')
    @route = route
    @template = template
    @layout = layout

    @content_template = Slim::Template.new template_path
    @layout_template = Slim::Template.new layout_path

    @content =
      @layout_template.render do
        @content_template.render self
      end

    write_file
  end

  private

  def layout_path
    "src/views/layouts/#{ @layout }.slim"
  end

  def template_path
    "src/views/templates/#{ @template }.slim"
  end

  def write_file
    path = "dist#{@route}"

    unless File.directory? path
      FileUtils.mkdir_p path
    end

    File.write "#{path}/index.html", @content
  end
end
