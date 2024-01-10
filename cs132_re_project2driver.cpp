////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : cs132_re_project2driver.cpp
//
// This file.....Is the driver for a maze navigation using a maze, position, and stack ADTs
// 
//
// Programmer        : Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 4/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#include<iostream>
#include<fstream>
#include"re_maze.h"

using namespace std;

void menu(); // menu to control program
void mazeStart(); // start the maze program! 

int main()
{
	cout << "Welcome to the maze program! Give a maze, then a position to find a path out of the maze." << endl;
	menu();

	return 0;
}

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : menu
//
// purpose            : a menu for the user to control the maze program
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

void menu()
{
	bool on = true;
	do
	{
		mazeStart();
		cout << endl << "Would you like to get another maze? (Press 1 for YES/START and 0 for NO/QUIT.): ";
		cin >> on;
		while ((on < 0) || (on > 1))
		{
			cout << endl << "Invalid input!!! Enter again. (1 for YES/START and 0 for NO/QUIT): ";
			cin >> on;
		}

	} while (on == true);
	cout << "Thank you for walking the maze!" << endl;
} // end of menu

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : mazeStart
//
// purpose            : run the maze!
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

void mazeStart()
{
	cout << "~ It's maze time! ~" << endl;
	ifstream mazeFile;
	Maze<char> *mazeTime = new Maze<char>; // create a mazeObject
	mazeTime->getMaze(mazeFile);
	mazeTime->printMaze();
	mazeTime->walkMaze();

	delete mazeTime;
}