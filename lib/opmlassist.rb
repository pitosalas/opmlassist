=begin
  * Name: opmlassist.rb
  * Description: Generate OPML files (will soon be its own Gem)
  * Author: Pito Salas
  * Copyright: (c) R. Pito Salas and Associates, Inc.
  * Date: January 2009
  * License: GPL

  This file is part of GovSDK.

  OpmlA is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  GovSDK is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with GovSDK.  If not, see <http://www.gnu.org/licenses/>.
  
  require "ruby-debug"
  Debugger.settings[:autolist] = 1 # list nearby lines on stop
  Debugger.settings[:autoeval] = 1
  Debugger.start
  
=end
require 'rubygems'
require 'rexml/document'
require 'pp'

include REXML

module OpmlAssist

  class Opml
    attr_accessor :title, :date_modified, :feeds
    
    def initialize(opml_name, group_name, options = {})
      @feeds = []
      @opml_name = opml_name
      @group_name = group_name
      @options = options
    end
    
    def xml
      doc = Document.new
      doc << XMLDecl.new
      root = doc.add_element "opml"
      if (!@options[:namespace].nil?)
        namespace_options = @options[:namespace]
        root.add_namespace(namespace_options[:namespace], namespace_options[:value])
      end
      head = root.add_element "head"
      head.add_element("title").add_text(@opml_name)
      
      body = root.add_element "body"
      outlinegroup = body.add_element("outline")
      outlinegroup.add_attribute('text', @group_name)
      @feeds.each {|otl| outlinegroup.add_element(otl.xml)}
      doc
    end
  end
  
  class Feed
    attr_accessor :text, :type, :xmlUrl
    
    def initialize(text, type, xmlurl)
      @text = text
      @type = type
      @xmlUrl = xmlurl
    end
    
    def xml
      outline_element = Element.new "outline"
      outline_element.add_attributes( {"text" => @text, "type" => @type, "xmlUrl" => @xmlUrl })
      outline_element
    end
    
  end
end
