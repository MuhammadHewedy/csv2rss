### sample usage for curl
# replace input file with the csv input file you want

curl -v --form "file=@/home/mhewedy/Desktop/demo.csv" http://csv2rss.herokuapp.com/csv2rss > ~/Desktop/demo_rss.xml
