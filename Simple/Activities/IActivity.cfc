interface
{	
	/*
	* CONSTRUCTOR
	* SUCCESSOR IS THE NEXT ACTIVITY TO EXECUTE
	* PREDECESSOR IS PERVIOUS  ACTIVITY TO ROLL BACK
	*/	
	void function init(IActivity successor, IActivity Predecessor);
	
	/*
	* onActivityStart
	* BEFORE ACTIVITY START THE PROCESS
	*/
	void function onActivityStart();
	
	/*
	* PREDECESSOR
	* PREDECESSOR METHOD IS RESPONSIBLE TO RUN PREVIOUS ACTIVITY IF INJECTED
	*/
	boolean function execute();
	
	/*
	* EXECUTE
	* THIS METHOD IS RESPONSIBLE TO RUN THIS ACTIVITY
	*/
	void function predecessor();
	
	/*
	* PROCESS
	* RUN YOUR BUSINEES LOGIC INSIDE THIS METHOD
	*/
	void function process();
	
	/*
	* SUCCESSOR
	* THIS METHOD IS RESPONSIBLE TO EXCUTE NEXT INJECTED ACTIVITY
	*/
	void function successor();
	
	/*
	* ONACTIVITYEND
	* ON THIS ACTIVITY COMPLETE ITS PROCESS
	*/
	void function onActivityEnd();
}