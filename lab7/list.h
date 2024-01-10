#pragma once

////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : list.h
//
// This file.....Holds the definition for our List ADT
// 
//
// Programmer        : Naya Brown
//
// Date created      : 3/1/21
//
// Date last revised : 3/16/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef LIST_H_
#define LIST_H_

#include <iostream>

using std::cout;
using std::endl;

template <class BaseData>
struct ListNode
{
public:
    BaseData listData;
    ListNode* link;

};

template <class BaseData>
class List
{
protected:

public:
    List(); // Default constrctor
    List(List& init); // Copy constructor
    ~List(); // Destructor
    void first(); 
    void last(); 
    void makeCurrent(int position); // 
    void prev(); 
    void next(); 
    int current(); 
    int count(); 
    void insertBefore(const BaseData& item); 
    void insertAfter(const BaseData& item); 
    void remove(); 
    void replace(BaseData& item); 
    BaseData* examine(); 
    List<BaseData>& operator = (List<BaseData>& source); // Overload assignment operator
    void destroy(); 

protected:

    ListNode<BaseData>* head, * currentNode, * previous;
    int numNodes;
    int currentPos;

};

#include "list.t"
#endif