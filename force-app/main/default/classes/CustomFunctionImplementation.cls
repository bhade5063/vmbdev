global class CustomFunctionImplementation implements Callable
{
    /*
        inputs - arguments - List<Object> of passed in arguments
        output - result - The result of the Function being called. Supports single Object values, List<Object> or Map<String, Object>
    */
    public Object call(String action, Map<String, Object> args) {

        Map<String, Object> input = (Map<String, Object>)args.get('input');
        Map<String, Object> output = (Map<String, Object>)args.get('output');
        Map<String, Object> options = (Map<String, Object>)args.get('options');

        return invokeMethod(action, input, output, options);
    }
    global Boolean invokeMethod(String methodName, Map<String, Object> inputs, Map<String, Object> output, Map<String, Object> options)
    {
        // SUM Returns a single value
        if (methodName == 'CustomSum')
        {
            List<Object> arguments = (List<Object>)inputs.get('arguments');
            output.put('result', CustomSum(arguments));
        }
        /*
            Split Returns a Map<String, Object of values. Not all functions will be able to handle Map<String, Object> results,
            so be careful when using these functions.
            In a DataRaptor Transform step returning a Map<String, Object> from a Formula will result in applying that Map to the
            JSON Data at the FormulaResultPath. See https://vlocity.atlassian.net/wiki/display/RAP/Transforms
        */
        else if (methodName == 'split')
        {
            List<Object> arguments = (List<Object>)inputs.get('arguments');
            output.put('result', split(arguments));
        }
        return true;
    }
    Double CustomSum(List<Object> arguments)
    {
        Double result = 0;
        for(Object token : arguments)
        {
            if (token != null)
            {
                result += (Double)token;
            }
        }
        return result;
    }
    Map<String, String> split(List<Object> arguments)
    {
        Map<String, String> result = new Map<String, String>();
        String toSplit = (String)arguments[0];
        String splitter = (String)arguments[1];
        List<String> splitList = toSplit.split(splitter);
        for (Integer i = 0; i < splitList.size(); i++)
        {
            if (arguments.size() > i+2)
            {
                result.put((String)arguments[i+2], splitList[i]);
            }
            else
            {
                result.put('Split'+i, splitList[i]);
            }
        }
        return result;
    }
}