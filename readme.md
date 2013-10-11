#CSV2RSS#

Is a tool used to convert `CSV` files into RSS feeds (can used with `Google Merchant` feeds too)

###Components###
* Command line tool: (but require ruby installation)  
usage: `ruby cli.rb <input_csv_file> <output_xml_file_name>`
* Webpage:  
can be reached at: [http://csv2rss.herokuapp.com](http://csv2rss.herokuapp.com "csv2rss")
* A service: (requires to install [curl](http://curl.haxx.se/), if it is not already installed)  

###Usage###
I'll illustrate how to call the service from the command line using curl- hence it doesn't require any additional sw to use - but `curl`.  

1. The input `csv` file should have headers -that will be used to name the tags.  
here's a sample input file ("demo.csv")  
         
        g:id,title,g:availability,description,link,g:price,g:product_type    
        1234, Product A, in stock, product A, http://example.com/p_a, 100 USD, Microcontroller    
        567, Product B, in stock, product B, http://example.com/p_b, 100 USD, Microcontroller    
        890, Product C, out of stock, , http://example.com/p_c, , Microcontroller
* Now, lets call the service using `curl` as follows:  
`curl -v --form "file=@demo.csv" http://csv2rss.herokuapp.com/csv2rss > demo_rss.xml`
* The Result should be saved in `demo_rss.xml` as stated in previous step, and here's the output from the service:   

        <?xml version="1.0"?>  
        <rss version="2.0" xmlns:g="http://base.google.com/ns/1.0"> 
        <channel>  
        <title>Arrow feed</title>  
        <link>http://parts.arrow.com</link>  
        <description>Arrow feed</description>  
	        <item>  
	        <g:id>1234</g:id>  
	        <title>Product A</title>  
	        <g:availability>in stock</g:availability>  
	        <description>product A</description>  
	        <link>http://example.com/p_a</link>  
	        <g:price>100 USD</g:price>  
	        <g:product_type>Microcontroller</g:product_type>  
	        </item>  
	        <item>  
	        <g:id>567</g:id>
	        <title>Product B</title>
	        <g:availability>in stock</g:availability>
	        <description>product B</description>
	        <link>http://example.com/p_b</link>
	        <g:price>100 USD</g:price>
	        <g:product_type>Microcontroller</g:product_type>
	        </item>
	        <item>
	        <g:id>890</g:id>
	        <title>Product C</title>
	        <g:availability>out of stock</g:availability>
	        <description />
	        <link>http://example.com/p_c</link>
	        <g:price />
	        <g:product_type>Microcontroller</g:product_type>
	        </item>
        </channel>
        </rss>

###Contacts###
Feel free to cantact me at `mohammed_a_hewedy@hotmail.com` if you have any problems.

Thanks.
