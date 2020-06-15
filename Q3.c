#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct book_details {
    char* title;
    float price; 
} book;

void Add(book *my_book, int i);
void Display(book *my_book, int i);
float AverageBookPrice(book *my_book, int n);


int main() {

    int n, i;
    printf("Enter how many books to store: ");
    scanf("%d", &n);

    book book_list[n];

    for (int i = 0; i <n; ++i) {
       printf("Please insert information for book #%d \n", i+1);
       Add(book_list, i);
    }

    Display(book_list, n);

    printf("\n\nAverage Book Price is %f\n\n", AverageBookPrice(book_list, n));

    return 0;
}

/**
 *  Read info for a book from the user 
 * */
void Add(book *my_book, int n)
{
    char title[61];

    printf("\tTitle: ");
    // scanf("%s", &my_book[i].title);
    scanf("%60s", title);      
    my_book[n].title = (char*)malloc(strlen(title));
    strcpy(my_book[n].title, title);

    printf("\tPrice: ");
    scanf("%f", &my_book[n].price);

    return;
}

void Display(book *my_book, int n)
{
    for (int i = 0; i <n; ++i) {
        printf("\nDetails for book #%d \n", i+1);
        printf("\tTitle: %s\n", my_book[i].title);
        printf("\tPrice: %f\n", my_book[i].price);
   }

}

float AverageBookPrice(book *my_book, int n)
{
    float total_price = 0.0;
    for (int i = 0; i <n; ++i) {
        total_price += my_book[i].price;
   }

   return total_price/n;

}