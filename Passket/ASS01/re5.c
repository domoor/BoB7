#include <stdio.h>
#include <stdlib.h>

struct linkedlist {
	struct node *head;
	struct node *tail;
};

struct node {
	int data;
	struct node *next;
};


void list_printall(struct linkedlist *a1)
{
	struct node *p = a1->head;

	while(p != NULL) {
		printf("%d\n", p->data);
		p = p->next;
	}
}

void list_add_to_tail(struct linkedlist *a1, int a2)
{
	if(a1->tail == NULL) {
		a1->tail = malloc(16);
		a1->tail->data = a2;
		a1->tail->next = NULL;
		a1->head = a1->tail;
	}
	else {
		a1->tail->next = malloc(16);
		a1->tail->next->data = a2;
		a1->tail->next->next = NULL;
		a1->tail = a1->tail->next;
	}
}

void list_init(struct linkedlist *a1)
{
	a1->tail = NULL;
	a1->head = a1->tail;
}

int main()
{
	struct linkedlist ll;

	list_init(&ll);
	list_add_to_tail(&ll, 1);
	list_add_to_tail(&ll, 2);
	list_add_to_tail(&ll, 3);
	list_printall(&ll);
	return 0;
}

