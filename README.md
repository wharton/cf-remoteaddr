RemoteAddr Custom Tag
=====================

This custom tag can be used to get a client's remote address. The tag first looks to the X-Forwarded-For HTTP request header, falling back to CGI.REMOTE_ADDR if the header is not present. 

Usage:
------

The tag can be called without any attributes, which will result in the remote_addr variable being added to the request scope.

    <cf_remoteaddr/>
    <cfdump var="#request.remote_addr#"/> 

The tag can also be called with the variable attribute, which will set a variable with the remote address.

    <cf_remoteaddr variable="myVar"/>
    <cfdump var="#myVar#"/>


Notes:
------

The tag was developed to address issues moving a ColdFusion site hosted on IIS behind a hardware load balancer. With this move the value originally available in CGI.REMOTE_ADDR was placed in the X-Forwarded-For header. To get this value, this tag uses the last value in the X-Forwarded-For header if multiple values are present as this is the value that was previously available in CGI.REMOTE_ADDR. This may not be the original client IP.



