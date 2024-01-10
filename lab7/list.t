
////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : list.t
//
// This file.....Contains the templated implementation of list.h and our ADT List
// 
//
// Programmer        : B.J. Streller
//
// Date created      : 3/1/21
//
// Date last revised : 3/16/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef LIST_T_
#define LIST_T_

#include<iostream>
#include "list.h"

using namespace std;
using std::cout;
using std::endl;

//Default constructor for List
template <class BaseData>
List <BaseData>::List()
{
	this->previous = 0;
	this->currentNode = 0;
	this->head = 0;
	this->numNodes = 0;
	this->currentPos = 0;

}

//Copy constructor for List
template <class BaseData>
List <BaseData>::List(List& init)
{
    if (this == &init) return;

    ListNode* newList, *current, *newNode; 

    this->current = init.head;
    newList = 0;
    this->head = 0;
    while (this->current)
    {
        newNode = new ListNode;
        newNode->listData = current->listData;
        newNode->link = 0;

        if (newList)
        {
            newList->link = newNode;
            newList = newList->link;
        }

        else newList = newNode;

        if (this->current == init.head)
            this->head = newNode;
        this->current = current->link;
    }

    this->numNodes = init.numNodes;
    this->currentPos = 0;
    this->previous = 0;
    this->currentNode = 0;
}

//Destructor for list
template <class BaseData>
List <BaseData>::~List()
{
    this->destroy();
}

// Brings us to the first node aka the first set of data in the list
template <class BaseData>
void List <BaseData>::first()
{
    if (this->numNodes)
    {
        this->previous = 0;
        this->currentNode = head;
        this->currentPos = 1;
    }
    else
        this->currentPos = 0;
}

// Brings us to the last node aka the last set of data in the list
template <class BaseData>
void List <BaseData>::last()
{
    while (this->currentNode->link)
    {
        this->previous = this->currentNode;
        this->currentNode = this->currentNode->link;
    }
    this->currentPos = this->numNodes;
}

// Brings us to the node we choose
template <class BaseData>
void List<BaseData>::makeCurrent(int position)
{
    if ((position < 1) || (position > this->numNodes))
        cout << "invalid position: " << endl;
    else
    {
        this->first();
        for (int i = 1; i < position; i++)
        {
            this->previous = this->currentNode;
            this->currentNode = this->currentNode->link;
        }
        this->currentPos = position;
    }
}

// Brings us to the previous node aka the set of data right behind our current data
template <class BaseData>
void List<BaseData>::prev()
{
    int tempCurrPos = this->currentPos;
    if (this->currentPos > 1)
    {
        ListNode* temp = previous;
        this->first();
        if (this->currentNode == temp)
        {
            this->previous = 0;
            this->currentNode = temp;
        }
        else
        {
            while (this->currentNode->link != temp)
                this->currentNode = this->currentNode->link;
            this->previous = this->currentNode;
            this->currentNode = temp;
        }
        this->currentPos = tempCurrPos - 1;
    }
    else
    {
        cout << "walking over front of list";
        this->currentPos = 0;
    }

}

// Brings us to the next node aka the set of data right after our current data
template <class BaseData>
void List<BaseData>::next()
{
    if (this->currentNode->link)
    {
        this->previous = this->currentNode;
        this->currentNode = this->currentNode->link;
        this->currentPos++;
    }
    else
    {
        cout << "walking over end of list";
        this->currentPos = 0;
    }
}

// Gives the current node
template <class BaseData>
int List<BaseData>::current()
{
    return (this->currentPos);
}

// Gives the number of nodes we have
template <class BaseData>
int List<BaseData>::count()
{
    return (this->numNodes);
}

