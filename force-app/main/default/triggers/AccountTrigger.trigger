trigger AccountTrigger on Account (before update, after update, after insert) {
    
    if(Trigger.IsAfter && Trigger.IsInsert){
        AccountTriggerHandler.handleAfterInsertEvent(Trigger.New);
    }
    
    if(Trigger.IsBefore && Trigger.IsUpdate){
        AccountTriggerHandler.handleBeforeUpdateEvent(Trigger.New, Trigger.oldMap);
    }
    if(Trigger.IsAfter && Trigger.IsUpdate){
        AccountTriggerHandler.handleAfterUpdateEvent(Trigger.New, Trigger.oldMap);
    }
}