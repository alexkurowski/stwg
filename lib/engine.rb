require_relative 'template'
require_relative 'store'

def cleanup
  `rm -rf dist/*`
end

def scripts
  `webpack --mode development`
end

def style(src)
  dest = src[0 ... src.index('.')]

  `sass src/styles/#{src} dist/#{dest}.css`
end

def route(r, opts)
  Template.new r, opts
end

def data(src)
  Store.load_file "src/store/#{src}"
end
