////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : position.h
//
// This file.....Is a Position type to hold the positions of a maze
// 
//
// Programmer        : B.J Streller with contributions from Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 3/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#pragma once
#ifndef POSITION_H__
#define POSITION_H__

struct Position
{
public:
	int row;
	int column;

	friend bool operator==(const Position& p1, const Position& p2); // overload relation for positions
	friend  bool operator!=(const Position& p1, const Position& p2); // overload !relation for positions
};

#include "position.t"
#endif