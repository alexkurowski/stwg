require 'fileutils'
require 'slim'

require_relative 'slim'
require_relative 'assets'

class Template
  def initialize(route, template: 'index', layout: 'default', locals: nil)
    @route = route
    @template = template
    @layout = layout

    @content_template = Slim::Template.new template_path
    @layout_template = Slim::Template.new layout_path

    if locals.is_a? Hash
      locals.each do |key, value|
        instance_variable_set "@#{ key }", value
      end
    end

    Slim.set_context self

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
