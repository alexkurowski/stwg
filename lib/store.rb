require 'yaml'

module Store
  def self.load_file(src)
    @@data = YAML.load_file src
  end

  def self.[](*path)
    @@data.fetch *path
  end
end
