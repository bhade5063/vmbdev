public class LeadTriggerHandler {
    public static void leadAfterInsertEventHandlerMethod(List<Lead> newLeadRecords){
        List<Task> task = new List<Task>();
        for(Lead leadRecords: newLeadRecords){
            Task taskRecord = new Task();
            taskRecord.WhoId = leadRecords.Id;
            taskRecord.OwnerId = leadRecords.OwnerId;
            taskRecord.Status = 'Not Started';
            taskRecord.Priority = 'High';
            taskRecord.Subject = 'Follow UP with the customer';
            taskRecord.Description = 'This task has been created to follow up with the customer';
            task.add(taskRecord);
        }
        
        if(!task.IsEmpty()){
            insert task;
        }
    }
    
    public static void leadBeforeDeleteEventHandlerMethod(List<Lead> newLeadRecords){
        for(Lead leadRec : newLeadRecords){
            if(leadRec.Status == 'Working-Contacted' || leadRec.Status == 'Working - Contacted'){
                leadRec.addError('Lead can NOT be deleted when status is In Progress.');
            }
        }
    }
}