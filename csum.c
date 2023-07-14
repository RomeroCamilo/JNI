/* PURPOSE OF FILE: Defines C function that will be used via JNI */

#include "Main.h"

#include <stdio.h>

JNIEXPORT jfloat JNICALL Java_Main_cGetSum (JNIEnv *env, jclass class, jfloatArray args){
    float sum = 0;

    int size = (*env)->GetArrayLength(env,args); /* Getting size of the array */

    jfloat *elements = (*env)->GetFloatArrayElements(env, args, NULL); /* elements is a pointer to the elements in args. Returns a pointer to a C array (elements) */

    for (int i = 0; i < size; i++) /* Looping* through element in the c array elements */
    {
        sum += elements[i];
    }

    /* Elements is released as it is a local reference and will clean up when JNI EXITS */

    return sum; 
}