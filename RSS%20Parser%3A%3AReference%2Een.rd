# -*- rd -*-

= Reference.en

$Id: Reference.en 23 2005-04-07 06:38:01Z kou $

This is a reference of RSS Maker.

You can understand RSS Parser's API easily if you know
the elements of RSS. And I abbreviate it because you'll be
able to use it, sorry.

== Note

I don't use traditional notation of Ruby's method like
(({Class#instance_method})) and (({Class.class_method})). I
use the same notation of code. In fact, I write the
following when I show instance method (({meth})) of (({obj})):

  obj.meth

And the (({maker})) which is appeared in the following is
block argument name of (({RSS::Maker.make})). That is, the
(({maker})) is a (({maker})) in the following.

  RSS::Maker.make(...) do |maker|
    ...
  end

--- RSS::Maker.make(version, &block)
     ((|version|)) is (({"1.0"})), (({"0.91"})), (({"0.9"}))
     or (({"2.0"})). Note that (({"0.9"})) is the same as
     (({"0.91"})).
     
     This returns RSS object which is made by the
     (({maker})) object after yields ((|block|)).

== maker

This is an object which makes root element of RSS.

RSS object doesn't be made if you don't configure
(({maker.channel})) appropriately.

--- maker.version
     Returns XML version.

--- maker.version=(value)
     Sets XML version.

--- maker.encoding
     Returns XML encoding. The default value is UTF-8.

--- maker.encoding=(value)
     Sets XML encoding. You need to use same encoding of it
     when you set some values to the (({maker})).

--- maker.standalone
     Returns XML standalone.

--- maker.standalone=(value)
     Sets XML standalone.

--- maker.rss_version

--- maker.xml_stylesheets
     Returns the object which administrate some
     (({xml_stylesheet}))s.
     
--- maker.channel
     Returns the object which makes channel element.
     
--- maker.image
     Returns the object which makes image element.
     
--- maker.items
     Returns the object which administrate some
     (({item}))s.
     
--- maker.textinput
     Returns the object which makes texti(I)nput element.
     
=== maker.xml_stylsheets

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- maker.xml_stylesheets.new_xml_stylesheet
     Makes new (({xml_stylesheet})) and returns it. It is
     appended to (({xml_stylesheet})) list.

==== xml_stylesheet

(({xml_stylesheet})) is the object which is made by
(({maker.xml_stylesheet.new_xml_stylesheet})).

You need to specify (({href})) and (({type})). But you can
omit (({type})) when you specify (({href})) which value's
extension is .xsl or .css. Because RSS Maker can guess it.

--- xml_stylesheet.href
--- xml_stylesheet.href=(value)

--- xml_stylesheet.type
--- xml_stylesheet.type=(value)

--- xml_stylesheet.title
--- xml_stylesheet.title=(value)

--- xml_stylesheet.media
--- xml_stylesheet.media=(value)

--- xml_stylesheet.charset
--- xml_stylesheet.charset=(value)

--- xml_stylesheet.alternate
--- xml_stylesheet.alternate=(value)

=== maker.channel

In RSS 1.0 case, you need to specify (({about})),
(({title})), (({link})) and (({description})).

In RSS 0.91 case, you need to specify (({title})), (({link})),
(({description})) and (({language})).

In RSS 2.0 case, you need to specify (({title})), (({link}))
and (({description})).

(({RSS::NotSetError})) exception is raised when you set some
value to (({maker.channel})), but you don't set above
required values. The exception is not raised if you don't
set any value.

--- maker.channel.about
--- maker.channel.about=(value)

--- maker.channel.title
--- maker.channel.title=(value)

--- maker.channel.link
--- maker.channel.link=(value)

--- maker.channel.description
--- maker.channel.description=(value)

--- maker.channel.language
--- maker.channel.language=(value)

--- maker.channel.copyright
--- maker.channel.copyright=(value)

--- maker.channel.managingEditor
--- maker.channel.managingEditor=(value)

--- maker.channel.webMaster
--- maker.channel.webMaster=(value)

--- maker.channel.rating
--- maker.channel.rating=(value)

--- maker.channel.docs
--- maker.channel.docs=(value)

--- maker.channel.date
--- maker.channel.date=(value)

--- maker.channel.pubDate
     is an alias of (({maker.channel.date})).

--- maker.channel.pubDate=(value)
     is an alias of (({maker.channel.date=})).

--- maker.channel.lastBuildDate
--- maker.channel.lastBuildDate=(value)

--- maker.channel.generator
--- maker.channel.generator=(value)

--- maker.channel.ttl
--- maker.channel.ttl=(value)

--- maker.channel.categories
     returns (({categories})).

--- maker.channel.cloud
     returns (({cloud})).

--- maker.channel.skipDays
     returns (({skipDays})).

--- maker.channel.skipHours
     returns (({skipHours})).

==== maker.channel.categories

This is used only in RSS 2.0 case.

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- maker.channel.categories.new_category
     Makes new (({category})) and returns it. It is appended to
     (({category})) list.

+ category

(({category})) is the object which is made by
(({maker.channel.categories.new_category})).

You need to specify (({content})).

--- category.domain
--- category.domain=(value)

--- category.content
--- category.content=(value)

==== maker.channel.cloud

This is used only in RSS 2.0 case.

You need to specify all attribute.

--- maker.channel.cloud.domain
--- maker.channel.cloud.domain=(value)

--- maker.channel.cloud.port
--- maker.channel.cloud.port=(value)

--- maker.channel.cloud.path
--- maker.channel.cloud.path=(value)

--- maker.channel.cloud.registerProcedure
--- maker.channel.cloud.registerProcedure=(value)

--- maker.channel.cloud.protocol
--- maker.channel.cloud.protocol=(value)

==== maker.channel.skipDays

This is used only in RSS 0.91/2.0 case.

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- maker.channel.skipDays.new_day
     Makes new (({day})) and returns it. It is appended to
     (({day})) list.

+ day

(({day})) is the object which is made by
(({maker.channel.skipDays.new_day})).

You need to specify (({content})).

--- day.content
--- day.content=(value)

==== maker.channel.skipHours

This is used only in RSS 0.91/2.0 case.

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- maker.channel.skipHours.new_hour
     Makes new (({hour})) and returns it. It is appended to
     (({hour})) list.

+ hour

(({hour})) is the object which is made by
(({maker.channel.skipHours.new_hour})).

You need to specify (({content})).

--- hour.content
--- hour.content=(value)

=== maker.image

In RSS 1.0 case, you need to specify (({url})), (({title})), 
(({maker.channel.link})) and (({maker.channel})).

In RSS 0.91/2.0 case, you need to specify (({url})),
(({title})) and (({maker.channel.link})).

--- maker.image.title
--- maker.image.title=(value)

--- maker.image.url
--- maker.image.url=(value)

--- maker.image.width
--- maker.image.width=(value)

--- maker.image.height
--- maker.image.height=(value)

--- maker.image.description
--- maker.image.description=(value)

=== maker.items

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- maker.items.new_item
     Makes new (({item})) and returns it. It is appended to
     (({item})) list.

--- maker.items.do_sort
     Returns current (({do_sort})) value. The default value
     is (({false})).

--- maker.items.do_sort=(boolean_or_proc)
     If you specify (({true})), items are sorted by
     (({item.date})) in descending order. You can customize
     sort way by specify (({Proc})) object.

--- maker.items.max_size
     Returns current (({max_size})) value. The default value
     is (({-1})).

--- maker.items.max_size=(integer)
     Specifies max output (({item})) size.

==== item

(({item})) is the object which is made by
(({maker.items.new_item})).

In RSS 1.0/0.91 case, you need to specify (({title})) and
(({link})).

In RSS 2.0 case, you need to specify (({title})) or
(({description})).

--- item.title
--- item.title=(value)

--- item.link
--- item.link=(value)

--- item.description
--- item.description=(value)

--- item.date
--- item.date=(value)

--- item.pubDate
     is an alias of (({item.date})).

--- item.pubDate=(value)
     is an alias of (({item.date=})).

--- item.author
--- item.author=(value)

--- item.comments
--- item.comments=(value)

--- item.guid
--- item.enclosure
--- item.source
--- item.categories

+ item.guid

This is used only in RSS 2.0 case.

You need to specify (({content})).

--- item.guid.isPermaLink
--- item.guid.isPermaLink=(value)

--- item.guid.content
--- item.guid.content=(value)

+ item.enclosure

This is used only in RSS 2.0 case.

You need to specify (({url})), (({length})) and (({type})).

--- item.enclosure.url
--- item.enclosure.url=(value)

--- item.enclosure.length
--- item.enclosure.length=(value)

--- item.enclosure.type
--- item.enclosure.type=(value)

+ item.source

This is used only in RSS 2.0 case.

You need to specify (({url})) and (({content})).

--- item.source.url
--- item.source.url=(value)

--- item.source.content
--- item.source.content=(value)

+ item.categories

This is used only in RSS 2.0 case.

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- item.categories.new_category
     Makes new (({category})) and returns it. It is appended to
     (({category})) list.

     (({category})) which is made by
     (({item.categories.new_category})) has the same API as
     (({category})) which is made by
     (({maker.channel.categories.new_category})).

=== maker.textinput

In RSS 1.0 case, you need to specify (({title})),
(({description})), (({name})), (({link})) and
(({maker.channel})).

In RSS 0.91/2.0 case, you need to specify (({title})),
(({description})), (({name})) and (({link})).

--- maker.textinput.title
--- maker.textinput.title=(value)

--- maker.textinput.description
--- maker.textinput.description=(value)

--- maker.textinput.name
--- maker.textinput.name=(value)

--- maker.textinput.link
--- maker.textinput.link=(value)

== Modules

The following modules are available.

  * Content
  * Dublin Core
  * Syndication
  * TrackBack

=== Content

This adds the following methods to (({item})).

--- content_encoded
--- content_encoded=(value)

=== Dublin Core

This adds the following methods to (({maker.channel})),
(({maker.image})), (({item})) and (({maker.textinput})).

RSS Maker supports multiple Dublin Core elements from
0.1.3. This causes API change but RSS Maker still has the
API before 0.1.3. So some scripts for before 0.1.2 will
work.

--- dc_titles.new_title
     Adds new <dc:title> element then returns it.
    
     You can use (({dc_titles.new_title.value=})) and
     (({dc_titles.new_title.content=})) which is an alias of
     (({value=})) for modifying the value of this.
    
     You can use (({value})) and (({content})) which is an
     alias of (({value})) for getting the value of this.

--- dc_descriptions.new_description
     The usage of this is same as (({dc_titles.new_title})).

--- dc_creators.new_creator
     The usage of this is same as (({dc_titles.new_title})).

--- dc_subjects.new_subject
     The usage of this is same as (({dc_titles.new_title})).

--- dc_publishers.new_publisher
     The usage of this is same as (({dc_titles.new_title})).

--- dc_contributors.new_contributor
     The usage of this is same as (({dc_titles.new_title})).

--- dc_types.new_type
     The usage of this is same as (({dc_titles.new_title})).

--- dc_formats.new_format
     The usage of this is same as (({dc_titles.new_title})).

--- dc_identifiers.new_identifier
     The usage of this is same as (({dc_titles.new_title})).

--- dc_sources.new_source
     The usage of this is same as (({dc_titles.new_title})).

--- dc_languages.new_language
     The usage of this is same as (({dc_titles.new_title})).

--- dc_relations.new_relation
     The usage of this is same as (({dc_titles.new_title})).

--- dc_coverages.new_coverage
     The usage of this is same as (({dc_titles.new_title})).

--- dc_rightses.new_rightses
     The usage of this is same as (({dc_titles.new_title})).
    
     ((*FIXME*)): rightses is too strange, so I want to an
     idea of good name of rightses.

--- dc_dates.new_date
     The usage of this is same as (({dc_titles.new_title})).


For compatibility, this adds the following methods for
handling the first Dublin Core element.

--- dc_title
--- dc_title=(value)

--- dc_description
--- dc_description=(value)

--- dc_creator
--- dc_creator=(value)

--- dc_subject
--- dc_subject=(value)

--- dc_publisher
--- dc_publisher=(value)

--- dc_contributor
--- dc_contributor=(value)

--- dc_type
--- dc_type=(value)

--- dc_format
--- dc_format=(value)

--- dc_identifier
--- dc_identifier=(value)

--- dc_source
--- dc_source=(value)

--- dc_language
--- dc_language=(value)

--- dc_relation
--- dc_relation=(value)

--- dc_coverage
--- dc_coverage=(value)

--- dc_rights
--- dc_rights=(value)

--- dc_date
     is an alias of (({date})) in (({maker.channel})) and (({item})).

--- dc_date=(value)
     is an alias of (({date=})) in (({maker.channel})) and (({item})).

=== Syndication

This adds the following methods to (({maker.channel})).

--- sy_updatePeriod
--- sy_updatePeriod=(value)

--- sy_updateFrequency
--- sy_updateFrequency=(value)

--- sy_updateBase
--- sy_updateBase=(value)

=== TrackBack

This adds the following methods to (({item})).

--- trackback_ping
--- trackback_ping=(value)

--- trackback_abouts

==== trackback_abouts

This has some methods like Array: (({#<<})), (({#[]})),
(({#[]=})), (({#first})), (({#last})), (({#push})),
(({#pop})), (({#shift})), (({#unshift})), (({#each})) and so
on.

--- trackback_abouts.new_about
     Makes new (({about})) and returns it. It is appended to
     (({about})) list.

+ about

(({about})) is the object which is made by
(({trackback_abouts.new_about})).

--- value
--- value=(new_value)

--- resource
     is an alias of (({value})).
--- resource=(new_value)
     is an alias of (({value=})).

--- content
     is an alias of (({value})).
--- content=(new_value)
     is an alias of (({value=})).

=== Image

This adds the following methods to (({item})).

--- image_item

And, this adds the following methods to (({channel})).

--- image_favicon

==== image_item

You can use Dublin Core's methods, too.

--- image_item.about
--- image_item.about=

--- image_item.resource
--- image_item.resource=

--- image_item.image_width
--- image_item.image_width=

--- image_item.width
     is an alias of (({image_item.image_width})).
--- image_item.width=
     is an alias of (({image_item.image_width=})).

--- image_item.image_height
--- image_item.image_height=

--- image_item.height
     is an alias of (({image_item.image_height})).
--- image_item.height=
     is an alias of (({image_item.image_height=})).

==== image_favicon

You can use Dublin Core's methods, too.

--- image_item.about
--- image_item.about=

--- image_item.image_size
--- image_item.image_size=

--- image_item.size
     is an alias of (({image_item.image_size})).
--- image_item.size=
     is an alias of (({image_item.image_size=})).
