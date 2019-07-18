#!/usr/bin/env bash
cat << EOF
HTTP/1.1 200 OK
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
EOF
