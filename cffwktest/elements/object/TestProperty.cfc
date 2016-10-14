<!---

Copyright (c) 2016, Jerome Lepage (j@cfm.io)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

--->
<cfcomponent extends='cffwktest.elements.object.AbstractObject' accessors='true' output='true' persistent='false'>

	<cffunction access="public" name="run" output="true">
		<cfargument type="any" name="args" required="true" />

		<cfset var getM = 'get' & arguments.args.propertyName />
		<cfset var setM = 'set' & arguments.args.propertyName />

		<cfset var retVal = '' />
		<cfset var argName = _getFirstArgumentName(getMetadata(arguments.args.object), setM) />

		<cftry>

			<cfinvoke component="#arguments.args.object#" method="#getM#" returnvariable="retVal" />

			<cfset var methodArgs = structNew() />
			<cfset methodArgs[argName] = retVal />

			<cfinvoke component="#arguments.args.object#" method="#setM#" argumentcollection="#methodArgs#" />

			<cfcatch type="any">
				<cfset fail('Property getter/setter of ' & arguments.args.objectName & ' problem! <br/>' & cfcatch.detail) />
			</cfcatch>

		</cftry>

		<cfreturn arguments.args />

	</cffunction>


</cfcomponent>