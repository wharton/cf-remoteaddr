<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="beforeTests">
		<!--- the path to the test harness on your server --->
		<cfset variables.testHarnessUrl = "http://scorpio-dev.wharton.upenn.edu/users/nmische/remoteaddr/tests/mxunit/testharness.cfm" />
		<!--- your server's ip address --->
		<cfset varialbes.serverIp = "172.16.1.156" />
	</cffunction>	

	<cffunction name="testNoHeaderRequestScope">
		<cfset var result = "" />		
		<cfhttp url="#variables.testHarnessUrl#" result="result" />
		<cfset debug(result) />
		<cfset assertEquals("#varialbes.serverIp# (Request Scope)",trim(result.filecontent))/>
	</cffunction> 

	<cffunction name="testHeaderOneItemRequestScope">
		<cfset var result = "" />		
		<cfhttp url="#variables.testHarnessUrl#" result="result">
			<cfhttpparam type="header" name="X-Forwarded-For" value="1.1.1.1" />
		</cfhttp>
		<cfset debug(result) />
		<cfset assertEquals("1.1.1.1 (Request Scope)",trim(result.filecontent))/>
	</cffunction> 

	<cffunction name="testHeaderTwoItemsRequestScope">
		<cfset var result = "" />		
		<cfhttp url="#variables.testHarnessUrl#" result="result">
			<cfhttpparam type="header" name="X-Forwarded-For" value="1.1.1.1, 2.2.2.2" />
		</cfhttp>
		<cfset debug(result) />
		<cfset assertEquals("1.1.1.1 (Request Scope)",trim(result.filecontent))/>
	</cffunction>

	<cffunction name="testNoHeaderVariablesScope">
		<cfset var result = "" />		
		<cfhttp url="#variables.testHarnessUrl#" result="result">
			<cfhttpparam type="url" name="variable" value="test" />
		</cfhttp>
		<cfset debug(result) />
		<cfset assertEquals("#varialbes.serverIp# (Variables Scope)",trim(result.filecontent))/>
	</cffunction> 

	<cffunction name="testHeaderOneItemVariablesScope">
		<cfset var result = "" />		
		<cfhttp url="#variables.testHarnessUrl#" result="result">
			<cfhttpparam type="url" name="variable" value="test" />
			<cfhttpparam type="header" name="X-Forwarded-For" value="1.1.1.1" />
		</cfhttp>
		<cfset debug(result) />
		<cfset assertEquals("1.1.1.1 (Variables Scope)",trim(result.filecontent))/>
	</cffunction> 

	<cffunction name="testHeaderTwoItemsVariablesScope">
		<cfset var result = "" />		
		<cfhttp url="#variables.testHarnessUrl#" result="result">
			<cfhttpparam type="url" name="variable" value="test" />
			<cfhttpparam type="header" name="X-Forwarded-For" value="1.1.1.1, 2.2.2.2" />
		</cfhttp>
		<cfset debug(result) />
		<cfset assertEquals("1.1.1.1 (Variables Scope)",trim(result.filecontent))/>
	</cffunction>
	
</cfcomponent>