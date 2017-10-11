/*
	TODO maybe: Set a parameter to add (or not) ACE Javelin to game (see config/WEapons.sqf).
*/
	class delimiterServer
    {
        title="====================================Server Settings=====================================";
        texts[]={"=================================================================================="};
        values[]={0};
        default=0;
        isGlobal=1;
        
    };

	
    
    class debug
    {
        title = "DEBUG";
        texts[] = {"TRUE","FALSE"};
        values[] = {1,0};
        default = 0;
    };
   
    class headlessClient
    {
        title="Headless Client";
        texts[]={"Disabled","Enabled","Auto detect"};
        values[]={0,1,2};
        default=2;
        isGlobal=1;
    };
	
	 class load
    {
        title = "Load last state";
        texts[] = {"Yes","No"};
        values[] = {1,0};
        default = 1;
    };
	
	class delimiterMedic
    {
        title="====================================Medical Settings=====================================";
        texts[]={"=================================================================================="};
        values[]={0};
        default=0;
        isGlobal=1;
        
    };
	
	class ReviveMode
	{
			title="Vanilla Revive";
			texts[]={"Disabled","Enabled"};
			values[]={0,1};
			default=0;
			isGlobal=1;
	};
	
	
	class aceMedic
    {
        title="ACE Prevent Instant death hotfix";
        texts[]={"No","Yes"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };
	
	class respawnVehicles
    {
        title="Allow respawn on vehicles";
        texts[]={"No","Yes"};
        values[]={0,1};
        default=0;
        isGlobal=1;
    };
	
	class delimiterEnvironment
    {
        title="====================================Environmental Settings=====================================";
        texts[]={"=================================================================================="};
        values[]={0};
        default=0;
        isGlobal=1;
        
    };
    
    
    class timeMultiplier
    {
        title="Fast Forward Multiplier";
        texts[]={"1x","2x","5x","10x","20x","50x","70x","100x"};
        values[]={1,2,5,10,20,50,70,100};
        default  = 1;
        isGlobal = 1;
        
    };
    class startTime
    {
        title="Start Time";
        texts[]={"0000","0100","0200","0300","0400","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300"};
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
        default  = 8;
        isGlobal = 1;
        
    };

    class delimiterAI
    {
        title="====================================AI Settings=====================================";
        texts[]={"=================================================================================="};
        values[]={0};
        default=0;
        isGlobal=1;
        
    };


    class aiDifficulty
    {
        title="AI Difficulty";
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        default  = 7;
        isGlobal = 1;
    };

    class aiDisableNVG
    {
        title = "Disable NVG for AI";
        texts[] = {"True","False"};
        values[] = {1,0};
        default = 1;
    };

    class delimiter
    {
        title="====================================Map Settings=====================================";
        texts[]={"=================================================================================="};
        values[]={0};
        default=0;
        isGlobal=1;
        
    };

    class targetsBLUFOR
    {
        title="Targets zones for BLUFOR";
        texts[] = {"0","1","2","3","4","5","Unlimited"};
        values[] = {0,1,2,3,4,5,300};
        default = 1;
    };

    class targetsINDEPENDENT
    {
        title="Targets zones for Independent";
        texts[] = {"0","1","2","3","4","5","Unlimited"};
        values[] = {0,1,2,3,4,5,300};
        default = 1;
    };

   
    class minZoneSize
    {
        title = "Minimal Zone size";
        texts[] = {"50","100","150","200","250"};
        values[] = {50,100,150,200,250};
        default = 150;
    };
    class maxZoneSize
    {
        title = "Maximal Zone size";
        texts[] = {"250","300","350","400","500","600","750"};
        values[] = {250,300,350,400,500,600,750};
        default = 600;
    };
    class maxZoneDistance
    {
        title = "Maximum distance for two neighbour-zones";
        texts[] = {"500","1000","2000","3000","4000","5000","7500","Infinite"};
        values[] = {500,3000,2000,3000,4000,5000,7500,99999999};
        default = 7500;
    };
    class maxZoneAngle
    {
        title = "Connection Cleaner";
        texts[] = {"Minimal spanning tree","5°","10°","20°","30°","45°","60°","75°","90°","135°","180°"};
        values[] = {0,5,10,20,30,45,60,75,90,135,180};
        default = 0;
    };
    class zoneGenerator
    {
        title = "Zone Generator";
        texts[] = {"Advanced Zone Generator","Cities","10-Roads","20-Roads","30-Roads","40-Roads","50-Roads","60-Roads","75-Roads","100-Roads"};
        values[] = {1,0,10,20,30,40,50,60,75,100};
        default = 1;
    };
   
  
    
    
    
