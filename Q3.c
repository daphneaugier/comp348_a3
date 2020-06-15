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

    printf("\n\tIncredible Book Management\n\t==========================\n\n");
    int n = 0;

    printf("Enter how many books to store: ");
    while (scanf("%d", &n) != 1){
        int c;
        /* read and ignore the rest of the line */
        while ((c = getchar()) != EOF && c != '\n')
            continue;
        if (c == EOF) {
            /* premature end of file */
            return 1;
        }
        printf("Enter how many books to store: ");
    }
    book book_list[n];

    printf("\n\nGet ready to input information for %d books\n", n);
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
    while (scanf("%f", &my_book[n].price) != 1){
        int c;
        /* read and ignore the rest of the line */
        while ((c = getchar()) != EOF && c != '\n')
            continue;
        if (c == EOF) {
            /* premature end of file */
            return;
        }
        printf("\tPrice: ");
    }

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