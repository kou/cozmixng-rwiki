# -*- rd -*-

= README.en

$Id: README.en 460 2004-09-12 09:13:02Z kou $

== Author

Kouhei Sutou <kou@cozmixng.org>

== Please

GalleryAdministrator is a m18n software. But I can't make
any messages other than Japanese and (funny) English because
of I can't understand. So I'm asking for some messages for
(correct) English, French, and so on.

== Licence

Ruby's

USE AT YOUR OWN RISK.

== Mailing list

Send mail that To field is cozdev@cozmixng.quickml.com , Cc
field is kou@cozmixng.org and Subject and Body contain
somthig to
((<"cozdev@cozmixng.quickml.com"|URL:mailto:cozdev@cozmixng.quickml.com?cc=kou@cozmixng.org&subject=Join!>)).

Note that this mailing list's main language is Japanese. But
English mail is welcome too.

== What's this?

CGI and mail interface for ((<RAA:RubyPhoto>)) and
((<zphoto|URL:http://namazu.org/~satoru/zphoto>)).

This include extended RubyPhoto. But this is not include
RubyPhoto's samples.

Good for zphoto if your zphoto version is >= 1.1.
 
You can make galleries for some languages if you want.

== Dependency libraries

  * extended ((<RAA:RubyPhoto>)) (This is included.)
  * ((<RAA:RMagick>)), ((<RAA:Imlib2-Ruby>)) or ImageMagick
    commands. (convert and identify.)
  * Iconv binding
  * XML processor: (((<RAA:REXML>)) greater or equal 2.5.0,
    ((<RAA:xmlscan>))) or ((<RAA:xmlparser>))

== Suggested libraries

  * ((<RAA:rss>))
  * ((<RAA:TMail>)) (If you use mail interface)

== Ohter suggested

  * ((<zphoto|URL:http://www.namazu.org/~satoru/zphoto/>))

== Get

((<URL:http://www.cozmixng.org/~kou/download/gallery.tar.gz>))

  % svn co http://www.cozmixng.org/repos/ruby/gallery/trunk gallery
 
== Install

  % ruby setup.rb config
  % ruby setup.rb setup
  # ruby setup.rb install

== Setup

Copy(cp) or link(ln -s) some files, and modify some files.

=== For CGI

  % cp interface/admin.rb /somewhere/that/is/accessed/via/HTTP/
  % cp sample/counter.rb /same/direcoty/of/admin.rb/
  % cp sample/{http,gallery}.conf /somewhere/that/is/included/$LOAD_PATH/
  % cp sample/dot.htaccess /somewhere/that/is/accessed/via/HTTP/.htaccess
  % cp sample/scripts/* /somewhere/that/is/set/as/JS_PATH/
  % cp sample/dot.rubyphoto-ignore /somewhere/that/is/set/as/ENV["HOME"]/.rubyphoto-ignore

And do the following.

  * Modify admin.rb, httpd.conf and gallery.conf.
  * Setup admin.rb to run as CGI.
  * Setup writable mode of GALLERY_DIR and GALLERY_DATA_DIR to write by admin.rb.

=== For templates

Select you like templates.

Templates that name is started with zphoto are for zphoto.

  % cp -R sample/templates/where_you_like_template /somewhere/that/is/templates/directory/
  % cp sample/css/* /somewhere/that/is/accessed/css/via/HTTP/
  % cp sample/images/* /somewhere/that/is/accessed/images/via/HTTP/

Modify shared.xml in each template.

=== For RubyPhoto

  % cp sample/dot.rubyphoto-ignore /somewhere/that/is/set/as/ENV['HOME']/

 * For Japanese

    % cp sample/album.xml.ja /somewhere/that/is/accessed/via/HTTP/album.xml.ja
    % cp sample/album.xml.ja /somewhere/that/is/saved/gallery/data/album.xml.ja


 * For English

    % cp sample/album.xml.en /somewhere/that/is/accessed/via/HTTP/album.xml.en
    % cp sample/album.xml.en /somewhere/that/is/saved/gallery/data/album.xml.en

=== For mail

If you want to add a image via mail, need following works.

  % cp sample/mail.conf /somewhere/that/is/included/$LOAD_PATH/
  % cp interface/mail_admin.rb /somewhere/

If you need, do following.

  % cp sample/dot.forward /your/home/directory/.forward


== Use

Access admin.rb with your browser.

== Tips

=== Settings of the password for administrator.

`.' is the user who has administrator authority. So, first,
set the password of `.' at `User Registration'.

=== Update from console

Use sample/initgallery.rb

  % initgallery.rb --config-file /path/to/gallery.conf --lang .en

Specify `--verbosity' 3 if you want to see update status.

  % initgallery.rb --config-file /path/to/gallery.conf --lang .en --verbosity 3
