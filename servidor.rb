#!/usr/bin/env ruby
require 'socket' # Provides TCPServer and TCPSocket classes

# Initialize a TCPServer object that will listen
# on localhost:2345 for incoming connections.
server = TCPServer.new('0.0.0.0', 80)

response = %{(HTTP/1.1 200 OK
Server: gSOAP/2.7
Content-Type: text/xml; charset=utf-8; action="”
Content-Length: lengthInBytes
Connection: keep-alive

<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/”
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance”
xmlns:xsd="http://www.w3.org/2001/XMLSchema”
    <SOAP-ENV:Header></SOAP-ENV:Header>
    <SOAP-ENV:Body>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
}

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = server.accept

  # Read the first line of the request (the Request-Line)
  request = socket.gets

  # Log the request to the console for debugging
  STDERR.puts request

  while line = socket.gets
    puts line
  end

  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
  #socket.print "HTTP/1.1 200 OK\r\n" +
  #             "Content-Type: text/plain\r\n" +
  #             "Content-Length: #{response.bytesize}\r\n" +
  #             "Connection: close\r\n"

  socket.print response.gsub("\n","\r\n")

  # Print a blank line to separate the header from the response body,
  # as required by the protocol.
  socket.print "\r\n"

  # Print the actual response body, which is just "Hello World!\n"
  socket.print response

  # Close the socket, terminating the connection
  socket.close
end
