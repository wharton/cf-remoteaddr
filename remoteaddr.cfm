<cfsetting enablecfoutputonly="true" />
<cfif not thisTag.hasEndTag or thisTag.executionMode eq "end">
	<cfif Compare(CGI.HTTP_X_FORWARDED_FOR,"") neq 0>
		<cfset remote_ip = Trim(ListLast(CGI.HTTP_X_FORWARDED_FOR)) />
	<cfelse>
		<cfset remote_ip = CGI.REMOTE_ADDR />
	</cfif>
	<cfif StructKeyExists(attributes,"variable")>
		<cfset "caller.#attributes.variable#" = remote_ip /> 
	<cfelse>
		<cfset request.remote_addr = remote_ip />
	</cfif>
</cfif>
<cfsetting enablecfoutputonly="false" />