<cfset variables.datasource = "school">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<cfscript>
 
	function shorten(longURL) {
	
	 
		// define the user variables
		strUser 	= 'gtheilman';
		strKey		= 'R_1acd59b31db84d0fb7f86c900b3f6b60';
	
		// instantiate the object
		objBitly = createObject('component', 
			'com.coldfumonkeh.bitly.bitly')
			.init(
				username	=	strUser,
				apikey		=	strKey,
				parse		=	true
			);
			
	shortURLjson = objBitly.shorten(longURL='#longURL#',format='json',domain='j.mp');
	
	shortURL = shortURLjson.data.url;
	
	 
	return shortURL;
	}


 
	function QR(shortURL) {
	
	 
		// define the user variables
		strUser 	= 'gtheilman';
		strKey		= 'R_1acd59b31db84d0fb7f86c900b3f6b60';
	
		// instantiate the object
		objBitly = createObject('component', 
			'com.coldfumonkeh.bitly.bitly')
			.init(
				username	=	strUser,
				apikey		=	strKey,
				parse		=	true
			);
			
	qrCode = objBitly.generateQRCode(shortURL='#shortURL#');
	
	return qrCode;
	
 
	}


</cfscript>


<CFQUERY NAME="Key"   datasource="#variables.datasource#"     >
    SELECT      Variable_Value
    FROM         Variables 
    WHERE       Variable_Name = 'Encryption_Key'
</CFQUERY>

