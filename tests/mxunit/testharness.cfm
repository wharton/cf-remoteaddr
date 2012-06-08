<cfsetting showdebugoutput="false" />
<cfimport prefix="ct" taglib="../../" />
<cfif isDefined("url.variable")>
	<cfoutput><ct:remoteaddr variable="#url.variable#">#variables[url.variable]#</cfoutput> (Variables Scope)
<cfelse>
	<cfoutput><ct:remoteaddr>#request.remote_addr#</cfoutput> (Request Scope)
</cfif>
