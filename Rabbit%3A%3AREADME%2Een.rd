# -*- rd -*-

= README.en

$Id: README.en 1420 2010-10-24 14:42:20Z kou $

== Name

Rabbit

== What is it?

Rabbit is an RD-document-based presentation application.

Rabbit has some features which set it apart from other
presentation tools:

  * Use plain Ruby to define the look of your slides
  * Lots of keyboard commands
  * Mouse gesture support.
  * and more...

== Screenshots

((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/>))

== Author

=== Program

Kouhei Sutou <kou@cozmixng.org>

=== Images (1)

* Lavie (mascot) ((-Lavie's sense of language is from Rabbit
  and spell is from `la vie' in French.-)) and Rabbit logos.

  (cute rabbit)

* Tailavi and Taiyaki

  gluttonous rabbit loves Taiyaki.

* Banner

  (cute banner)

MoMo

=== Images (2)

* USAGI (in Kanji)

  the cool rabbit.

* KAME

  the cute turtle.

sode

=== Images (3)

Flags.

gan

=== Images (4)

* Rabbit pink logo

* Ruby pink logo

* USA-TARO

* KAME-TARO

* TANU-KITARO (TANU-san)

* YUKIDARU-TARO (YUKIDARU-san)

usatti

=== Images (5)

* YUKI-USA

  pretty rabbit girl in Japanese dress.

* Alice

  pretty girl in blue dress.

asahina

((<URL:http://littleblue.chu.jp/>))

=== Mode for xyzzy

misc/xyzzy/

Mr. MIYAMUKO

=== Mode for Emacs

misc/emacs/

Atsushi Takeda

=== RabbIRC

bin/rabbirc

akira yamada

=== Rabbitter

bin/rabbitter

OBATA Akio

== Co-Authors

  * Mr. MIYAMUKO
  * Mr. noritada
  * Atsushi Takeda

== Copyright

The code author retains copyright of the source code. In
other words the committer retains copyright of his or her
committed code and patch authors retain the copyright of
their submitted patch code.

The images above are copyright their respective owners.

== License

Licensed under GPLv2 or later. For more information see
'GPL' file. Provided patches, codes and so on are also
licensed under GPLv2 or later. Kouhei Sutou can change their
license. Authores of them are cosidered agreeing with those
rules when they contribute their patches, codes and so on.

lib/rabbit/div/prototype.js released under an MIT-style
licence. For more information see ((<Prototype JavaScript
Framework|URL:http://prototype.conio.net/>)).

If you want to get a copy of the mascot character PSD files
ask the program author. He'll forward the request to the
author of the image.

== Mailing list

To Subscribe to the mailing list send an e-mail To
rabbit-shockers-en@ml.cozmixng.org , please Cc:
kou@cozmixng.org and put anything in the Subject and Body.
((<"rabbit-shockers-en@ml.cozmixng.org"|URL:mailto:rabbit-shockers-en@ml.cozmixng.org?cc=kou@cozmixng.org&subject=Join!>)).

== Development status

You can stay up to date on the latest development by
subscribing to the SVN commit ML or ((<commit
RSS|URL:http://www.cozmixng.org/rss/rabbit.rdf>)). If you
want to subscribe to the ML, send an e-mail like the following.

  To: rabbit-commit@ml.cozmixng.org
  Cc: null@cozmixng.org
  Subject: SOMETHING
  
  SOMETHING

== Requests

Please contribute great themes because I have no artistic
sense.

Rabbit lacks documentation. Please help out!

Please translate rabbit into your native language. You can make
po/#{LANG}/rabbit.po by the running the following:

  % mkdir po/#{LANG}
  % ./update-po.rb

== Dependencies

See ((<Rabbit::INSTALL.win32.en>)) for how to install the
dependencies in Windows.

  * ((<RAA:rdtool>))
  * Ruby/GTK2 in ((<RAA:ruby-gnome2>))

=== Suggested programs/libraries

  * mimeTeX (for writing TeX in RD)
  * gs (for reading EPS)
  * Ruby/RSVG in ((<RAA:ruby-gnome2>)) (for beautiful scaling
    SVG)
  * ((<RAA:ruby-gettext>)) (for displaying localized messages)
  * ((<RAA:htree>))
  * ((<Migemo|URL:http://0xcc.net/migemo/>))
  * LaTeX
  * Tgif
  * Dia
  * GIMP
  * HikiDoc

=== Included libraries

  * SOAP interface of ((<RAA:rwiki>)).

== Download

((<URL:http://www.cozmixng.org/~kou/download/rabbit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rabbit/trunk rabbit

== Install

  # ruby setup.rb

Execute install.bat if you are on Windows.

=== Gentoo (Portage)

  % sudo env ACCEPT_KEYWORDS=~x86 FEATURES="digest" emerge rabbit

is just ((%% sudo emerge rabbit%)) enough?

== Usage

  % rabbit XXX.rd

or

  % rabbit --type file XXX.rd

or ...

Type the following if you want to run sample/rabbit_en.rd.

  % rabbit --type file sample/rabbit_en.rd

However, some samples use themes in sample/rabbit/theme and
are not displayed correctly when run from the top directory.
It's better to run the samples from the sample directory.

If you are a Windows user, you can drag and drop an RD file
onto bin/rabbit.bat.

Otherwise you can invoke Rabbit by double clicking an RD file if
you associate *.rd (or *.rbt (an abbreviation of Rabbit))
with the following.

  <ruby install folder>\bin\rubyw -S rabbit

=== Options

: -t, --theme=THEME
   Specifies the theme.

: -I, --include=PATH 
   Adds PATH to the load path. Load paths are used to find themes.

: -B, --base=BASE
   Specifies the URI or path to resolve relative paths in the
   input. (For example, the path of image). If you don't
   specify it, it'll automatically decide based on the input
   source type.

: -T, --type=TYPE
   Specifies the input source type.

   Available types are rwiki, file (default), argf and uri .

   : argf

     Uses ARGF as input source. This means, you can
     input via standard input.
     
     Note: argf doesn't support the auto source reload feature.
     
     Example:
       % rabbit --type argf file1.rd file2.rd ...
     or
       % cat file1.rd file2.rd ... | rabbit --type argf
     or
       % rabbit --type argf
       = title
       ...
       ^D
     or...

   : file

     Default. This means, `--type argf' is optional.
     
     Gets source from specified file.

     Supports the auto source reload feature.
     
     Example:
       % rabbit --type file file.rd

   : uri

     Gets source from the specified URI.

     You can use the auto source reload feature. But
     Rabbit will only reload once every 60 seconds for
     performance reasons.

     Example:
       % rabbit --type uri http://www.cozmixng.org/repos/rabbit/trunk/sample/rabbit-implementation.rd
     or
       % rabbit --type uri ftp://.../XXX.rd
     or ...

     Incidentally,
       % rabbit --type uri file:///.../XXX.rd
     and
       % rabbit --type uri /.../XXX.rd
     are same as
       % rabbit --type file /.../XXX.rd
     

   : rwiki

     Uses the content of the specified RWiki's page as
     the source. RWiki must have the SOAP interface enabled.

     You can use the auto source reload feature. But
     Rabbit will only reload once every 60 seconds for
     performance reasons.

     Example:
       % rabbit --type rwiki #{URI of SOAP interface of RWiki} #{page name}

     The encoding of #{page name} is the same as the RWiki
     page's encoding.

   : memory

     Manage the source in memory. In this type, the source
     can be modified by the dRuby/SOAP/etc. interfaces.
     
     You can set initial source by specifying a file name.

     Example (without initial source):
       % rabbit --type memory

     Example (with initial source):
       % rabbit --type memory file.rd

: -e, --encoding=ENCODING
   Specifies encoding of the input source.
   
   Default is auto-detect.

: -f, --full-screen, --no-f, --no-full-screen
   Specifies whether Rabbit is invoked in full screen mode.

   Default is no.

: --index-mode, --no-index-mode
   Specifies whether Rabbit is invoked in index mode.

   Default is no.

: -w, --width=WIDTH
   Specifies the width of the window.
   
   Default is 800.
   
: -h, --height=HEIGHT
   Specifies the height of the window.

   Default is 600.
   
: -S, --size=WIDTH,HEIGHT
   Specifies the width and height of the window.

: -s, --save-as-image
   Saves each slide as image and exit.

: -i, --saved-image-type=TYPE
   Specifies image type to save as.
   
   For example, png (default), jpeg etc.

: -b, --saved-image-base-name=BASE_NAME 
  Specifies base name of the saved image. Saved image's
  file name is "#{base name}#{page number}.#{extension}".
   
   Default is the title of the slide.
   
   If the encoding of your file system isn't UTF-8 and the
   saved filename is UTF-8, you may need to setup an
   environment variable such as LANG and
   G_FILENAME_ENCODING.

: --output-html, --no-output-html
   Specifies whether Rabbit generates HTML or not for
   viewing saved slides.
   
   Default is off.

: --output-index-html, --no-output-index-html
   Specifies whether Rabbit generates an index HTML file
   with thumbnailed slides or not.
   
   Default is off.

: -p, --print
   Prints slide and exit. You can print to file or directory
   send printer by using --output-filename.
   
   But the quality is not good.

: -o, --output-filename=FILENAME
   Specifies printed file name. Printed format is decided by
   the extension. The printed format is PostScript when the 
   extension is .ps, PDF when extension is .pdf and
   PostScript otherwise.
   
   You can send the output formatted by PostScript to a
   program by specifying "|program-name".
   
   Default is "#{title of slide}.ps".

: --paper-width=WIDTH
   Specifies the width (in inches) of the paper when printing.
   
   Default is the width of landscape A4.
   
: --paper-height=HEIGHT
   Specifies the height (in inches) of the paper when printing. 

   Default is the height of landscape A4.
   
: --paper-size=WIDTH,HEIGHT
   Specifies the width and height of the paper when printing.
   The width and height is in inches.
   
   Default is the size of landscape A4.

: --slides-per-page=SLIDES
   Specifies slides per page.
   
   Default is 1.

: --margin=={ALL|TOP_BOTTOM,LEFT_RIGHT|TOP,LEFT_RIGHT,BOTTOM|TOP,RIGHT,BOTTOM,LEFT}, --margin-*=MARGIN
   Specifies margin of slide when slides per margin is
   greater than 1.
    
   Default is automatically computed by using slides per
   page. But the algorithm doesn't work very well when 
   the slides per page is anything other than 2 or 8.

: --page-margin=={ALL|TOP_BOTTOM,LEFT_RIGHT|TOP,LEFT_RIGHT,BOTTOM|TOP,RIGHT,BOTTOM,LEFT}, --page-margin-*=MARGIN
   Specifies page margin when printing.
   
   Default is 0.

: --locale-dir=DIR
   Specifies the directory which has the locale data (*.mo).
   If you want to use Rabbit without installing to system,
   you can type the following in the top directory.

     % ruby -I./lib bin/rabbit --locale-dir data/locale sample/rabbit-en.rd
   
   Default is /usr/local/share/locale/, 
   /usr/share/locale/ and so on.

: --logger-type=TYPE
   Specifies how display the error log. If you specify `gui',
   the error log is displayed. You should specify --logger-type
   option because errors may occur when parsing rabbit's options.

     % rabbit --logger-type gui ...
   
   Default is stderr which outputs the log to standard error
   output.

: --use-druby, --no-use-druby
   Specifies whether to use dRuby interface.

   Default is use.

: --druby-uri=URI
   Specifies dRuby interface URI.

   Default is druby://:10101.

: --output-druby-uri, --no-output-druby-uri
   Specifies whether to output dRuby interface URI.

   Default is not output.

: --use-soap, --no-use-soap
   Specifies whether to use SOAP interface.

   Default is not use.

: --soap-host=HOST
   Specifies SOAP interface host.

   Default is 0.0.0.0.

: --soap-port=PORT
   Specifies SOAP interface port.

   Default is 10103.

: --use-xmlrpc, --no-use-xmlrpc
   Specifies whether to use XML-RPC interface.

   Default is not use.

: --xmlrpc-host=HOST
   Specifies XML-RPC interface host.

   Default is 0.0.0.0.

: --xmlrpc-port=PORT
   Specifies XML-RPC interface port.

   Default is 10104.

: --server, --no-server
   Specifies whether to run as server.
   
   Default is not server.

: --public-level=LEVEL
   Specifies what Rabbit functions are public to external
   interfaces (dRuby/XML-RPC/SOAP). Select public level from
   strict, move, read-size, change-size, size, read-source,
   change-source, source and all. The later the public level
   indicates that Rabbit publishes more functions.

   Default is strict.

: --comment-source=FILE
   Specifies initial comment source file name.
   
   Default is simple comment source provided by system.

: --comment-encoding=ENCODING
   Specifies comment source encoding.

   Default is auto-detect.

: --migemo-dictionary-search-path=PATH1,PATH2,...
   Specifies search paths for Migemo's static
   dictionary. Search paths are specified as a directory
   that has a static dictionary whose name is specified by
   --migemo-dictionary-name or as a path of a static
   dictionary. Two or more search paths can be specified by
   separating them with commas.

   Default is /usr/local/share and /usr/share.

: --migemo-dictionary-name=NAME
   Specifies Migemo's static dictionary name.

   Default is migemo-dict.

: --use-gl, --no-use-gl
   Specifies whether to use OpenGL if available.

   Default is not use.

: --show-native-window-id, --no-show-native-window-id
   Specifies whether show window ID if available.

   Default is not show.

== How to write slides for Rabbit

See sample/rabbit-en.rd.

=== Page

The largest headline (=) is title of page. The page follows
next title.

  = Title

  SOMETHING

  ...

  = Next Page

  ...

This example has two pages.

=== Title page

The first page is the title page. You can specify meta
information of the slide by using a labeled list (:) in the
title page.

  = Title of slide

  : author
     Kouhei Sutou
  : institution
     COZMIXNG

This example shows the author is Kouhei Sutou and his
institution is COZMIXNG.

At the moment, you can specify subtitle, content_source and
even the theme. `theme" is the default theme of this slide.

=== Image

Written as a verbatim block. See sample/rabbit-en.rd.

=== Entity reference

Written as an inline verbatim. See sample/rabbit-en.rd.

=== Sub/Superscript

Written as an inline verbatim. See sample/rabbit-en.rd.

=== Headline

You can only use headlines for the biggest headline. (The
only headline you really need is the title, right?)

=== Footnote

You can footnotes but you shouldn't use it in a presentation.

== Theme

You can specify look and feel of the slide separate of RD.
This is the theme.

There is a slide for benchmarking your theme. It's
sample/theme-bench-en.rab.

=== Where do I place the theme?

Rabbit searches for themes by using ruby's $LOAD_PATH. If you make
a theme, place it into
((|PATH_OF_INCLUDED_IN_$LOAD_PATH/rabbit/theme/THEME_NAME/THEME_NAME.rb|))
or ((|DIRECTORY_OF_SOURCE_FILE/THEME_NAME.rb|)).

=== How do I write a theme?

A theme is just a Ruby script.

You may enumerate the following descriptions in your theme.

  (1) Select some elements (paragraphs, titles and so on) of
      the slide as a target.

  (2) Change properties of selected elements and add actions.

For example, the following changes color of the title of each
page except the title page.

  match(Page, HeadLine) do |heads|
    heads.prop_set("foreground", "red")
  end


=== Property

You can set some properties by using
(({prop_set})). ((<Pango Text Attribute
Markup|URL:http://developer.gnome.org/doc/API/2.4/pango/PangoMarkupFormat.html>))
has more information.

: font_desc
   Specifies font description.

: font_family
   Specifies font family.
   
   You can get a list of font families by using (({font_families})).

: face
   Same as font_family.

: size
   Specifies size of font.
   
   If you specify size of font by numeric value, you should
   convert the value by (({screen_size})) and multiply it by
   (({Pango::SCALE})). The following example shows how to
   specify size of font to 2 (in the Rabbit's theme world).

     screen_size(2) * Pango::SCALE

: style
   Specifies style of font.

: weight
   Specifies weight of font.

: variant
   Specifies variant of font.

: stretch
   Specifies stretch of font.

: foreground
   Specifies foreground.

: background
   Specifies background.

: underline
   Specifies kind of underline.

: rise
   Specifies vertical position of character.

: strike through
   Specifies whether use strike line or not.

: fallback
   Specifies whether use alternative font or not when
   specified font is not found.

: lang
   Specifies the language.

: b
   Changed to bold.

: big
   Changed size of font to big.

: i
   Changed to italic.

: s
   Draws a strike line.

: sub
   Changed to subscript.

: sup
   Changed to superscript.

: small
   Changed size of font to small.

: tt
   Changed font family to fixed width font.

: u
   Draws a underline.

=== Hooks

You can add procedures which are executed before/after
element is drawn by
(({add_pre_draw_proc}))/(({add_post_draw_proc})).  And you
can remove them by
(({clear_pre_draw_procs}))/(({clear_post_draw_procs})).

The `default' theme has more code. Please see it.

== Tips

=== To make a PDF which has some slides per page

For example, we make XXX_multi.pdf which has 8 slides per
page from XXX.rd.

  % rabbit -p --slides-per-page 8 -o XXX_multi.pdf XXX.rd

== Thanks

  * MoMo: Drew some pretty images.
  * MIYAMUKO: Wrote rabbit mode for xyzzy, and helps
    make Rabbit work on Windows.
  * zunda:
    * Fixed EPS handling.
    * Gave me advise for --margin.
    * Makes presentations with Rabbit.
    * Updated INSTALL.win32.ja.
    * Updated INSTALL.macosx-macports.{ja,en}.
  * Vincent: Helped make Rabbit work on Max OS X. He also 
    made french messages.
  * sode: Made the cool rabbit, cute rabbit and cute
    turtle.
  * Kazuhiko: Sent me many bug reports. He also makes 
    presentations with Rabbit and gives me ideas for theme
    design.
  * noritada: Sent me a bug report for document.
  * gan: Wrote some flags.
  * KAKUTANI:
    * Sent me a bug report for document.
    * Makes presentations with Rabbit.
    * Gave me ideas for new features and theme design.
    * Gave me a patch to fix a bug related HTML
      generation.
    * Made a Mac OS X (Intel) package.
  * atzm: Made Gentoo package (*.ebuild).
  * akira yamada:
    * Made Debian package (*.deb).
    * Reports some bugs and also fixes them.
    * Made rabbirc.
  * usatti: Drew some logos and taro series images.
  * dot: Helps with installation on Windows.
  * tanaka: Checked operations on Windows.
  * asahina: Drew the pretty rabbit girl and Alice.
  * nskj77: Gave a name to FAQ page. He sends action
    reporting and some bug reports.
  * Atsushi Takeda: Wrote rabbit mode for Emacs.
  * kimura wataru: Made a Mac OS X package.
  * kitaj:
    * Makes presentations with Rabbit.
    * Improved INSTALL.win32.en.
    * Improved a theme.
  * akapy: Wrote a document for emerge.
  * OBATA Akio:
    * Made a pkgsrc package.
    * Makes presentations with Rabbit.
    * Reports some bugs and also fixes them.
    * Helps debug many problems.
    * Made Rabbitter.
  * Masao Mutoh:
    * Makes presentations with Rabbit.
    * Updated INSTALL.win32.ja.
  * TADA Tadashi:
    * Makes presentations with Rabbit.
    * Contributed his themes.
    * Propposed the idea to have Rabbit provide a slide for
      benchmarking your theme.
  * Shugo Maeda:
    * Makes presentations with Rabbit.
    * Reported a bug.
  * JunichiNakai: Reports bugs.
  * Eduardo Gonzalez: Improves documents in English.
  * Kazuhiro NISHIYAMA: Reported a bug.
  * Masaki Suketa: Reported bugs related Ruby 1.9.
  * kdmsnr: Reported a bug.
  * Youhei SASAKI: The official Debian package maintainer.