// Adds a node (item) of data into the previous node in the list (or current if there is none) 
template <class BaseData>
void List <BaseData>::insertBefore(const BaseData& item)
{
    ListNode<BaseData>* p;
    p = new ListNode<BaseData>;
    p->listData = item;
    if (this->numNodes)
    {
        if (this->head == currentNode) head = p;
        p->link = this->currentNode;
        if (this->previous) this->previous->link = p;
        this->numNodes++;
        this->currentNode = p;
    }
    else
    {
        this->head = p;
        p->link = 0;
        this->previous = 0;
        this->numNodes++;
        this->currentNode = p;
    }
}

// Adds a node (item) of data into the next node in the list (or current if there is none)
template <class BaseData>
void List<BaseData>::insertAfter(const BaseData& item)
{
    ListNode<BaseData>* p;
    p = new ListNode<BaseData>;
    p->listData = item;
    if (this->numNodes)
    {
        p->link = this->currentNode->link;
        this->currentNode->link = p;
        this->numNodes++;
        this->previous = this->currentNode;
        this->currentNode = p;
        this->currentPos++;
    }
    else
    {
        this->head = p;
        p->link = 0;
        this->previous = 0;
        this->numNodes++;
        this->currentNode = p;
        this->currentPos++;
    }
}

// Removes current node in the list
template <class BaseData>
void List<BaseData>::remove()
{
    ListNode<BaseData>* p, * temp; 
    p = this->currentNode;
    if (this->numNodes)	//there are nodes
    {
        if (this->previous)	//this is not the first node in the list
        {	//any other node in list but first
            this->previous->link = this->currentNode->link;
            if (this->currentNode->link != 0)
                this->currentNode = this->currentNode->link;
            else	//deleting last node in list
            {
                this->currentPos--;
                this->currentNode = previous;
                temp = this->head;
                if (temp == this->currentNode)
                    this->previous = 0;
                else
                {
                    while (temp->link != this->currentNode && temp)
                        temp = temp->link;
                    this->previous = temp;
                }
            }
            delete p;
            this->numNodes--;
        }
        else
        {	//delete first node in list
            this->head = this->head->link;
            delete p;
            this->currentNode = this->head;
            this->numNodes--;

            //if first and last node in list
            if (!(this->numNodes)) this->currentPos = 0;
        }
    }
    else cout << "empty list" << endl;
}

// Replaces current node in the list with new node (data) 
template <class  BaseData>
void List<BaseData>::replace(BaseData& item)
{
    if (this->currentNode)
        this->currentNode->listData = item;
}

// Returns the data in the current list
template <class BaseData>
BaseData* List<BaseData>::examine()
{
    BaseData* temp;
    if (this->currentNode)
    {
        temp = new BaseData;
        *temp = this->currentNode->listData;
        return (temp);
    }
    else
        return 0;
}

// Overload assignment operator for the list, assign a different list to the current list
template <class  BaseData>
List<BaseData>& List<BaseData>:: operator = (List<BaseData>& init)
{
    if (this == &init) return *this;

    ListNode* temp, * newList, * current, * newNode;
    this->currentNode = this->head;
    while (this->currentNode) //delete existing left side list
    {
        temp = this->currentNode;
        this->currentNode = this->currentNode->link;
        delete temp;
    }

    this->current = init.head;
    newList = 0;
    while (this->current)              //copy list
    {
        newNode = new ListNode;
        newNode->listData = this->current->listData;
        newNode->link = 0;
        if (newList)
        {
            newList->link = newNode;
            newList = newList->link;
        }
        else newList = newNode;
        if (this->current == init.head)
            this->head = newNode;
        this->current = this->current->link;
    }

    this->numNodes = init.numNodes;
    this->currentPos = 0;
    this->previous = 0;
    this->currentNode = 0;
    return *this;
}

// Destroy a whole list!!! 
template <class BaseData>
void List<BaseData>::destroy()
{
    ListNode<BaseData>* temp;
    this->currentNode = head;
    while (this->currentNode)
    {
        temp = currentNode;
        this->currentNode = currentNode->link;
        delete temp;

    }

    this->previous = 0;
    this->currentNode = 0;
    this->head = 0;
    this->numNodes = 0;
    this->currentPos = 0;
}

#endif