<cffunction access="public" name="decryptText" returntype="string" output="false">
      <cfargument name="encryptedtext" type="string" required="yes">
        <cfset decryptedText = trim(decrypt(#arguments.encryptedtext#, #Key.Variable_Value#, "DES", "Hex"))> 
        <cfreturn trim(#decryptedText#)>
 </cffunction>

 <cffunction access="public" name="encryptText" returntype="string" output="false">
      <cfargument name="decryptedtext" type="string" required="yes">
        <cfset encryptedText=encrypt(#arguments.decryptedtext#, #Key.Variable_Value#, "DES", "Hex")>
        <cfreturn trim('#encryptedText#')>
 </cffunction>



 
<style>
	.odd {
		background-color:#d8e7f3;
	}
	td {
		vertical-align:middle;
		font-size:14px;
	}
	th {
		vertical-align:left;
		font-size:15px;
	}
	.late { 
		background-color:#F00;
	}

	a:link{text-decoration:none;
	}

 
</style>

<script language="javascript">
	$(document).ready(function(){
		$("tr:nth-child(even)").addClass("odd");
	 });
</script>



<cfif IsDefined("Form.id")>
	<cfif form.id IS "">
		<cfset variables.id =0>
	<cfelse>
		<cfset variables.id = Form.id >
	</cfif>
<cfelseif isDefined("url.id")>
	<cfif url.id IS "">
		<cfset variables.id =0>
	<cfelse>
		<cfset variables.id = url.id >
	</cfif>
<cfelseif NOT IsDefined('variables.id')>
	<cfset variables.id =0>
<cfelse>
	<cfset variables.id =0>
</cfif>
 

<!--- Get list of all questions in database --->
 <CFQUERY NAME="Questions"   datasource="#variables.datasource#"     >
		Select *
		From
		  familyfeud
		Order By
		  id desc
</CFQUERY>
  


<!--- Create New Question --->

<cfif isDefined("form.questiontext") AND variables.id IS 0>
	<cfoutput>

		<cfset forbiddenWords = "drop,insert,delete,select,update,order">

		<cfloop list="#forbiddenWords#" index="i">
			<cfif findNoCase("#i#", "#form.questiontext#")>
				<cfoutput>
					You cannot use any of these words in a question:  #forbiddenwords#
				</cfoutput>
				<cfabort>
			</cfif>
		</cfloop>
		
		<cfloop index="j" from="1" to="8">
			<cfloop list="#forbiddenWords#" index="i">
				<cfoutput>
					<cftry>
						<cfif findNoCase("#i#", Evaluate("form.answer#j#text")) >
							<cfoutput>
								You cannot use any of these words in an answer:  #forbiddenwords#
							</cfoutput>
							<cfabort>
						</cfif>
					<cfcatch>Error<cfabort></cfcatch>
					</cftry>

				</cfoutput>
			</cfloop>
		</cfloop>
 
 
		    <cfoutput>
	          <cfif NOT IsDefined('form.answer1text')>
	          	<cfset form.answer1text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer2text')>
	          	<cfset form.answer2text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer3text')>
	          	<cfset form.answer3text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer4text')>
	          	<cfset form.answer4text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer5text')>
	          	<cfset form.answer5text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer6text')>
	          	<cfset form.answer6text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer7text')>
	          	<cfset form.answer7text = "">
	          </cfif>
	          <cfif NOT IsDefined('form.answer8text')>
	          	<cfset form.answer8text = "">
	          </cfif>

	          <cfif NOT IsDefined('form.answer1points')>
	          	<cfset form.answer1points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer2points')>
	          	<cfset form.answer2points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer3points')>
	          	<cfset form.answer3points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer4points')>
	          	<cfset form.answer4points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer5points')>
	          	<cfset form.answer5points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer6points')>
	          	<cfset form.answer6points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer7points')>
	          	<cfset form.answer7points = 0>
	          </cfif>
	          <cfif NOT IsDefined('form.answer8points')>
	          	<cfset form.answer8points = 0>
	          </cfif>  


	          <cfif form.answer1points IS "">
	          	<cfset form.answer1points = 0>
	          </cfif>
	          <cfif form.answer2points IS "">
	          	<cfset form.answer2points = 0>
	          </cfif>
	          <cfif form.answer3points IS "">
	          	<cfset form.answer3points = 0>
	          </cfif>
	          <cfif form.answer4points IS "">
	          	<cfset form.answer4points = 0>
	          </cfif>
	          <cfif form.answer5points IS "">
	          	<cfset form.answer5points = 0>
	          </cfif>
	          <cfif form.answer6points IS "">
	          	<cfset form.answer6points = 0>
	          </cfif>
	          <cfif form.answer7points IS "">
	          	<cfset form.answer7points = 0>
	          </cfif>
	          <cfif form.answer8points IS "">
	          	<cfset form.answer8points = 0>
	          </cfif>  
		    </cfoutput>
	 
  


		 <CFQUERY NAME="NewQuestion"   datasource="#variables.datasource#" result="result"     >
		    Insert INTO   familyfeud 
		    (questiontext,answer1text,answer1points,answer2text,answer2points, answer3text,answer3points,answer4text,answer4points,answer5text,answer5points,answer6text,answer6points,answer7text,answer7points, answer8text,answer8points) VALUES (
		        <cfqueryparam value = #form.questiontext# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer1text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer1points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer2text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer2points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer3text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer3points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer4text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer4points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer5text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer5points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer6text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer6points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer7text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer7points# CFSQLType = "CF_SQL_INTEGER">,
		    	<cfqueryparam value = #form.answer8text# cfsqltype="cf_sql_varchar"> , 
		    	<cfqueryparam value = #form.answer8points# CFSQLType = "CF_SQL_INTEGER">
		    )
		 </CFQUERY>

	 	<cfoutput>
			<cfset string = encrypt("#result.IDENTITYCOL#", #Key.Variable_Value#, "DES", "Hex")>
			<cfset shortURL = #shorten('https://pharmd.umc.edu/feud/index.cfm?item=#string#')# >
			<cfset qrCodeBinary = #QR(shortURL)# >
     
        </cfoutput>


		<CFQUERY NAME="updatequestion"   datasource="#variables.datasource#"     >
			UPDATE familyfeud
			SET bitly = '#shortURL#'
			Where familyfeud.id =   <cfqueryparam value = #result.IDENTITYCOL# CFSQLType = "CF_SQL_INTEGER">
		</cfquery>

		<!--- <cfimage  action="write" source="#qrCodeBinary#" destination = "qr/#result.IDENTITYCOL#.jpg" /> --->


 	   <cflocation url="#listlast(cgi.script_name,"/")#?id=#result.IDENTITYCOL#">
	  </cfoutput>
</cfif>


<!--- Update Answers --->
 
<cfif IsDefined("form.questiontext") and (variables.id  GT 0 )>

	<CFQUERY NAME="updatequestion"   datasource="#variables.datasource#"     >
		UPDATE familyfeud
		SET questiontext = '#form.questiontext#'
		Where familyfeud.id =   <cfqueryparam value = #variables.id# CFSQLType = "CF_SQL_INTEGER">
	</cfquery>


 


    <cfoutput>
      <cfif NOT IsDefined('form.answer1text')>
      	<cfset form.answer1text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer2text')>
      	<cfset form.answer2text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer3text')>
      	<cfset form.answer3text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer4text')>
      	<cfset form.answer4text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer5text')>
      	<cfset form.answer5text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer6text')>
      	<cfset form.answer6text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer7text')>
      	<cfset form.answer7text = "">
      </cfif>
      <cfif NOT IsDefined('form.answer8text')>
      	<cfset form.answer8text = "">
      </cfif>

      <cfif NOT IsDefined('form.answer1points')>
      	<cfset form.answer1points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer2points')>
      	<cfset form.answer2points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer3points')>
      	<cfset form.answer3points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer4points')>
      	<cfset form.answer4points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer5points')>
      	<cfset form.answer5points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer6points')>
      	<cfset form.answer6points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer7points')>
      	<cfset form.answer7points = 0>
      </cfif>
      <cfif NOT IsDefined('form.answer8points')>
      	<cfset form.answer8points = 0>
      </cfif>  
    </cfoutput>

 

 		<cfoutput>
		 	<CFQUERY NAME="updateanswer"   datasource="#variables.datasource#"     >
				UPDATE familyfeud
				SET answer1text = 	'#form.answer1text#'
				, answer1points = 	'#form.answer1points#'
				, answer2text = 	'#form.answer2text#'
				, answer2points = 	'#form.answer2points#'
				, answer3text = 	'#form.answer3text#'
				, answer3points = 	'#form.answer3points#'
				, answer4text = 	'#form.answer4text#'
				, answer4points = 	'#form.answer4points#'
				, answer5text = 	'#form.answer5text#'
				, answer5points = 	'#form.answer5points#'
				, answer6text = 	'#form.answer6text#'
				, answer6points = 	'#form.answer6points#'
				, answer7text = 	'#form.answer7text#'
				, answer7points =	'#form.answer7points#'
				, answer8text = 	'#form.answer8text#'
				, answer8points = 	'#form.answer8points#'
		 
				Where familyfeud.id =   <cfqueryparam value = #variables.id# CFSQLType = "CF_SQL_INTEGER">
			</cfquery>

			 <CFQUERY NAME="CurrentQuestion"   datasource="#variables.datasource#"     >
					Select *
					From
					  familyfeud
					Where familyfeud.id =   <cfqueryparam value = #variables.id# CFSQLType = "CF_SQL_INTEGER">
			</CFQUERY>


			<cfif CurrentQuestion.bitly IS "">
				 	<cfoutput>
						<cfset string = encrypt("#variables.id#", #Key.Variable_Value#, "DES", "Hex")>
						<cfset shortURL = #shorten('https://pharmd.umc.edu/feud/index.cfm?item=#string#')# >
						<cfset qrCodeBinary = #QR(shortURL)# >
			     
			        </cfoutput>


					<CFQUERY NAME="updatequestion"   datasource="#variables.datasource#"     >
						UPDATE familyfeud
						SET bitly = '#shortURL#'
						Where familyfeud.id =   <cfqueryparam value = #variables.id# CFSQLType = "CF_SQL_INTEGER">
					</cfquery>

					<!--- <cfimage  action="write" source="#qrCodeBinary#" destination = "qr/#variables.id#.jpg" /> --->

			</cfif>
   
			<cflocation url="#listlast(cgi.script_name,"/")#?id=#variables.id#">
 		</cfoutput>
 
 
</cfif>




<!--- View --->

 
Edit Question:<br>
<cfoutput>
	<FORM action="#listlast(cgi.script_name,"/")#" method="post">
		<select id="id" name="id"  onchange="this.form.submit();">
				<option value = ""></option>
			<cfloop query="Questions"  >
	 			<cfoutput>
					<option value="#id#" <cfif id IS variables.id>selected</cfif>>#questiontext#</option>
				</cfoutput>		
		 	</cfloop>
		</select>
	</FORM>
</cfoutput>


<cfquery dbtype="query" name="GetQuestionInfo">
	select *
	from Questions
	where id = #variables.id#
</cfquery>

<cfif GetQuestionInfo.RecordCount IS 0>
	<cfset GetQuestionInfo.questiontext = "">
	<cfset GetQuestionInfo.id = 0>
	<cfset GetQuestionInfo.answer1text = "">
	<cfset GetQuestionInfo.answer1points = 0>
 	<cfset GetQuestionInfo.answer2text = "">
	<cfset GetQuestionInfo.answer2points = 0>
	<cfset GetQuestionInfo.answer3text = "">
	<cfset GetQuestionInfo.answer3points = 0>
	<cfset GetQuestionInfo.answer4text = "">
	<cfset GetQuestionInfo.answer4points = 0>
	<cfset GetQuestionInfo.answer5text = "">
	<cfset GetQuestionInfo.answer5points = 0>
	<cfset GetQuestionInfo.answer6text = "">
	<cfset GetQuestionInfo.answer6points = 0>
	<cfset GetQuestionInfo.answer7text = "">
	<cfset GetQuestionInfo.answer7points = 0>
	<cfset GetQuestionInfo.answer8text = "">
	<cfset GetQuestionInfo.answer8points = 0>
</cfif>

 

<cfoutput >
	<FORM action="#listlast(cgi.script_name,"/")#" method="post">
		<table>
			<tr>
				<td>Question</td>
				<td><input type="text" name="questiontext" value="#GetQuestionInfo.questiontext#" size = "75"></td>
				<td></td>
			</tr>
		</table>

		<table>

			<cfloop index="j" from="1" to="8"> 
			    <tr>
		          	<td>Answer #j#</td>
		          	<td><input type="text" name="answer#j#text" value="#Evaluate('GetQuestionInfo.answer#j#text')#" size = "16"></td>
		          	<td><input type="text" name="answer#j#points" value="#Evaluate('GetQuestionInfo.answer#j#points')#" size = "4"></td>
			    </tr>
		    </cfloop>

		    <cfif IsDefined('GetQuestionInfo.bitly')>
		    	<tr>
		    		<td>Bitly</td>
		    		<!--- <td><a href="#GetQuestionInfo.bitly#" onclick="window.open(this.href,'feudwindow','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1350,height=900');return false;"  />#GetQuestionInfo.bitly#</a></td> --->
		    		<td><a href="#GetQuestionInfo.bitly#"   />#GetQuestionInfo.bitly#</a></td>

		    		<td></td>
		    	</tr>
		    </cfif>


		</table>
		<cfoutput>
			<input type="hidden" name="id" value="#variables.id#">
		</cfoutput>

		<input type="Submit">

	</form>
</cfoutput>

 