require 'mechanize'
require 'nokogiri'
require 'httparty'
require './app'

mechanize = Mechanize.new

page = mechanize.get('http://www.tangomango.org/index.php?show=San_Francisco,CA+Alameda,CA+San_Mateo,CA+Santa_Clara,CA+Marin,CA+Contra_Costa,CA+Sacramento,CA+Santa_Cruz,CA+Monterey,CA+Sonoma,CA+Mendocino,CA+Stanislaus,CA')

doc = Nokogiri::HTML(page.body)
eventsArray=[];

# create lookup table that contains only date and eventId

doc.css('table div').each {|a|
    # make a database call if the
    # it exists in the Database
    # do not insert. if not
    #  insert into DB
    #
    #  ALSO deal with nill values
    eventDate1=a[:onclick].to_s.split(",")[1]
    unless eventDate1.nil?
      eventDateReal=eventDate1.tr("''","")
      eventId1=a[:onclick].to_s.split(",")[2]
      p eventId1
      eventPossible=Event.find_by eventId: eventId1
      p eventPossible
      if(eventPossible.nil?)
        urlT="http://www.tangomango.org/lib/loadevent.php?date=#{eventDateReal}&eventid=#{eventId1}"
        p urlT
        body=HTTParty.get(urlT)
        p body.parsed_response
        # Real Table Columns eventTitle,eventDate,googleMapsUrl,eventBlob,eventPrice
        doc1=Nokogiri::HTML(body.parsed_response)
        eventtitle=doc1.css("#info .styled").text
        eventprice=doc1.css("#details").text.split("\n")[2]
        eventgooglemapsurl=doc1.css("#details .noprint a").map { |link| link['href'] }
        Bar.create(eventId: eventId1,eventDate: eventDate1.tr("''",""),eventTitle: eventtitle,eventPrice: eventprice,eventGoogleMapsUrl: eventgooglemapsurl,eventBlob: body.parsed_response)
        Sport.create(eventBlob: body.parsed_response)
        Event.create(eventDate: eventDate1.tr("''",""),eventId: eventId1)
      end
    end
    # eventsArray.push([eventId,eventDate])
}

# Geocoding happens here
# Bar.all.each_with_index { |evnt,index|   a=Geokit::Geocoders::GoogleGeocoder.geocode evnt.eventGoogleMapsUrl.split("=")[1] ; sleep 10 ; lat= a.ll.split(",")[0].to_f; longt= a.ll.split(",")[1].to_f; bar = Bar.find_by(id: index+1); bar.update(latitude:lat,longitude: longt) }

# create table events
# columns  : date etc...

# make http request every 5 seonds
# eventsArray1=[["12726","2015-11-28"]]
# eventsArray1.each { |event|
# }

