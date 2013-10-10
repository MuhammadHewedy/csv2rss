require 'sinatra'
require_relative 'feed_generator'

get '/' do
    '<form action="/csv2rss" method="post" enctype="multipart/form-data">
        <input type="file" name="file" />
        <input type="submit" />
    </form>
    '
end

post '/csv2rss' do
    unless params[:file] &&
         (tmpfile = params[:file][:tempfile]) &&
         (name = params[:file][:filename])
        @error = "No file selected"
        return :upload #haml(:upload)
    end
    STDOUT.puts "Uploading file, original name #{name.inspect}"

    csv_data = ""
    while csv_chunk = tmpfile.read(65536)
        csv_data += csv_chunk
    end

    content_type 'application/octet-stream'
    attachment "#{name}_#{Time.new}.xml"
    body(convert_csv_to_rss csv_data)
end

get '/csv2rss' do
    redirect '/'
end

def convert_csv_to_rss in_string
    tmp_file_name = ".tmp.dat"

    file = File.open(tmp_file_name, "w")
    write_pre file
    write_items_xml_from_string file, in_string
    write_post file
    file.close

    file = File.open(tmp_file_name, "r")
    rss_data = file.read
    file.close

    File.delete tmp_file_name

    return rss_data
end

