require_relative 'feed_generator'

def usage
    puts "ruby #{$0} <csv file> <output file>"
end

def main
    if $*.length < 2
        usage; exit -1
    end
    in_file = $*[0]
    out_file = $*[1]

    file = File.open(out_file, "w")
    write_pre file
    write_items_xml_from_file file, in_file
    write_post file
    file.close
end

main
