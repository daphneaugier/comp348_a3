#include <stdio.h>

void DisplayArray(int arr[], int size) {
    int i; 
    for (i=0; i < size; i++) 
        printf("%d ", arr[i]); 
    printf("\n"); 
}

void swap(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

void SelectionSort(int arr[], int size) {
  int i, j, minimum_index;
  for(i = 0; i < size - 1; i++) {
    minimum_index = i;
    for(j = i+1; j < size; j++) {
      if (arr[j] < arr[minimum_index]) minimum_index = j;
    }
    swap(&arr[minimum_index], &arr[i]);
  }
}

int main(void) {
  int arr[5] = {1, 13, 5, 17, 11};
  DisplayArray(arr, 5);
  SelectionSort(arr, 5);
  DisplayArray(arr, 5);
}
