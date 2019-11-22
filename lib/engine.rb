require_relative 'template'
require_relative 'store'

def cleanup
  `rm -rf dist/*`
end

def scripts
  `npx webpack --mode development`
end

def style(src)
  l = src.rindex('/') || 0
  dest = src[l ... src.index('.')]

  `sass src/styles/#{src} dist/#{dest}.css`
end

def assets
  `mkdir -p dist/assets`
  `cp -r assets/* dist/assets/`
  `cp -r public/* dist/`
end

def route(r, opts)
  Template.new r, opts
end

def data(src)
  Store.load_file "src/store/#{src}"
end
