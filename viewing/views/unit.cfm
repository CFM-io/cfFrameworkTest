<h2>Welcome to cfFramework !</h2>

<cfset keys = structKeyArray(results) />

<table>
<cfoutput>
<cfloop array="#keys#" index="key">
	<tr>
		<th colspan="3">#key#</th>
	</tr>
	<tr>
		<td class="title">Name</td>
		<td class="title">Status</td>
		<td class="title">Error Msg</td>
	</tr>
	<cfloop array="#results[key]#" index="element">
	<tr>
		<td>
		<cfif element.success eq true>
			<b style="color: ##009933;">Success</b>
		<cfelse>
			<b style="color: ##c50000;">Error</b>
		</cfif>
		</td>
		<td>#element.name#</td>
		<td>#element.message#</td>
	</tr>
	</cfloop>
</cfloop>
</cfoutput>
</table>

<style>
	table {
		width: auto;
		border: 1px solid #888;
		border-collapse: collapse;
	}

	th, td {
		border: 1px solid #888;
		padding: 3px;
	}

	th {
		text-align: left;
		color: #3366cc;
	}

	td.title {
		font-weight: bold;
		text-align: center;
	}

</style>