module Slim
  def self.partial(name, options = {}, &block)
    Slim::Template.new("src/views/partials/#{name}.slim", options).render(self, &block)
  end
end
