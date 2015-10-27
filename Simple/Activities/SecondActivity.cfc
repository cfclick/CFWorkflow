component  implements="IActivity" extends="BaseActivity" output="false" accessors="true"
{
	property type="struct" name="ActivityCollection";
	 
	public void function init(IActivity successor, IActivity Predecessor)
	{
		super.init(this);		
		if( !isNull( arguments.successor ) && isInstanceOf( arguments.successor, "IActivity" ) )
			variables.successorActivity = arguments.successor;
		
		if( !isNull( arguments.Predecessor ) && isInstanceOf( arguments.Predecessor, "IActivity" ) )
			variables.predecessorActivity = arguments.Predecessor;
	}
	
	public void function onActivityStart()
	{
		sleep(3000);
		super.onActivityStart(this.getActivityCollection());
	}
	
	public void function predecessor()
	{
		sleep(3000);
		super.predecessor();
		if( !isNull(predecessorActivity)  && isInstanceOf( predecessorActivity, "IActivity" ) )	
			predecessorActivity.process();			
	}
	
	public boolean function execute()
	{
		sleep(3000);
		return super.execute(this);
	}
	
	public void function process()
	{
		try
        {
        	sleep(3000);
			var data = this.getActivityCollection();
			if( isNull(data) || !structKeyExists( data,"firstName" ) )
				writelog( text="I'm SecondActivity process running", file=super.getLogFileName() );
			else
				writelog( text="I'm SecondActivity process running for user : #data.firstName#", file=super.getLogFileName() );
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=super.getExceptionLogFileName() );
        	continue;
        }

	}
	
	public void function successor()
	{
		sleep(3000);
		super.successor();
		
		try
        {      	
			if( !isNull(successorActivity)  && isInstanceOf( successorActivity, "IActivity" ) )
			{
				successorActivity.setActivityCollection( this.getActivityCollection() );
				successorActivity.execute();
			}
				
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=super.getExceptionLogFileName() );
        	continue;
        }

	}
	
	public void function onActivityEnd()
	{
		sleep(3000);
		super.onActivityEnd();
	}

}