import processing.net.*;

String mykey="????????-????-????-????-????????????";
String site="partner.metoffice.gov.uk";
//String site="176.34.126.108";

Client c;
String data;

void setup() {
  size(200, 200);
  background(50);
  fill(200);
  c = new Client(this, site, 80); // Connect to server on port 80
  
  c.write("GET /public/val/wxfcs/all/xml/3839?res=daily&key=");
  c.write(mykey);
  c.write(" HTTP/1.0\r\n"); // Use the HTTP "GET" command to ask for a Web page
  c.write("\r\n"); //it must end in a blank line
}

void draw() {
  if (c.available() > 0) { // If there's incoming data from the client...
    data = c.readString(); // ...then grab it and print it
    println(data);
  }
}


