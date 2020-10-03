
init
{

    /*timer.OnSplit += (s, e) => { LiveSplitState CurrentState = (LiveSplitState)(s);
        if (CurrentState.CurrentTime.RealTime > TimeSpan.Zero && vars.Loading && !vars.isCorrected)
            {
                if (CurrentState.Run.Count != CurrentState.CurrentSplitIndex)
                {
                        print((CurrentState.CurrentSplitIndex-1).ToString());
                        print(CurrentState.TimePausedAt.ToString());
                        Time ts = CurrentState.CurrentTime;
                        ts.GameTime += (TimeSpan?)CurrentState.TimePausedAt;
                        Time LastSplitTime = CurrentState.Run[CurrentState.CurrentSplitIndex-1].SplitTime;
                        LastSplitTime.GameTime += (TimeSpan?)CurrentState.TimePausedAt;
                        CurrentState.Run[CurrentState.CurrentSplitIndex-1].SplitTime = LastSplitTime;
                        LiveSplit.UI.Components.IComponent splits = null;
                        foreach (LiveSplit.UI.Components.IComponent comp in CurrentState.Layout.Components){
                            if(comp.ComponentName == "Splits"){
                                splits = (LiveSplit.UI.Components.IComponent)comp;
                                break;
                            }
                        }
                        print((splits == null).ToString());
                        if(splits != null){
                            splits.Update(null, CurrentState, 0.0f, 0.0f, CurrentState.Layout.Mode);
                        }
                        vars.isCorrected = true;
                }
                CurrentState.Run.HasChanged = true;

            }
    };*/
    refreshRate = 10;
    vars.nSplits = 15;
    vars.cSplit = 0;
    vars.loadcheck = 0.0;
    vars.loadcheckav = 0.0;
    vars.isCorrected = false;
    vars.loadStart = -1;
    vars.levelidx = 0; 
    vars.Loading = false;
    vars.text = 0.0;
    vars.textav = 0.0;


}
update
{
    vars.loadcheckav  = features["loadicon"].average(200);
    vars.loadcheck = features["fullscreen"].average(200);
    //vars.textav = features["loadtext"].average(250);		
    //vars.Loading = vars.loadcheckav >= 97.5;
    //if(!vars.Loading && vars.isCorrected){
    //    vars.isCorrected = false;
    //}
}


start
{
    
}
split{
    
}
reset{
    
}
isLoading{
	if ( features["loadtext"].average(250) < 92.5){
    		return vars.loadcheck >= 98.0;
	} else {
			return vars.loadcheck >= 98.0 ||  features["loadtext"].average(250) >= 92.5;
	}
}

