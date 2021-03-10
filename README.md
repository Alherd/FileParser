# FileParser

Test project for parsing files

## Task description

Write a ruby script in bin folder that:

a. Receives a file as argument (webserver.log is provided)
  
     e.g.: ruby parser.rb resources/webserver.log

b. Returns the following:

list of webpages with most page views ordered from most pages views to less page views
     
     e.g.:
         /home 90 visits
         /index 80 visits etc...
list of webpages with most unique page views also ordered
     
     e.g.:
         /about/2   8 unique views
         /index     5 unique views etc...

## Working example

     ruby ./parser.rb resources/webserver.log 

     List of webpages with most page views ordered from most pages views to less page views
     /about/2 90 visits 
     /contact 89 visits 
     /index 82 visits 
     /about 81 visits 
     /help_page/1 80 visits 
     /home 78 visits 

     List of webpages with most unique page views
     /help_page/1 23  unique views
     /contact 23  unique views
     /home 23  unique views
     /index 23  unique views
     /about/2 22  unique views
     /about 21  unique views

## How to install section

To install section you need to write at console
     `bundle install`

## How to run app

To run app you should write at console
     `ruby parser.rb resources/webserver.log`

## How to run specs

All specs are located in spec folder. To run specs you should write at console
     `rspec spec`

## Approach description

App receives params from console and uses the first as path to file with data, which consists from urls and ips. Parser file calls manager, which manages all processes inside app.

## Possible Improvements (ideas)
1. To create logic for another params except url and ip
2. Add possibility to output into another file, not only console
3. Cretae bin directory for cli
4. Improve integration test, adding test by console input
5. Create examples of parsing .txt files and another etc...
