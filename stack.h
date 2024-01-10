////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : stack.h
//
// This file.....is an Stack ADT
// 
//
// Programmer        : B.J Streller with contributions from Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 4/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////


#include "position.h"
#include <list>
#ifndef STACK_H__
#define STACK_H__
using namespace std;

class Stack  :  protected list<Position>
  {
  public:
	  Stack();
	  ~Stack();
	  void push(Position);
	  void pop();
	  Position& top();
	  bool emptyS();
	  bool fullS();
	  bool endS();
	  //bool inStack(Position&p); // check if a position is in the stack IILEGALLLL
  };

#include "stack.t"

#endif
