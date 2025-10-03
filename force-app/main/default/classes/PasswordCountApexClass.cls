public class PasswordCountApexClass {
	public static string correctPassword = 'SHRINATH_SWAMI';
    public static Integer attemptCounter = 1;
    
    public static void triggerPasswordMethod(){
        String finalAnswer = '';
        finalAnswer = handleCountMethod('SHRI');
        System.debug('>>>First : ' + finalAnswer);
        finalAnswer = handleCountMethod('SHRIANTH');
        System.debug('>>>Second : ' + finalAnswer);
        finalAnswer = handleCountMethod('SHRINATH_');
        System.debug('>>>Third : ' + finalAnswer);
        finalAnswer = handleCountMethod('SHRIWRONG');
        System.debug('>>>Fourth : ' + finalAnswer);
        
    }
    
    public static string handleCountMethod(String enteredPassword){
        if(enteredPassword != correctPassword){
            if(attemptCounter > 3){
                return 'Max Limit has been reached, you account has been locked.';
            }
            attemptCounter++;
            return 'Failure';
        }else{
            return 'Success';
        }
    }
}