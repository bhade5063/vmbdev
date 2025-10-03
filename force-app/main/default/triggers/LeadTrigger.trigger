trigger LeadTrigger on Lead (before update, after insert, before delete) {
    
    If(Trigger.IsUpdate && Trigger.IsBefore){
        for(Lead LeadRecord: Trigger.New){
            if(LeadRecord.Industry == 'Healthcare'){
                LeadRecord.LeadSource = 'Purchased List';
                LeadRecord.SICCode__c = '1100';
                LeadRecord.Primary__c = 'Yes';
            }
        }
    }
    
    if(Trigger.IsInsert && Trigger.IsAfter){
     	LeadTriggerHandler.leadAfterInsertEventHandlerMethod(Trigger.New);
    }
	
    if(Trigger.IsDelete && Trigger.IsBefore){
     	LeadTriggerHandler.leadBeforeDeleteEventHandlerMethod(Trigger.Old);
    }
}