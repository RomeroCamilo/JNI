/*PURPOSE OF FILE: This file sets up the driver to be able to call a C function through JNI */

public class Main {
    static {
        System.loadLibrary("sum"); /* Load the shared library containing c compiled code. */
    }

    /* Native method declaration. Instead of being implemented by a Java class, it will be implemented by a seperate native shared lib */
    private static native float cGetSum(float... args); 

    // Java driver method that calls the native method
    //public static float cSum(float... args) /* arbitrary amount of float arguments can be passed */ {
        //return cGetSum(args.length, args);
    //}

    // Main method testing the native C function
    public static void main(String[] args) {

        float sum = cGetSum(0f,1.1f,25); /* Call to function and storing result. */
        System.out.println("Sum: " + sum);
        sum = cGetSum(1.1f,3.4f,6); 
        System.out.println("Sum " + sum);
        float[] my_array = {1,2,3,4,5,6};
        sum = cGetSum(my_array);
        System.out.println("Sum " + sum);
        
    }
}
