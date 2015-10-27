<cfscript>
	//Last Activity execute
	ThirdActivity = new Simple.Activities.ThirdActivity();
	//Second Activity to execute
	//inject third activity into second
	secondActivity = new Simple.Activities.SecondActivity(ThirdActivity);
	//First Activity to execute
	//inject second activity to first
	firstActivity = new Simple.Activities.FirstActivity(secondActivity);
	
	//To inject collection of data use activityCollection property
	ActivityCollection = {};
	ActivityCollection.firstName = "Shirak";
	ActivityCollection.lastName = "Avakian";
	firstActivity.setActivityCollection( ActivityCollection );
	
	//Start the process
	firstActivity.execute();	
</cfscript>
