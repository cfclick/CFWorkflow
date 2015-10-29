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
		
		super.onActivityStart(this.getActivityCollection());
	}
	
	public void function predecessor()
	{
		
		super.predecessor();
		if( !isNull(predecessorActivity)  && isInstanceOf( predecessorActivity, "IActivity" ) )	
			predecessorActivity.process();			
	}
	
	public boolean function execute()
	{
		
		return super.execute(this);
	}
	
	public void function process()
	{
		try
        {
        	
			var data = this.getActivityCollection();
			if( isNull(data) || !structKeyExists(data,"firstName"))
				writelog( text="I'm firstActivity process running", file=super.getLogFileName() );
			else
				writelog( text="I'm firstActivity process running for user : #data.firstName#", file=super.getLogFileName() );
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=super.isApplication(), file=super.getExceptionLogFileName() );
        	continue;
        }

	}
	
	public void function successor()
	{
		
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
        	writelog( text=e.message, application=super.isApplication(), file=super.getExceptionLogFileName() );
        	continue;
        }

	}
	
	public void function onActivityEnd()
	{
		
		super.onActivityEnd();
		abort;
	}

}