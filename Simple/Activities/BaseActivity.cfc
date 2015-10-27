component output="false"  
{
	import IActivity;		
	
	package string function getLogFileName(){
		return "CFWF";
	}
	
	private string function getExceptionLogFileName(){
		return "CFWFExceptions";
	}
	
	public function init( IActivity successor)
	{
		try
        {
        	variables.log = {};
			variables.meta = getMetaData(successor);
			writelog( text="----------------------------#meta.name#--------------------------------", application=false, file=getLogFileName() );
			writelog( text="#meta.name# Activity initialization started", application=false, file=getLogFileName() );
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=getExceptionLogFileName() );
        }

	}
	
	public void function onActivityStart( )
	{
		try
        {
        	writelog( text="#meta.name# Activity started", application=false, file=getLogFileName() );
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=getExceptionLogFileName() );
        }

	}
	
	public boolean function execute(IActivity activity)
	{
		try
        {        	
        	var act = arguments.activity;		
			writelog(text="#meta.name# Activity executed", application=false, file=getLogFileName );	
			act.onActivityStart();			
			act.predecessor();	
			act.process();				
			act.successor();
			act.onActivityEnd();
			
			return true;
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=getExceptionLogFileName() );
        }

	}
	
	public void function predecessor()
	{
		try
        {
        	writelog( text="#meta.name# Activity predecessor started", application=false, file=getLogFileName() );
		
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=getExceptionLogFileName() );
        }
	}
		
	public void function process()
	{
		try
        {
        	writelog( text="#meta.name# Activity process started", application=false, file=getLogFileName() );
		
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=getExceptionLogFileName() );
        }
	}
		
	public void function successor()
	{
		try
        {
        	writelog( text="#meta.name# Activity successor started", application=false, file=getLogFileName() );
		
        }
        catch(Any e)
        {
        	writelog( text=e.message, application=false, file=getExceptionLogFileName() );
        }
	}
	
	public void function onActivityEnd()
	{
		try
         {
         	writelog( text="#meta.name# Activity ended", application=false, file=getLogFileName() );
			writelog( text="----------------------------#meta.name#--------------------------------", application=false, file=getLogFileName() );
		
         }
         catch(Any e)
         {
         	writelog(text=e.message, application=false, file=getExceptionLogFileName() );
         }
	}
}