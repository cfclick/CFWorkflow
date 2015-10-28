component output="false"  
{
	import IActivity;		
	
	private string function getLogFileName(){
		return "CFWF";
	}
	
	private string function getExceptionLogFileName(){
		return "CFWFExceptions";
	}
	
	private boolean function isApplication(){
		return true;
	}
	
	private numeric function getSleepTime(){
		return 3000;
	}
	
	public function init( IActivity successor)
	{
		try
        {
        	variables.log = {};
			variables.meta = getMetaData(successor);
			writelog( text="----------------------------#meta.name#--------------------------------", application=isApplication(), file=getLogFileName() );
			writelog( text="#meta.name# Activity initialization started", application=isApplication(), file=getLogFileName() );
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=isApplication(), file=getExceptionLogFileName() );
        }

	}
	
	public void function onActivityStart( )
	{
		try
        {
        	writelog( text="#meta.name# Activity started", application=isApplication(), file=getLogFileName() );
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=isApplication(), file=getExceptionLogFileName() );
        }

	}
	
	public boolean function execute(IActivity activity)
	{
		try
        {        	
        	var act = arguments.activity;		
			writelog(text="#meta.name# Activity executed", application=isApplication(), file=getLogFileName );	
			 sleep( getSleepTime() );
			act.onActivityStart();	
			 sleep( getSleepTime() );		
			act.predecessor();	
			 sleep( getSleepTime() );
			act.process();
			 sleep( getSleepTime() );				
			act.successor();
			 sleep( getSleepTime() );
			act.onActivityEnd();
			
			return true;
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=isApplication(), file=getExceptionLogFileName() );
        }

	}
	
	public void function predecessor()
	{
		try
        {
        	writelog( text="#meta.name# Activity predecessor started", application=isApplication(), file=getLogFileName() );
		
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=isApplication(), file=getExceptionLogFileName() );
        }
	}
		
	public void function process()
	{
		try
        {
        	writelog( text="#meta.name# Activity process started", application=isApplication(), file=getLogFileName() );
		
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=isApplication(), file=getExceptionLogFileName() );
        }
	}
		
	public void function successor()
	{
		try
        {
        	writelog( text="#meta.name# Activity successor started", application=isApplication(), file=getLogFileName() );
		
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=isApplication(), file=getExceptionLogFileName() );
        }
	}
	
	public void function onActivityEnd()
	{
		try
         {
         	writelog( text="#meta.name# Activity ended", application=isApplication(), file=getLogFileName() );
			writelog( text="----------------------------#meta.name#--------------------------------", application=isApplication(), file=getLogFileName() );
		
         }
         catch(Any e)
         {
         	writelog(text=e.message, application=isApplication(), file=getExceptionLogFileName() );
         }
	}
}