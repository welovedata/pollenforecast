import processing.net.*;

///////////////////////////
// Ref: Request Option 1
// 
// GET
// https://socialpollencount.co.uk/api/forecast?location=[52.981621,-122.493202]
//
// Response
// {"status_code":"200 OK","date":"2012-05-07T03:32:11+00:00","forecast":[{"date":"2012-05-04T09:55:01+00:00","pollen_count":"Low"},{"date":"2012-05-05T09:55:01+00:00","pollen_count":"Low"},{"date":"2012-05-06T09:55:01+00:00","pollen_count":"Low"}]}
//
///////////////////////////


////////////////////////////
// Ref: Request Option 2
//
// GET
// http://www.metoffice.gov.uk/public/data/PWSCache/PollenForecast/Latest
// Host: www.metoffice.gov.uk
// Referer: http://www.metoffice.gov.uk/public/weather/forecast/?tab=map&map=Pollen
//
// Partial Response
/*
<document master="False">
<issue at="2012-05-14T05:23:22" day="Monday"></issue>
<report>
<region id="SW" name="SW England">
<day number="1" level="Low">
<para> The risk from tree pollen will be mainly low due to cold and unsettled weather. However, some parts may occasionally </para>
<para> receive prolonged dry and warm sunny spells which will allow for a moderate risk. </para>
</day>
<day number="2" level="Low">
<para> </para>
</day>
<day number="3" level="Low">
<para> </para>
</day>
<day number="4" level="Low">
<para> </para>
</day>
<day number="5" level="Low">
<para> </para>
</day>
</region>
</report>
</document>
*/
//
///////////////////////////


String site="socialpollencount.co.uk";

//https://socialpollencount.co.uk/api/stores/?location=[50.718412,-3.5338990000000194]&distance=70
String Loc="[50.718412,-3.5338990000000194]";

/*
//Search string
String ss="pollen_count";
*/

Client c;
String data;

void setup() {
  size(200, 200);
  background(50);
  fill(200);
  c = new Client(this, site, 80); // Connect to server on port 80
  
//  c.write("GET https://socialpollencount.co.uk/api/forecast?location=[52.981621,-122.493202]");
  c.write("GET /api/forecast?location=");
  c.write(Loc);
  c.write(" HTTP/1.1\r\n");
//  c.write("Accept: application/json\r\n");
  c.write("Host: socialpollencount.co.uk\r\n");
//  c.write("Referer: https://socialpollencount.co.uk/?iframe=1&lat=52.981621&long=-122.493202\r\n");
  c.write("\r\n"); //it must end in a blank line
}


/*
boolean FoundString=false;
*/

void draw() {
//  println("Searching...\r\n");
  if (c.available() > 0) { // If there's incoming data from the client...
    data = c.readString(); // ...then grab it and print it
    println(data);  //remove after testing
/*    
    //find the value
    String[] m = match(data,ss);
    if (m != null) {
      println(m);
      FoundString=true;
    } else {
      if (FoundString) {
        println("it was found");
      } else {
      println("still looking");
      }
    }
*/
  }
}


