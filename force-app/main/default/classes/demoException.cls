public class demoException extends Exception {
    public static void demoExceptionMethod(Integer a, Integer b){
        try{
            Integer res = a/b;
            System.debug('Result is :' + res);
        }catch(NullPointerException me){
            System.debug('Please do not divide by zero');
        }catch(Exception e){
            System.debug('Parent Class Exeption');
        }finally{
            System.debug('Finally Block');
        }
    }
}