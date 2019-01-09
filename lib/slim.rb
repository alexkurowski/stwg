module Slim
  def self.partial(name, options = {})
    Slim::Template.new("src/views/partials/#{name}.slim", options).render(@@context)
  end

  def self.set_context(context)
    @@context = context
  end
end
