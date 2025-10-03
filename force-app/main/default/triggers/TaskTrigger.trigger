trigger TaskTrigger on Task (before insert, after insert) {
    
    if(Trigger.IsInsert && Trigger.IsBefore){
        for(Task taskRecord: Trigger.New){
				System.debug('Task Record Found');
            	taskRecord.Priority = 'High';
        	}
    }
    
    if(Trigger.IsInsert && Trigger.IsAfter){
        TaskTriggerHandler.handleActivitiesAfterInsert(Trigger.New);
    }
}