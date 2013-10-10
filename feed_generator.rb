require 'csv'

def write_items_xml_from_file file, in_file
    CSV.foreach(in_file) do |row|
        file.puts (build_item_xml row)
    end
end

def write_items_xml_from_string file, in_string
    CSV.parse(in_string) do |row|
        file.puts (build_item_xml row)
    end
end

def build_item_xml row
    "\t<item>
    <g:id>#{row[0]}</g:id>
    <title>#{xml_encode(row[1])}</title>
    <description>#{xml_encode(row[1])} by #{xml_encode(row[5])}</description>
    <g:product_type>#{xml_encode(row[11])}</g:product_type>
    <link>#{xml_encode(row[8])}</link>
    <g:image_link></g:image_link>
    <g:condition>new</g:condition>
    <g:availability>#{if row[4] and row[4].upcase == 'Y'; 'in stock' else 'out of stock' end}</g:availability>
    <g:price>#{xml_encode(row[9])} USD</g:price>
    </item>\n"
end

def xml_encode str
    if str
        str.encode(:xml => :text)
    end
end

def write_pre file
    file.puts '<?xml version="1.0"?>
    <rss version="2.0" xmlns:g="http://base.google.com/ns/1.0">
    <channel>
    <title>Arrow feed</title>
    <link>http://parts.arrow.com</link>
    <description>Arrow feed</description>'
end

def write_post file
    file.puts "</channel>\n</rss>"
end


