require 'csv'

def write_items_xml_from_file file, in_file
    CSV.foreach(in_file, {:headers => true}) do |row|
        file.puts (build_item_xml row)
    end
end

def write_items_xml_from_string file, in_string
    CSV.parse(in_string, {:headers => true}) do |row|
        file.puts (build_item_xml row)
    end
end

def build_item_xml row
    item = "\t<item>"
    row.each do |e|
        tag_name = e[0].strip.encode(:xml => :text) if e[0]
        value = e[1].strip.encode(:xml => :text) if e[1]

        unless !tag_name or tag_name.empty?
            if value and value.empty?
                item += "\n\t<#{tag_name} />"
            else
                item += "\n\t<#{tag_name}>#{value}</#{tag_name}>"
            end
        end
    end
    item += "\n\t</item>\n"
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


