#include <stdio.h>

void CallFun(int *number);

int main(void) {
  int a = 3;
  printf("Value of a before : %d\n", a );
  CallFun(&a);
  printf("Value of a after : %d\n", a );
  return 0;
}

void CallFun(int *number) {
  *number = 17;
}
