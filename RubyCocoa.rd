= RubyCocoa

== CGContextRef�����

  # enscript ruby
  OSX::NSGraphicsContext.currentContext.graphicsPort

�������������˥�����ɥ���ɽ�������ꤷ�Ƥ����ʤ���nil���֤äƤ��롣

���ʤߤˡ������Ȥä�Cairo::QuartzSurface����ʤ餳����

  # enscript ruby
  require 'osx/cocoa'
  require 'cairo'

  cg = OSX::NSGraphicsContext.currentContext.graphicsPort
  width = 100
  height = 100
  surface = Cairo::QuartzSurface.new(cg, width, height)
