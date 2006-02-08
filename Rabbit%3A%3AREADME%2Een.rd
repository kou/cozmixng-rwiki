# -*- rd -*-

= README.en

$Id: README.en 550 2006-02-07 05:38:07Z kou $

== Name

Rabbit

== What's this?

This is an application to do presentation with RD document.

There are some features which are different from other
presentation tools:

  * To define slide look, use Ruby.
  * There are many keyboard interfaces.
  * This supports mouse gesture.
  * and more...

== Screenshots

((<URL:http://pub.cozmixng.org/~gallery/kou/screenshot/rabbit/>))

== Author

=== Program

Kouhei Sutou <kou@cozmixng.org>

=== Images (1)

* Lavie (mascot) ((-Lavie's sense of language is from Rabbit
  and spell is from `la vie' in French.-)) and Rabbit logos.

  (pretty rabbit)

* Banner

  (pretty banner)


MoMo

=== Images (2)

* USAGI (in Kanji)

  cool rabbit.

# * USAGI (in Hiragana)
#
#   pretty running rabbit.

* KAME

  pretty turtle.

sode <sodetaka@kono.cis.iwate-u.ac.jp>

=== Images (3)

Flags.

gan <shinsato@kono.cis.iwate-u.ac.jp>

=== Images (4)

* Rabbit pink logo

* Ruby pink logo

* USA-TARO

* KAME-TARO

* TANU-KITARO (TANU-san)

* YUKIDARU-TARO (YUKIDARU-san)

usatti

=== Mode for xyzzy

misc/xyzzy

Mr. MIYAMUKO

== Co-Authors

  * Mr. MIYAMUKO
  * Mr. noritada

== Licence

Ruby's (except files under lib/rabbit/tgif.rb). For more
information see COPYING.

The files under lib/rabbit/tgif.rb is the
same licence of
((<Tgiftools|URL:http://homepage2.nifty.com/aito/tgiftools/>)).
For more information see COPYING-TGIFTOOLS.

If you want to get PSD file of mascot character, tell
program author. I'll ask images author.

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== Development status

You can get information of development from commit mail ML
or ((<commit
RSS|URL:http://www.cozmixng.org/rss/rabbit.rdf>)). If you
want to subscribe ML, send the following mail.

  To: rabbit-commit@ml.cozmixng.org
  Cc: null@cozmixng.org
  Subject: SOMETHING
  
  SOMETHING

== Please

Please make a great theme because I have no sence.

Rabbit lacks documents. Please help me.

Please translate some messages. You can make
po/#{LANG}/rabbit.po by the following.

  % mkdir po/#{LANG}
  % ./update-po.rb

== Dependency libraries

See ((<Rabbit::INSTALL.win32.en>)) if you install dependency
libraries on Windows.

  * ((<RAA:rdtool>))
  * Ruby/GTK2 in ((<RAA:ruby-gnome2>))

=== Suggested programs/libraries

  * mimeTeX (for writing TeX in RD)
  * gs (for reading EPS)
  * libgnomeprint >= 2.8 (for outputting PS/PDF)
  * Ruby/GnomePrint in ((<RAA:ruby-gnome2>)) (for outputting
    PS/PDF)
  * Ruby/RSVG in ((<RAA:ruby-gnome2>)) (for beautiful scaling
    SVG)
  * ((<RAA:ruby-gettext>)) (for displaying localized messages)
  * ((<RAA:htree>))

=== Included libraries

  * ((<RAA:rttool>)) altered: same as including ((<RAA:rwiki>)).
  * SOAP interface of ((<RAA:rwiki>)).

== Download

((<URL:http://www.cozmixng.org/~kou/download/rabbit.tar.gz>))

  % svn co http://www.cozmixng.org/repos/rabbit/trunk rabbit

The old repository is here.

  % svn co http://www.cozmixng.org/repos/ruby/rabbit/trunk rabbit

== Install

  # ruby setup.rb

Execute install.bat if you are on Windows.

== Usage

  % rabbit XXX.rd

or

  % rabbit --type file XXX.rd

or ...

Type the following if you want to run sample/rabbit_en.rd.

  % rabbit --type file sample/rabbit_en.rd

However, some samples use themes in sample/rabbit/theme and
are not displayed correctly when run from the top directory.
You would be better off running samples in the sample
directory.

If you are Windows user, you can drag and drop RD file to
bin/rabbit.bat.

Or else you can invoke Rabbit by double clicking RD file if
you associate *.rd (or *.rbt (an abbreviation of Rabbit))
with the following.

  <ruby install folder>\bin\rubyw -S rabbit

=== Options

: -t, --theme
   Specifies the theme.

: -I, --include
   Adds the load path. Load paths are used to search theme.

: -B, --base
   Specifies the URI or path to resolve relative path in the
   input. (For example, the path of image). If you don't
   specify it, it's automatically decided on the input
   source type.

: -T, --type
   Specifies the input source type.

   Available types are rwiki, file (default), argf and uri .

   : argf

     Uses ARGF as input source. This means, you can
     input via standard input.
     
     You cannot use the function of auto source reload.
     
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

     You can use the function of auto source reload.
     
     Example:
       % rabbit --type file file.rd

   : uri

     Gets source from specified URI.

     You can use the function of auto source reload. But
     Rabbit doesn't reload untill because of performance.

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

     Uses the content of specified RWiki's page as
     source. RWiki must have SOAP interface.

     You can use the function of auto source reload. But
     Rabbit doesn't reload untill because of performance.

     Example:
       % rabbit --type rwiki #{URI of SOAP interface of RWiki} #{page name}

     The encoding of #{page name} is same as RWiki's one.

   : memory

     Manage the source on the memory. In this type, the
     source can be modified by dRuby/SOAP/... interface.
     
     You can set initial source by specify file name.

     Example (without initial source):
       % rabbit --type memory

     Example (with initial source):
       % rabbit --type memory file.rd

: -e, --encoding
   Specifies encoding of the input source.
   
   Default is auto-detect.

: -f, --full-screen, --no-f, --no-full-screen
   Specifies whether Rabbit is invoked with full screen mode.

   Default is no.

: --index-mode, --no-index-mode
   Specifies whether Rabbit is invoked with index mode.

   Default is no.

: -w, --width
   Specifies the width of window.
   
   Default is 800.
   
: -h, --height
   Specifies the height of window.

   Default is 600.
   
: -S, --size
   Specifies the width and height of window.

: -s, --save-as-image
   Saves each slide as image and exit.

: -i, --saved-image-type
   Specifies image type when saves.
   
   For example, png (default), jpeg and so on.

: -b, --saved-image-basename
   Specifies base name of saved image. Saved image is 
   "#{base name}#{page number}.#{extension}".
   
   Default is title of slide.
   
   If encoding of your file system isn't UTF-8 and saved
   filename is UTF-8, you may need to setup environment
   variable such as LANG and G_FILENAME_ENCODING.

: --output-html, --no-output-html
   Specifies whether Rabbit generates HTML or not for
   viewing saved slides.
   
   Default is off.

: -p, --print
   Prints slide and exit. You can print to file or directory
   send printer by using --output-filename.
   
   But the quality is not good.

: -o, --output-filename
   Specifies printed file name. Printed format is decided by
   extension. Printed format is PostScript when extension is
   .ps, is PDF when extension is .pdf and is PostScript when
   extension is other.
   
   You can send the output formatted by PostScript to the
   program by specifying "|program-name".
   
   Default is "#{title of slide}.ps".

: --paper-width
   Specifies the width of paper when printing. The unit of
   width of paper is inch.
   
   Default is the width of landscape A4.
   
: --paper-height
   Specifies the height of paper when printing. The unit of
   height of paper is inch.

   Default is the height of landscape A4.
   
: --paper-size
   Specifies the width and height of paper when printing.
   The unit of width and height of paper is inch.
   
   Default is the size of landscape A4.

: --slides-per-page
   Specifies slides per page.
   
   Default is 1.

: --margin, --margin-*
   Specifies margin of slide when slides per margin is
   greater than 1.
    
   Default is automatically computed by using slides per
   page. But the algorithm is not good when slides per page
   is except 2 or 8.

: --page-margin, --page-margin-*
   Specifies page margin when printing.
   
   Default is 0.

: --locale-dir
   Specifies the directory which has locale data (*.mo).
   If you want to use Rabbit without installing to system,
   you can type the following in the top directory.

     % ruby -I./lib bin/rabbit --locale-dir data/locale sample/rabbit_en.rd
   
   Default is /usr/local/share/locale/, 
   /usr/share/locale/ and so on.

: --logger-type
   Specifies how display error log. If you specify `gui',
   error log is displayed. You should be specify --logger-type
   option because error may be occurred when parsing options
   of rabbit.

     % rabbit --logger-type gui ...
   
   Default is stderr which output log to standard error
   output.

: --use-druby, --no-use-druby
   Specifies whether to use dRuby interface.

   Default is use.

: --druby-uri [URI]
   Specifies dRuby interface URI.

   Default is druby://:10101.

: --output-druby-uri, --no-output-druby-uri
   Specifies whether to output dRuby interface URI.

   Default is not output.

: --use-soap, --no-use-soap
   Specifies whether to use SOAP interface.

   Default is not use.

: --soap-host [HOST]
   Specifies SOAP interface host.

   Default is 0.0.0.0.

: --soap-port [PORT]
   Specifies SOAP interface port.

   Default is 10103.

: --use-xmlrpc, --no-use-xmlrpc
   Specifies whether to use XML-RPC interface.

   Default is not use.

: --xmlrpc-host [HOST]
   Specifies XML-RPC interface host.

   Default is 0.0.0.0.

: --xmlrpc-port [PORT]
   Specifies XML-RPC interface port.

   Default is 10104.

: --server, --no-server
   Specifies whether to run as server.
   
   Default is not server.

: --comment-source [FILE]
   Specifies initial comment source file name.
   
   Default is simple comment source provided by system.

: --comment-encoding [ENCODING]
   Specifies comment source encoding.

   Default is auto-detect.

== How to write

See sample/rabbit_en.rd.

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
information of the slide by using labeled list (:) in the
title page.

  = Title of slide

  : author
     Kouhei Sutou
  : institution
     COZMIXNG

This example shows the author is Kouhei Sutou and his
institution is COZMIXNG.

For now, you can specify subtitle, content_source and theme
too. `theme" is the default theme of this slide.

=== Image

Writes as verbatim block. See sample/rabbit_en.rd.

=== Entity reference

Writes as inline verbatim. See sample/rabbit_en.rd.

=== Sub/Superscript

Writes as inline verbatim. See sample/rabbit_en.rd.

=== Headline

You cannot use except the most biggest headline. (You don't
need some headlines except title, don't you?)

=== Footnote

You can use it but should not use it in presentation.

== Theme

You specify look and feel of the slide regardless of RD.
This is the theme.

=== Where does place a theme?

A theme is searched by using ruby's $LOAD_PATH. If you make
a theme, place it to
((|PATH_OF_INCLUDED_IN_$LOAD_PATH/rabbit/theme/THEME_NAME/THEME_NAME.rb|))

=== How to write a theme?

A theme is a Ruby script.

You may enumerate the following description in your theme.

  (1) Select some elements (paragraphs, titles and so on) of
      slide as target.

  (2) Change property of selected elements and add actions.

For example, the following changes color of title of each
page except title page.

  match(Page, HeadLine) do |heads|
    heads.prop_set("foreground", "red")
  end


=== Property

You can set some properties by using
(({prop_set})). ((<Pango Text Attribute
Markup|URL:http://developer.gnome.org/doc/API/2.4/pango/PangoMarkupFormat.html>))
has more informations.

: font_desc
   Specifies font description.

: font_family
   Specifies font family.
   
   You can get a list of font family by using (({font_families})).

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

You need the following:

  * ps2pdf

For example, we make XXX_multi.pdf which has 8 slides per
page from XXX.rd.

  % rabbit -p --slides-per-page 8 -o XXX.ps XXX.rd
  % ps2pdf XXX.ps

== Thanks

  * MoMo: She drow some pretty images.
  * MIYAMUKO: He wrote rabbit mode for xyzzy. He helps
    Rabbit works on Windows.
  * zunda: He fixed EPS handling. He gives me an advise for
    --margin. He makes a presentation with Rabbit.
  * Vincent: He helps Rabbit works on Max OS X. He makes
    french messages. 
  * sode: He wrote cool rabbit, pretty rabbit and pretty
    turtle.
  * Kazuhiko: He sent me many bug reports. He makes a
    presentation with Rabbit. He gives me an idea for theme
    design.
  * noritada: He sent me a bug report for document.
  * gan: He wrote some flags.
  * KAKUTANI: He sent me a bug report for document. He makes
    a presentation with Rabbit. He gives me an idea for new
    features and theme design.
  * atzm: He makes Gentoo package (*.ebuild).
  * akira yamada: He makes Debian package (*.deb).
  * usatti: She drow some logos and taro series images.
  * dot: He helps installation on Windows.
  * tanaka: He checks operations on Windows.
