# -*- rd -*-

= Tutorial.en

$Id: Tutorial.en 526 2004-12-05 04:56:07Z kou $

Sorry for my funny English :-(

== require

Include the following if you want to parse RSS 1.0:

  require 'rss/1.0'

Parse RSS 0.9x:

  require 'rss/0.9'

Parse RSS 2.0:

  require 'rss/2.0'

You can include one, two or three of them at once. Include
this if you want to handle RSS 0.9x/1.0:

  require 'rss/0.9'
  require 'rss/1.0'

Include this if you want to handle RSS 0.9x/1.0/2.0:

  require 'rss/1.0'
  require 'rss/2.0'

You don't need including it because of RSS 2.0 includes RSS
0.9x:

  require 'rss/0.9'


You can include these items below:

  require 'rss/dublincore'
  require 'rss/syndication'
  require 'rss/content'
  require 'rss/trackback'

You can use the ((<Dublin
Core|URL:http://web.resource.org/rss/1.0/modules/dc/>))
module,
((<Syndication|URL:http://web.resource.org/rss/1.0/modules/syndication/>))
module,
((<Content|URL:http://web.resource.org/rss/1.0/modules/content/>))
module and
((<TrackBack|URL:http://madskills.com/public/xml/rss/module/trackback/>))
module if you require them.

However, Content module is only support content:encoded.

== Parsing

Use RSS::Parser class to parse RSS. RSS::Parser.parse
parse RSS of String object. It returns RSS::RDF object when
parsing RSS 1.0, or RSS::Rss object when parsing RSS
0.9x/2.0. If parsed String is not RSS 0.9x/1.0/2.0 it
returns nil or raises a exception that is a subclass of
RSS::Error.

An example of parsing RSS 1.0 with validation is
below, where the variable (({rss_source})) is String of RSS 1.0.

  require 'rss/1.0'
  rss = RSS::Parser.parse(rss_source, true)

The secend argument of RSS::Parser.parse is true by default,
so it can be left out. The following does the same as the
previous example.

  require 'rss/1.0'
  rss = RSS::Parser.parse(rss_source)

First parse RSS with validation, and if it is not valid
parse with non-validation.

  require 'rss/1.0'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end

This is good for when you don't know what version of RSS
your trying to parse. Below code first parses as RSS 1.0 with
validation, and if validation if fails parse as RSS
0.9x/(destroyed)1.0/2.0 with non-validation.

  require 'rss/1.0'
  require 'rss/2.0'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end


Require rss/dublincore, rss/syndication, rss/content and/or
rss/trackback before RSS::Parser.parse when you want to
parse elements of Dublin Core, Syndication, Content and/or
TrackBack module.

  require 'rss/1.0'
  require 'rss/2.0'
  require 'rss/dublincore'
  require 'rss/syndication'
  require 'rss/content'
  require 'rss/trackback'
  rss = nil
  begin
    rss = RSS::Parser.parse(rss_source)
  rescue RSS::InvalidRSSError
    rss = RSS::Parser.parse(rss_source, false)
  end

=== Handling of unknown elements.

The Parser's default behavior is to ignore unknown (not
specified in specifications) element. Specify third argument
of RSS::Parser.parse if you want parser to raise exception
when it comes across an unknown element. The parser raises
RSS::UnknownTagError exception when it comes across as
unknown element. RSS::UnknownTagError is a subclass of
RSS::InvalidError.

If you want to parse RSS 1.0 strictly (this is default):

  RSS::Parser.parse(rss_source, true, false)

== Parsed RSS

A parsed RSS is changed from a String object to RSS::RDF,
RSS::RDF::Channel, RSS::Rss, and so on. Each object has some
accessors that has the same name of each child element to
access child element.

=== reader

To reference a channel element child element of a rdf:RDF
is below:

  rss = RSS::Parser.parse(rss_source)
  rss.channel # => /rdf:RDF/channel; RSS::RDF::Channel

If the element doesn't have any child elements nor any
attributes, the accessor returns String. If the element is
not required, the accessor may return nil. This is same int
the case of the element having some child elements or some
attributes.

  rss = RSS::Parser.parse(rss_source)
  rss.channel.description # => /rdf:RDF/channel/text(); String

A way of accessing the attribute is same as above. A way of
accessing rdf:about attribute of channel element is like
below. The attribute avlue is String or nil.

  rss = RSS::Parser.parse(rss_source)
  rss.channel.about # => /rdf:RDF/channel/@about; String or nil

To accessing an element that may have some child elements of
same name is same as above. But if you don't specify any
argument to reader, it returns the first child element. For
example, a way of accessing item element that child element
of rdf:RDF element is like below:

  rss = RSS::Parser.parse(rss_source)
  rss.channel.item # => /rdf:RDF/item; RSS::RDF::Channel::Item

A way of accessing the third item element is shown below. Not
omitted arguments of reader is handled same as arguments
of Array#[].

  rss = RSS::Parser.parse(rss_source)
  rss.channel.item(2) # => /rdf:RDF/item[3]; RSS::RDF::Channel::Item

Plural of a child element name is a reader which get all
children. A way of accessing all the item element is shown below.

  rss = RSS::Parser.parse(rss_source)
  rss.channel.item # => /rdf:RDF/item; [RSS::RDF::Channel::Item, ...]

=== writer

A way of setting a channel element that child element of
rdf:RDF element is shown below. You can specify the first
argument of RSS::RDF::Channel.new to value of rdf:about.

  rss = RSS::Parser.parse(rss_source)
  rss.channel = RSS::RDF::Channel.new(rdf_about_value)

A way of setting value of attribute is same as above.

  rss = RSS::Parser.parse(rss_source)
  rss.channel.about = "http://cozmixng.www.cozmixng.org/"

A way of setting a child element is different when existing
some child elements that have same name. You get elements by
a method which name is plural form of element name as array.
And you set element against the array by Array#<<, Array#[]=
and so on.

  rss = RSS::Parser.parse(rss_source)
  item = RSS::RDF::Item.new(rdf_about_value)
  rss.items << item
  rss.items.last == item # => true

NOTE: Don't use item=/set_item and so on because they are
not sense of Ruby.

== Output

RSS Parser can output RSS.

=== Basic

(({#to_s})) returns string as RSS format.

The following is the flow to output RSS:

  * Make RSS object ((({RSS::RDF})) or (({RSS::Rss})) object).

  * Specify output encoding (optional).

  * Call (({#to_s})) method of RSS object.

=== xml-stylesheet

RSS Parser can output xml-stylesheet.

Root element of RSS ((({RSS::RDF})) or (({RSS::Rss})))
object has an array which name is xml_stylesheets. You can
associated xml-stylesheet with RSS by inserting
(({RSS::XMLStyleSheet})) object to the array.

  rss.xml_stylesheets << RSS::XMLStyleSheet.new(...)

You pass the following (({Hash})) or associative array to
(({RSS::XMLStyleSheet.new})) as
argument. (({RSS::XMLStyleSheet})) object which is made by
it is initialized by using passed argument.

(({Hash})):

  {
    :href => "...",
    :type => "...",
    :title => "...",
    :media => "...",
    :charset => "...",
    :alternate => "...",
  }

associative array:

  [
    [:href, "..."],
    [:type, "..."],
    [:title, "..."],
    [:media, "..."],
    [:charset, "..."],
    [:alternate, "..."],
  ]

All key is optional.

For example, do the following when you want to specify
sample.xsl as xml-stylesheet.

  rss.xml_stylesheets << RSS::XMLStyleSheet.new({:href => "sample.xsl"})

In fact, you must specify (({{:type => "text/xsl"}})), but
it is optional if the extension is .xsl or .css. Because RSS
Parser can guess the type from those extensions.

=== Making RSS object

If you want to make RSS object out of nothing, you can use
RSS Maker. RSS Maker's API, however, is not fixed. I accepts
any opinions for making the best API.


The usage is the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("VERSION") do |maker|
    maker.XXX = YYY
    ...
  end

For example, to make the following RSS:

  * URI: http://example.com/
  * Description: Example Site
  * Name: Example
  * RSS URI: http://example.com/index.rdf

You can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"
  end

If you want to add the following entry:

  * URI: http://example.com/article.html
  * Title: Sample Article

You can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
  end

If published date of the previous entry is

  * 2004/11/1 10:10

then you can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")
  end

Note:

  item.date = ...

is same as

  item.dc_date = ...

(({#dc_date=})) is only alias of (({#date=})).


If you have another entry:

  * URK: http://example.com/article2.html
  * Title: Sample Article2
  * Date: 2004/11/2 10:10

You can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")
  end

If you want to sort the entries by those published date, you
need to add the following:

  maker.items.sort = true

And you can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")
  end

If your site has the following logo:

  * Title: Example Site
  * URI: http://example.com/logo.png

You can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"
  end

If you has CGI for searching like the following:

  * URI: http://example.com/search.cgi
  * Parameter name: keyword
  * Title: Search Example Site
  * Description: Search Example Site's all text

You can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

If you want to add xml-stylesheet like the following:

  * URI: http://example.com/index.xsl

You can write like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("1.0") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

If you want to make RSS 2.0, you need to change the first
argument of (({RSS::Maker.make})) like the following:

  require "rss/maker"
  
  rss = RSS::Maker.make("2.0") do |maker|
    xss = maker.xml_stylesheets.new_xml_stylesheet
    xss.href = "http://example.com/index.xsl"

    maker.channel.about = "http://example.com/index.rdf"
    maker.channel.title = "Example"
    maker.channel.description = "Example Site"
    maker.channel.link = "http://example.com/"

    maker.items.sort = true

    item = maker.items.new_item
    item.link = "http://example.com/article.html"
    item.title = "Sample Article"
    item.date = Time.parse("2004/11/1 10:10")

    item = maker.items.new_item
    item.link = "http://example.com/article2.html"
    item.title = "Sample Article2"
    item.date = Time.parse("2004/11/2 10:10")

    maker.image.title = "Example Site"
    maker.image.url = "http://example.com/logo.png"

    maker.textinput.title = "Search Example Site"
    maker.textinput.description = "Search Example Site's all text"
    maker.textinput.name = "keyword"
    maker.textinput.link = "http://example.com/search.cgi"
  end

If you want to make RSS 0.91, you need to change the first
argument of (({RSS::Maker.make})) to (({"0.91"})).

== Sample

I introduce some sample scripts of RSS Parser. Those scripts
are included in sample/ directory.

=== Sample1 - List items

Let's write a script that parse RSSs and display list of
values of item elements.

First, require to be able to parse RSS 0.9x/1.0/2.0.

  require 'rss/1.0'
  require 'rss/2.0'

Parsed RSSs are saved in files and assume thir name is
provided as command line arguments.

  ARGV.each do |fname|
    rss_source = nil
    File.open(fname) do |f|
      rss_source = f.read
    end

    rss = nil
    begin
      rss = RSS::Parser.parse(rss_source, false)
    rescue RSS::Error
    end

    if rss.nil?
      puts "#{fname} is not RSS 0.9x/1.0/2.0."
    else
      print_items(rss)
    end
  end

And define print_items method.

RSS::RDF and RSS::Rss has some convenience methods; items
and image.

Items method returns array of /rdf:RDF/item elements when
RSS::RDF, or /rss/channel/item elements when RSS::Rss.

Image method returns /rdf:RDF/image element when RSS::RDF,
or /rss/channel/image element when RSS::Rss.

  def print_items(rss)
    rss.items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end

You can use RSS::RDF#output_encoding= or
RSS::Rss#output_encoding= to change output encoding. If
specify encoding that can't be converted raise exception
that is RSS::UnknownConvertmethod object.

Let's rewrite above print_items to output UTF-8.

  def print_items(rss)
    begin
      rss.output_encoding = "UTF-8"
    rescue RSS::UnknownConversionMethodError
    end
    rss.items.each do |item|
      puts "#{item.title} : #{item.description}"
    end
  end

=== Sample2 - Display items sorted with update tiem

Next, let's display items sorted with update time using date
attribute of Dublin Core module.

This library has accessor that name `dc_<element_name>' to
access elements of Dublin Core module. By the way it has
accessor that name `sy_<element_name>' to access elements of
Syndication module and Content modules's one is
`content_<element_name>'.

Required files are below:

  require 'rss/1.0'
  require 'rss/dublincore'

Parsed RSSs are saved in files and assume thir name is
provided as command line arguments same as sample1.

  items = []
  ARGV.each do |fname|
    rss_source = nil
    File.open(fname) do |f|
      rss_source = f.read
    end

    rss = nil
    begin
      rss = RSS::Parser.parse(rss_source, true)
    rescue RSS::Error
    end

    if rss.nil?
      puts "#{fname} is not RSS 1.0."
    else
      begin
        rss.output_encoding = "iso-8859-1"
      rescue RSS::UnknownConversionMethodError
      end
      rss.items.each do |item|
        items << item if item.dc_date
      end
    end
  end
  print_items(items)

And define method print_items.

Item#dc_date returns Time object or nil. (({items})) dosen't
have nil, so we can sort like bolow:

  def print_items(items)
    items.sort do |x, y|
      y.dc_date <=> x.dc_date
    end.each do |item|
      puts "#{item.dc_date.localtime.iso8601} : #{item.title} : #{item.description}"
    end
  end


=== Sample3 - To blend some RSS.

TODO: write sample based on sample/blend.rb.
