global class TaskCreation implements omnistudio.VlocityOpenInterface {
    public Boolean invokeMethod(String methodName, Map < String, Object > input, Map < String, Object > outMap, Map < String, Object > options) {
        System.debug('Hello');
        if(methodName == 'taskAssign'){
            taskAssign(input,outMap);
        }
        return true;
    } 
    public static void taskAssign(Map < String, Object > inputMap, Map < String, Object > outputMap){
        System.debug('Hello' + inputMap);
        List<Map<String, Object>> Cse = (List<Map<String, Object>>)inputMap.get('Case');
		System.debug('Hello' + Cse);   
        List<Task> taskListNew = new List<Task>();
        for(Integer i = 0; i < Cse.size(); i++){
            Map<String, Object> c = Cse[i];
            Task tk = new Task();
            tk.Priority = 'Normal';
            tk.Subject = 'Web';
            tk.Status = 'Not Started';
            tk.WhatId = (ID)c.get('CaseId');
            taskListNew.add(tk);
            System.debug('CaseId => ' + c.get('CaseId'));
           
        }
        	if(!taskListNew.isEmpty())
        {
         	insert taskListNew;
        }
         outputMap.put('Tasks', taskListNew);
    }
}