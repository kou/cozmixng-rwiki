= RubyCocoa

== CGContextRefを取得

  # enscript ruby
  OSX::NSGraphicsContext.currentContext.graphicsPort

ただし、事前にウィンドウを表示したりしておかないとnilが返ってくる。

ちなみに、これを使ってCairo::QuartzSurfaceを作るならこう。

  # enscript ruby
  require 'osx/cocoa'
  require 'cairo'

  cg = OSX::NSGraphicsContext.currentContext.graphicsPort
  width = 100
  height = 100
  surface = Cairo::QuartzSurface.new(cg, width, height)
