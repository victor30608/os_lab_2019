#include "revert_string.h"

void RevertString(char *str)
{
int length = strlen(str);
   char * temp = (char*)malloc((length + 1) * sizeof(char));
   memcpy(temp, str, length + 1);
   char * p_back = temp + length - 1;
   
   for (char * p = temp; p < p_back; p++, p_back--) {
      *p ^= *p_back;
      *p_back ^= *p;
      *p ^= *p_back;
   }
   
 memcpy(str, temp, length + 1);
}

