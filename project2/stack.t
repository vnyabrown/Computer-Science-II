////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : stack.t
//
// This file.....Contains the templated implementations of stackPath.h
// 
//
// Programmer        : Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 4/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef STACK_T_
#define STACK_T_
#include "stack.h"
#include<list>

using namespace std;

Stack::Stack() {}

Stack::~Stack() {}

void Stack::push(Position p)
{
	if (!fullS())
		push_front(p);
}

void Stack::pop()
{
	if (!emptyS())
	{
		iterator i = begin();

		remove(*i);
	}

	else
	{
		return;
	}

}

Position& Stack::top()
{
	iterator i = begin();

	return *i;

}


bool Stack::emptyS()
{
	return empty();
}

bool Stack::fullS()
{
	//number of items in list 
	//== maximum number 
	return size() == max_size();
}

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : endS
//
// purpose            : check if it's the end of the stack
//
// input parameters   : noen
//
// output parameters  : none
//
// return value       : bool, true if end, false if not
//
/////////////////////////////////////////////////////////////////////////////////

bool Stack::endS()
{
	iterator i = begin();
	if (i == end())
		return true;
	else
		return false;
}

#endif