<cfscript>
	ThirdActivity = new Simple.Activities.ThirdActivity( javacast('null',''), new Simple.Activities.SecondActivity() );
	secondActivity = new Simple.Activities.SecondActivity( ThirdActivity, new Simple.Activities.FirstActivity() );
	firstActivity = new Simple.Activities.FirstActivity(secondActivity);
	firstActivity.execute();		
	
</cfscript>
