/**
* LLA
* @author           Shrinath Swami
* Description:      This apex is class used to delete the order in system mode.
* Changes (Version)
* -------------------------------------
*            No.    Date            Author                          Description
*            ----   ----------      ---------------------------     -------------
* @version   1.0    11-10-2024       Shrinath Swami                 Class created
*************************************************************************************/
global without sharing class PR_DeleteOrderSystemModeCls implements omnistudio.VlocityOpenInterface {
    global boolean invokeMethod(String methodName, Map<String, Object> input, Map<String, Object> output, Map<String, Object> options) {
        Boolean result = false;
        
        try {
            if (methodName.equalsIgnoreCase('deleteOrderSystemMode')) {
                String orderId = (String) input.get('OrderId');
                output.put('isDeleted', deleteOrder(orderId));
                return true;
            }
        } catch (System.Exception e) {
        }
        return result;
    }

    public static Boolean deleteOrder(Id orderId) {
        Boolean isDeleted = false;
        
        try {
            List<Order> orderToDelete = [SELECT Id FROM Order WHERE Id = :orderId LIMIT 1];
            if (!orderToDelete.IsEmpty()) {
                delete orderToDelete;
                isDeleted = true;
            }
        } catch (DmlException e) {
            System.debug('Failed to delete the order: ' + e.getMessage());
        }
        return isDeleted;
    }
}