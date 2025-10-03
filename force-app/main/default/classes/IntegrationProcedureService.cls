public class IntegrationProcedureService  
{
    public static void runIntegrationService(String procedureAPIName, Map<String, Object> input, Map<String, Object> options)
    {
         
 			Map<String, Object> ipOutput = new Map<String, Object> ();
            ipOutput = (Map<String, Object>) omnistudio.IntegrationProcedureService.runIntegrationService(procedureAPIName, input, options);
            System.debug('IP Output: ' + ipOutput);
	}
}