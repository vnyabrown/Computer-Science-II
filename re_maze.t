////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : re_maze.t
//
// This file.....Contains the templated implementations of re_maze.h! 
// 
//
// Programmer        : Naya Brown
//
// Date created      : 4/2/21
//
// Date last revised : 4/25/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef RE_MAZE_T__
#define RE_MAZE_T__

#include"re_maze.h"

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : Maze
//
// purpose            : Constructor for maze.h ADT, initializes values of the private variable members
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
Maze<maze>::Maze()
{
	for (int r = 0; r > 12; r++)
	{
		for (int c = 0; c > 12; c++)
		{
			labyrinth[r][c] = 0;
		}
	}

	for (int r = 0; r > 12; r++)
	{
		for (int c = 0; c > 12; c++)
		{
			visitedPos[r][c] = false;
			badPos[r][c] = false;
		}
	}

} // end of constructor

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : ~Maze
//
// purpose            : destructor for maze.h ADT
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
Maze<maze>::~Maze()
{
} // end of destructor

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : getInputFileName
//
// purpose            : get the name of an input file containing a maze from the user
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : string containing maze file directory
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
string Maze<maze>::getInputFileName()
{
	ifstream file;
	string fileName;
	// Get file directory from user
	cout << "Enter file directory of a maze: ";
	cin >> fileName;
	fileName.c_str();
	file.open(fileName);
	while (file.fail()) // error check! 
	{
		file.close();
		cout << endl << "Invalid file directory! Enter again: ";
		cin >> fileName;
		fileName.c_str();
		file.open(fileName);
	}
	return fileName; // return file
} // end of getInputFileName

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : getMaze
//
// purpose            : get a maze from a file into a maze.h ADT
//
// input parameters   : reference to an ifstream variable: file
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
void Maze<maze>::getMaze(ifstream& file)
{
	Position tempPos;
	// Need to add the wall around maze now... 
	file.open(getInputFileName());
	while (file)
	{
		for (int row = 0; row < 12; row++) // initialize values of labyrinth
		{
			if (row == 0)
			{
				for (int col = 0; col < 12; col++)
				{
					labyrinth[row][col] = { '1' }; // Add first layer, 1's at the start of the maze for a surrounding wall
				}
			}

			else if (row == 11)
			{
				for (int col = 0; col < 12; col++)
				{
					labyrinth[row][col] = { '1' }; // Add 1's at the end of the maze for surrounding wall
				}
			}

			else
			{
				for (int col = 0; col < 12; col++)
				{
					if (col == 0) // Add 1's at the beginning of each column for surrounding wall
						labyrinth[row][col] = { '1' };
					else if (col == 11)
						labyrinth[row][col] = { '1' }; // Add 1's at the end of each column for surrounding wall
					else
						file >> labyrinth[row][col];
				}
			}

	} // end of for

	} // end of while

	endPos = setEnd(); // set the exit position

} // end of getMaze

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : printMaze
//
// purpose            : print a maze! (values of maze.h ADT)
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
void Maze<maze>::printMaze()
{
	cout << endl;
	for (int r = 0; r < 12; r++) // display maze!!! 
	{
		for (int c = 0; c < 12; c++)
		{
			cout << setw(2) << labyrinth[r][c]; // display each value of maze in each row/col
		}
		cout << endl;
	}
} // end of printMaze

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : setEnd
//
// purpose            : get the end/exit position of the maze
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : returns a Position ADT of the found exit
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
Position Maze<maze>::setEnd()
{
	Position* temp_pos = new Position;
	
	for (int r = 0; r < 12; r++) // check maze for exit!!!
	{
		for (int c = 0; c < 12; c++)
		{
			if (labyrinth[r][c] == 'E') // display each value of maze in each row/col
			{
				temp_pos->row = r;
				temp_pos->column = c;
				return *temp_pos; 
			}
		}
		cout << endl;
	}
} // end of setEnd

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : getStart
//
// purpose            : set the starting position in the maze
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
void Maze<maze>::getStart()
{
	Position* temp_pos = new Position;
	int row, col; 
	bool found = false;

	do {
		// Get row number from user
		cout << endl << "Enter a row in maze (1-10): ";
		cin >> row;
		while ((row < 1) || (row > 10)) // error check!
		{
			cout << endl << "Invalid! Enter again: ";
			cin >> row;
		}

		// Get column number from user
		cout << endl << "Enter a column in maze (1-10): ";
		cin >> col;
		while ((col < 1) || (col > 10))
		{
			cout << endl << "Invalid! Enter again: ";
			cin >> col;
		}

		if (labyrinth[row][col] == '1')	// Check if position is a wall
		{
			cout << "Position not available! Get a new position!!!";
		}

		else if (labyrinth[row][col] == 'E') // check if position is the exit
		{
			printFree(); // if user enters exit, exit is found!! End search!! 
		}

		else if (labyrinth[row][col] == '0') // check if position is free
		{
			found = true;
		}

		else
		{
			cout << endl << "Big time error!!! Function getStart!!!" << endl;
			return;
		}

	} while (found == false);
	
	temp_pos->row = row;
	temp_pos->column = col;
	startPos = *temp_pos;
	currentPos = startPos;
	return;
} // end of getSTart

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : checkPos
//
// purpose            : check a Position given by user to see if it's a free space or exit in the maze
//
// input parameters   : refernce to a Position: p
//
// output parameters  : none
//
// return value       : int, return a case for a switch
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
int Maze<maze>::checkPos(Position& p)
{
	if (labyrinth[p.row][p.column] == '0') // If position is free
		return 1;
	else if (labyrinth[p.row][p.column] == '1') // if position is a wall
		return 2;
	else if (labyrinth[p.row][p.column] == 'E') // if position is the exit
		return 3;
} // end of checkPos

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : walkMaze
//
// purpose            : walk through a given maze!!!
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
void Maze<maze>::walkMaze()
{
	getStart(); // get starting position of maze
	bool stuck = false;
	path.push(startPos);
		while ((free == false) && (trapped == false)) // while we still need to navigate the maze
		{
			if (!path.emptyS())
			{
				path.pop();
			}

			else // error check!
			{
				cout << "Problemo..." << endl;
				break;
			}

			visitedPos[currentPos.row][currentPos.column] = true; // mark the position as visited
			path.push(currentPos); // add position to the path

			switch (checkDirections(currentPos)) // check surrounding positions of the current position
			{
			case 1: // we can keep walking
				break;
			case 2: // the exit was found!
				free = true;
				break;
			case 3: // we are stuck! 
				stuck = true;
				break;
			default: // error check! 
				cout << "Big time error!!! Checking surrounds in walkMaze function" << endl;
				break;
			}

			if ((stuck == true) && (!path.emptyS())) // if we are stuck in the maze, begin retracing our steps
			{
				badPos[currentPos.row][currentPos.column] = true; // mark a position as a bad path
				if (!path.emptyS() && !path.endS()) // if our path to walk through still existse
				{
					path.pop();
					if (!path.endS()) // if we still have more to check, loop again
					{
						currentPos = path.top();
						stuck = false;
					}

					else trapped = true;

				}

				else if (path.endS()) // or if the path is over
				{
					cout << "Are we breaking free...?" << endl;
					break;
					//return;
				}
			}

			else if ((path.emptyS())) // we are trapped!!!
				trapped = true;

			// check if we're free
			if (free == true)
			{
				printFree();
				return;
			}

			// check if we're trapped
			if (trapped == true)
			{
				printTrapped(); 
				return;
			}
		}

} // end of walkMaze

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : checkDirections
//
// purpose            : check the surrounding positinos from the current position for walkability!!! 
//
// input parameters   : reference to a Position: p
//
// output parameters  : none
//
// return value       : int, return a case for a switch
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
int Maze<maze>::checkDirections(Position& p) // idk if I need this function but I'll keep it under considerations
{
	Position* temppos = new Position;
	// check north direction 
	*temppos = p;
	temppos->row--;
	switch (checkPos(*temppos))
	{
	case 1: // position is free, so we walk it, mark visited and get out of function
		if (visitedPos[temppos->row][temppos->column] == true) //if the position has already been visited, break!!!
			break;

		else if (badPos[temppos->row][temppos->column] == true)
			break;

		visitedPos[temppos->row][temppos->column] = true;
		currentPos = *temppos;
		path.push(currentPos);
		return 1; // get out of function
	case 2: // position is a wall, so we continue checking directions
		break;
	case 3: // position is the exit, so we exit the function
		return 2;
	default: // error!!! 
		cout << endl << "Error!!! checkDirections function!";
		return 3;
	}

	// check east direction
	*temppos = p;
	temppos->column++;
	switch (checkPos(*temppos))
	{
	case 1: // position is free, so we walk it, mark visited and get out of function
		if (visitedPos[temppos->row][temppos->column] == true) //if the position has already been visited, break!!!
			break;

		else if (badPos[temppos->row][temppos->column] == true)
			break;

		visitedPos[temppos->row][temppos->column] = true;
		currentPos = *temppos;
		path.push(currentPos);
		return 1; // get out of function
	case 2: // position is a wall, so we continue checking directions
		break;
	case 3: // position is the exit, so we exit the function
		return 2;
	default: // error!!! 
		cout << endl << "Error!!! checkDirections function!";
		return 3;
	}

	// check south direction
	*temppos = p;
	temppos->row++;
	switch (checkPos(*temppos))
	{
	case 1: // position is free, so we walk it, mark visited and get out of function
		if (visitedPos[temppos->row][temppos->column] == true) //if the position has already been visited, break!!!
			break;

		else if (badPos[temppos->row][temppos->column] == true)
			break;

		visitedPos[temppos->row][temppos->column] = true;
		currentPos = *temppos;
		path.push(currentPos);
		return 1; // get out of function
	case 2: // position is a wall, so we continue checking directions
		break;
	case 3: // position is the exit, so we exit the function
		return 2;
	default: // error!!! 
		cout << endl << "Error!!! checkDirections function!";
		return 3;
	}

	// check west direction
	*temppos = p;
	temppos->column--;
	switch (checkPos(*temppos))
	{
	case 1: // position is free, so we walk it, mark visited and get out of function
		if (visitedPos[temppos->row][temppos->column] == true) //if the position has already been visited, break!!!
			break;

		else if (badPos[temppos->row][temppos->column] == true)
			break;

		visitedPos[temppos->row][temppos->column] = true;
		currentPos = *temppos;
		path.push(currentPos);
		return 1; // get out of function
	case 2: // position is a wall, so we continue checking directions
		break;
	case 3: // position is the exit, so we exit the function
		return 2;
	default: // error!!! 
		cout << endl << "Error!!! checkDirections function!";
		return 3;
	}

	return 3;
} // end of checkDirections

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : printFree
//
// purpose            : print the final maze when we're free!!!
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
void Maze<maze>::printFree()
{
	cout << endl << "YAHOO!!! I am FREE!!!" << endl;
	cout << endl;
	for (int row = 0; row < 12; row++) // display maze!!! 
	{
		for (int col = 0; col < 12; col++)
		{
			if ((badPos[row][col] == true) && (visitedPos[row][col] == true))
				cout << setw(2) << '-'; 
			else if (badPos[row][col] == true)
				cout << setw(2) << '-';
			else if (visitedPos[row][col] == true)
				cout << setw(2) << '*';
			else
				cout << setw(2) << labyrinth[row][col];
		}
		cout << endl;
	}
	return;
} // end of printFree

/////////////////////////////////////////////////////////////////////////////////
//
// function name      : printTrapped
//
// purpose            : print the final maze when we're trapped!!! 
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
/////////////////////////////////////////////////////////////////////////////////

template <class maze>
void Maze<maze>::printTrapped()
{
	cout << endl << "HELP, I'm TRAPPED!!!" << endl;
	for (int row = 0; row < 12; row++) // display maze!!! 
	{
		for (int col = 0; col < 12; col++)
		{
			if ((badPos[row][col] == true) && (visitedPos[row][col] == true))
				cout << setw(2) << '-'; 
			else if (badPos[row][col] == true)
				cout << setw(2) << '-';
			else if (visitedPos[row][col] == true)
				cout << setw(2) << '*';
			else
				cout << setw(2) << labyrinth[row][col];
		}
		cout << endl;
	}
	return;
} // end of printTrapped

#endif
