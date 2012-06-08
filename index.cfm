<html>
	<head>	
		<title>Remote Address Custom Tag Test</title>
	<head>
	<body>
		<cf_remoteaddr/>
		<h1>Remote Address Custom Tag Test</h1>
		<p>Your IP address is: <strong><cfoutput>#request.remote_addr#</cfoutput></strong>.</p>
	</body>
</html>