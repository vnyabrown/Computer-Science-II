////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : position.t
//
// This file.....Contains the templated implementations of position.h
// 
//
// Programmer        : Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 3/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef POSITION_T__
#define POSITION_T__

#include"position.h"

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : operator (==)
//
// purpose            : overload relation
//
// input parameters   : reference to two positions: p1, p2
//
// output parameters  : none
//
// return value       : bool, return true if equal or false if not
//
/////////////////////////////////////////////////////////////////////////////////

bool operator==(const Position& p1, const Position& p2)
{
	if ((p1.row == p2.row) && (p1.column == p2.column))
		return true;
	else
		return false;
} // end of operator (==)

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : operator!=
//
// purpose            : overload !relation
//
// input parameters   : reference to two positions: p1, p2
//
// output parameters  : none
//
// return value       : bool, return true if unequal or false if not
//
/////////////////////////////////////////////////////////////////////////////////

bool operator!=(const Position& p1, const Position& p2)
{
	if ((p1.row != p2.row) && (p1.column != p2.column))
		return true;
	else
		return false;
} // end of operator (!=)

#endif