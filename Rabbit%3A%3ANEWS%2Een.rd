# -*- rd -*-

= NEWS.en

$Id: NEWS.en 1331 2009-12-16 13:09:53Z kou $

== Changes 0.6.3 from 0.6.2: 2009-12-16

=== Improvements

  * [#180] Supported inline markup in DL with Wiki format.
    [kdmsnr]
  * Added butler rabbit to the standard theme.
  * Changed to use scaled images by default even when
    printing mode.
  * Supported pixbuf rendering with alpha channel.
    (when cairo is used as rendering engine)

==== Theme

  * Added:
    * lightning-monochrome:
      Takahashi method slide + monochrome normal slide
  * Changed:
    * default-block-quote: Added
      @block_quote_image_background_alpha parameter that
      specifies alpha channel of background images.
    * default-preformatted: Made auto text size adjustment
      optional. It is customized by
      @preformatted_keep_in_size parameter.
    * clear-blue: Displayed title in the left bottom by
      default. It can be disabled by the following theme:
        include_theme("clear-blue")
        @slide_footer_info_left_text = ""
  * Supported nest of "itemize > enum" and
    "itemize > itemize > enum".

==== Experimental

((*This maybe changed in the feature.*))

  * Supported tag:

    syntax:
      (('tag:name:content'))
    or
      (('tag:name'))content

    e.g.:
      slide.rab:
        (('tag:center'))Hi, look it!

      theme.rb:
        match("**", CustomTag) do |tags|
          tags.each do |tag|
            case tag.name
            when "center"
              tag.parent.horizontal_centering = true
            end
          end
        end

      output(before):
        +-------------------+
        | Hi, look it!      |
        +-------------------+

      output(after):
        +-------------------+
        |    Hi, look it!   |
        +-------------------+

=== Fixes

  * Fixed a problem that fullscreen doesn't work on Ruby 1.9
    [Masaki Suketa]
  * [#179] Fixed a problem that Rabbit sometimes crashes
    with mouse clicks. [kdmsnr]
  * newline-in-slides theme: Disabled newline substitution in
    preformatted text.
  * Fixed a problem that cursor isn't displayed after
    unfullscreen.

=== Thanks

  * Masaki Suketa
  * kdmsnr

== Changes 0.6.2 from 0.6.1: 2009-10-03

=== Improvements

  * Rabbit became an official MacPorts package! [kimura wataru]
  * Supported '''strong''' Wiki markup [kdmsnr]
  * Ignored level 2 or larger section in Wiki markup [kdmsnr]
  * Theme
    * pdf-tortoise-and-hare: Added margin between slide edge,
      tortoise and hare.
    * clear-blue: Supported changing images of tortoise and hare.
    * Added set_font_resolution_ratio that can change
      character size in a lump.
  * rabbit-mode: Supported rabbit-command.
  * Updated prototype.js: 1.4.0 -> 1.6.0
  * Supported justify.
  * Added a command that gets the current slide content as
    RD format.
  * Added --geometry option.
  * Supported RubyGems.

=== Fixes

  * Fixed a problem that allotted-time is ignored in
    lightning-simple theme. [Kazuhiro NISHIYAMA]
  * Removed system DPI dependency. [Kazuhiro NISHIYAMA]
  * Fixed a problem that displayed slide and PDF slide is
    different. [Kazuhiro NISHIYAMA]
  * Fixed a problem that images aren't resized with GDK
    backend.

== Changes 0.6.1 from 0.6.0: 2009-07-17

=== Improvements

  * Images are rendered after resized by Gdk::Pixbuf on
    display mode.
  * Theme
    * lightning-talk-toolkit: supported :hide-title
    * slide-show: timer is reset after each loop
    * slide-show: default slide show span is computed from
      allotted time and slide size.
  * "\n" is available by default.
  * Wiki format supports slide property.
  * RD format supports 'wait' in nested itemize. [Kazuhiro NISHIYAMA]

=== Fixes

  * Added missing GPL license file.
  * Fixed a problem that PDF isn't resized on display size change.
  * Fixed a problem that index mode doesn't work for title
    only slide. [rabbit-shockers:654] [OBATA Akio]
  * Fixed a problem that block wait doesn't work. [OBATA Akio]

== Changes 0.6.0 from 0.5.9: 2009-05-23

=== Improvements

  * Supported Bonjour: [kimura wataru]
  * Added new mascot character "Tailavi": [MoMo]
    * ((<URL:http://www.cozmixng.org/repos/rabbit/trunk/sample/momo/tailavi/>))
  * Added subtitle to windows title.
  * Supported slide property.
  * Added alternative images for "rabbit and tortoise".
  * Original image is used for PDF embedding instead of
    resized image.

=== Fixes

  * Fixed a typo in sample/kof2005/gesture.rb: [#143][IWAI, Masaharu]
  * Fixed install document: [zunda]
  * Fixed English: [Eduardo Gonzalez]

== Changes 0.5.9 from 0.5.8: 2009-02-09

  * Improvements
    * HTML output: supported link to PDF.
    * added rabbit-command command line tool to control Rabbit.
    * supported reflected image effect (requested by kdmsnr)

      Example:
        * ((<URL:http://www.clear-code.com/archives/SendaiRubyKaigi01/love-and-continue-it-104.html>))
        * ((<URL:http://www.clear-code.com/archives/SendaiRubyKaigi01/love-and-continue-it-085.html>))

      How to write:
        # image
        # src = XXX.jpg
        # relative_height = 80
        # reflect_ratio = 0.5

  * Theme
    * New themes
      * pdf-tortoise-and-hare:
        uses tortoise and hare timer when PDF viewer
        mode. Allotted time is specified by
        RABBIT_ALLOTTED_TIME environment variable.

        How to use:
          % RABBIT_ALLOTTED_TIME=4.5m rabbit --theme pdf-tortoise-and-hare XXX.pdf
      * lightning-clear-blue:
        uses large character slides in bluish clear-blue theme.
      * title-on-image-toolkit:
        superimposes title on image.

        Example:
        ((<URL:http://www.clear-code.com/archives/SendaiRubyKaigi01/love-and-continue-it-036.html>))

        How to use:
          In slide:
            = Users Group

              # image
              # src = shocker.jpg
              # relative_height = 90

          In theme:
            include_theme("title-on-image-toolkit")

            match(Slide) do |slides|
              slides.each do |slide|
                slide.title_on_image if slide.title_on_image?
              end
            end

  * Bug fixes
    * fixed wrong Wiki format detection.

== Changes 0.5.8 from 0.5.7: 2008-10-18

  * Improvements
    * supported Clutter
      * supported page transition
      * supported new comment view that flow comments on a slide.
    * supported IRC backend
      * RabbIRC (akira yamada)
  * Theme
    * added shadow to quote marks
    * try to use Hiragino font if available
    * add a new theme
      * newline-in-slides: supports '\n' newline notation
  * Bug fixes
    * fixed too much grabbed problem on magnifier mode
    * reworked Tofu backend
    * fixed a problem that was reported on Asakusa.rb

== Changes 0.5.7 from 0.5.6: 2008-07-21

  * Bug fixes
    * fixed broken PDF generation
  * Improvements
    * supported GTK+/Quartz (Mac OS X native UI)
    * supported context menu with Control + left click
      (suggested by OBATA Akio)
    * align = XXX accepts :right or "left" too
    * supported nested labels in (('note:XXX:YYY:...')) form
    * added "Next" and "Previous" actions that consider pause.
    * added "ResetTimer" action
    * do fullscreen as first as possible when --fullscreen
      command line option is specified
    * supported {{wait}} and {{br}} markup on Wiki format
    * fixed dirty sample slide
  * Theme
    * added body margin
    * added "dash" item mark
    * stopped to use vivid colors for list item mark
    * added properties
    * added new themes:
      * newline-in-title: supports '\n' newline notation
      * edge-info-toolkit: displays information at the edge
        of slide
      * slide-header-info: displays information at the header
        of slide
      * slide-footer-info: displays information at the footer
        of slide
      * footer-logo: displays logo image at the footer of slide
      * blue-bar: a theme that displays bars at the top and
        bottom of slide
      * clear-blue: clear blue theme

== Changes 0.5.6 from 0.5.5: 2008-04-21

  * removed RTtool
  * supported Ruby 1.9 a bit
  * supported pause

== Changes 0.5.5 from 0.5.4: 2008-03-01

  * Bug fixes
    * fixed tests (reported by OBATA Akio)
    * fixed --margin option
  * supported HikiDoc installed by RubyGems
  * removed Tgif related files (reported by OBATA Akio)
  * removed needless windows-adjust theme
  * stopped to show progress message when index page is generating
  * added --log-level option
  * added document for MacPorts
  * rabbit-mode.el:
    * removed a needless variable.

== Changes 0.5.4 from 0.5.3: 2007-12-15

  * Documentation update
    * fixed ruby.st's URL (kitaj)
    * updated document of MacPorts (kimura wataru)
  * Theme related
    * added some color configuration to night-black theme
    * added slide-logo theme
    * added slide-footer theme
  * Bug fixes
    * fixed cairo backend availability check
    * fixed Wiki parser loading bug (reported by OBATA Akio)
    * suppressed warnings on Windows
    * fixed "/" handling on Windows (JunichiNakai, OBATA Akio)
  * logged progress in background (suggested by OBATA Akio)
  * changed default print format to PDF
  * supported "check" for itemize mark
  * added --show-native-window-id option
  * supported <<< LANG\n...\n>>> with Wiki parser
  * added block quote sample
  * supported an image file as source (Rabbit can be an image viewer)
  * added as_large_as_possible image size option
  * removed config.rb on 'setup.rb clean' (Kobayashi Noritada)
  * removed Tgif support
  * added --man option (Kobayashi Noritada)
  * supported slideshare.net as source
  * supported DnD

== Changes 0.5.3 from 0.5.2: 2007-08-04

  * Theme related
    * added Day White/Night Black themes (TADA Tadashi)
    * added a slide for benchmarking theme (suggested by
      TADA Tadashi)
    * added Green Circle theme.
    * renamed Auto Slide to Slide Show.
    * clean-upped (codes of) theme.
  * Documentation update
    * INSTALL.win32 (Masao Mutoh, zunda）
  * Bug fixes
    * escaped '_' in page name for page name list in menu.
      (reported by Shugo Maeda)
    * fixed a GRClosure related problem. (akira yamada)
    * fixed a crash bug when reloading source.
    * fixed a bug that occurs with --output-html without
      --output-index-html.
    * fixed a bug that font configurations are ignored in
      printing.
  * improved GIMP support (akira yamada)
  * removed libgnomeprint support.
  * supported Wiki notation (HikiDoc).
    (included hikidoc.rb only in this release)
  * marked quality of PS/PDF output is enough.
  * added a toggle Magnifier action to menu.
  * added a toggle Spotlight action to menu.
  * supported partial rendering.
    (syntax in source is not supported yet）
  * {start,stop}_reload_timer -> {start,stop}_redraw_timer
    ({start,stop}_reload_timer are still available for
    backward compatibility）

== Changes 0.5.2 from 0.5.1: 2007-06-02

  * updated documents
    * rabbit-mode.el (Atsushi Takeda)
    * MacPorts (kimura wataru)
  * improved rabbit-mode.el (Atsushi Takeda)
    * added rabbit-default-image-size-unit variable
  * fixed bugs that causes start-up failure (reported by atzm)
  * other minor fixes (reported by OBATA Akio)

== Changes 0.5.1 from 0.5.0: 2007-03-29

  * supported PDF as input format.
  * improved rabbit-mode.el. (Atsushi Takeda)
    * rabbit-copy-slide: added
    * rabbit-duplicate-slide: added
  * updated messages in French. (Scritch)
  * fixed a bug related font families on printing.
  * removed libgnomeprint support.

== Changes 0.5.0 from 0.4.2: 2006-11-03

  * fixed a bug related GtkGLExt loading. (KAKUTANI Shintaro)
  * improved rabbit-mode.el. (Atsushi Takeda)
  * updated documentation of emerge. (akapy)
  * added documentation of MacPorts. (kimura wataru)
  * added workaround for RSVG path resolving.
  * (useless) Ruby/Anthy support.
  * supported information window for multi display environment.
  * use Rabbit/Rabbit Monospace font family preferentially.
  * added affine transformation related APIs.
    * canvas.rotate_context
    * canvas.scale_context
    * canvas.translate_context
    * canvas.reflect_context
    * canvas.shear_context
  * added APIs to save drawing context.
    * canvas.save_context
    * canvas.restore_context
  * supported "\n" to input new line in lightning-talk theme.
  * added 'around' hook.
  * added new themes.
    * rotate-zoom-effect
    * emphasize-keyword
    * scroll-effect
    * mirror-effect
  * added spotlight function.
    ((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/spotlight/>))
  * added magnifier function.
    ((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/magnifier/>))
  * supported gradation.
  * updated setup.rb to 3.4.1.

== Changes 0.4.2 from 0.4.1

  * fixed a search regular expression bug. (nskj77)
  * fixed documents. (nskj77, kitaj)
  * imported rabbit-mode.el. (Atsushi Takeda)
  * fixed a bug related HTML generation. (KAKUTANI Shintaro)
  * added Alice image. (asahina)
  * updated rabbit-mode.l. (MIYAMUKO Katsuyuki, id:wata_d)
  * supported takahashi method instead of takahashi alias.
  * supported PDF rendering with Ruby/Poppler.
  * improved OpenGL support.
  * supported AJAX in Rabrick.
  * supported mobile phone.
  * improved memory usage.

=== Other news

  * Mac OS X package (DarwinPorts) is available by kimura wataru.
