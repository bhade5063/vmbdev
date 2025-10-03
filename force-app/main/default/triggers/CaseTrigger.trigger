Trigger CaseTrigger on Case (before insert, before delete) {
    if(Trigger.IsInsert && Trigger.IsBefore){
        for(Case caseRecords: Trigger.New){
            if(caseRecords.Origin == 'Phone'){
                caseRecords.Priority = 'High';
                    }else{
                        caseRecords.Priority = 'Low';
             }
        }
	}
    
    if(Trigger.IsDelete && Trigger.IsBefore){
        CaseTriggerHandler.handleEventsBeforeDelete(Trigger.Old);
    }

    
}