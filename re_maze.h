////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : re_maze.h
//
// This file.....Is a ADT maze to do the functions of a maze
// 
//
// Programmer        : Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 3/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////
#pragma once

#ifndef RE_MAZE_H__
#define RE_MAZE_H__

#include<iostream>
#include<fstream>
#include<string>
#include<iomanip>
#include"position.h"
#include"stack.h"

using namespace std;

template <class maze>
class Maze
{
private:
	char labyrinth[12][12]; // 12x12 two-dimensional array to hold a maze 
	bool badPos[12][12]; // store bad positions
	bool visitedPos[12][12]; // store visited positions
	Position startPos; // Starting position in maze 
	Position endPos; // Goal position in maze 
	Position currentPos; // Current position in maze 
	Stack path; // stack to store final taken path
	bool free = false;
	bool trapped = false;
public:
	Maze(); // default constructor for maze class 
	~Maze(); // destructor for maze class
	string getInputFileName(); // get input file containing maze from user 
	void getMaze(ifstream& file); // read file into a maze 
	void printMaze(); // print the maze to the console 
	Position setEnd(); // find exit of maze (E) and set it as the end of the maze 
	void getStart(); // get starting position in maze from user 
	int checkPos(Position& p); // check a position for availablity 
	void walkMaze(); // start to walk through maze 
	int checkDirections(Position& p); // check north, east, west, south positions from current position 
	void printFree(); // print maze when you're free 
	void printTrapped(); // print final maze when you're trapped 
};

#include"re_maze.t"

#endif

