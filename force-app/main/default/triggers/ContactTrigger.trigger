trigger ContactTrigger on Contact (before insert, after insert, after update) {
    if(Trigger.IsBefore && Trigger.IsInsert){
        ContactTriggerHandler.handlebeforeinsertevents(Trigger.New);
    }
    
    if(Trigger.IsAfter && Trigger.IsInsert){
         ContactTriggerHandler.handleafterinsertevents(Trigger.New);
    }
    
    if(Trigger.IsAfter && Trigger.IsUpdate){
         ContactTriggerHandler.handleafterupdateevents(Trigger.New, Trigger.OldMap);
    }
}