////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : lab7_client_driver.cpp
//
// This file.....is a driver that uses the stack, queue, and list ADTs to check if a sequence of characters is a palindrome
// 
//
// Programmer        : Naya Brown
//
// Date created      : 3/14/21
//
// Date last revised : 3/16/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

#include<iostream>
#include"queue.h"
#include"stack.h"
#include<string>

using namespace std;

//Let user fill the stack and queue with a sequence of characters! (a word or sentence or sequence of words)
void readChar(Stack<char> &stack, Queue<char> &queue, string &full);

//Check if the users word/letter sequence was a palindrome! 
void checkPalindrome(Stack<char>& stack, Queue<char>& queue, string &full);

int main()
{
	bool on = true; //bool to act as switch for program
	string word; //word from user
	Stack<char> ourStack;
	Queue<char> ourQueue;

	do {
		readChar(ourStack, ourQueue, word); // function call
		checkPalindrome(ourStack, ourQueue, word); // function call

		cout << "Would you like to check another word? (Type 1 for yes and 0 for no!)";
		cin >> on;
	
	} while (on != false); // Run program as long as user wants to check a word

	return 0;
}
/* End of main */



/******************************************************************************************
*
* Function Name: readChar
*
* Purpose: Gets a sequence of letters or a word from user and pushes/queues it into a stack and queue
*
*
* Input Parameters: reference to a stack, &stack
*					reference to a queue, &queue
*					reference to a string, &full
*
* Output parameters: none
*
* Return Value: none
*
******************************************************************************************/

void readChar(Stack<char>& stack, Queue<char>& queue, string &full)
{
	char letter;
	cout << endl << "Enter a sequence of letters (The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!" << endl;
	
	do
	{
		cin >> letter;
		if (letter == '&') // Break out of loop if user quits, & acts as off button
			break;
		stack.push(letter); queue.enQ(letter); // add the letter to the queue and stack
		full += letter; // add letter to full word
	} while (letter != '&');
} // end of readChar



/******************************************************************************************
*
* Function Name: checkPalindrome
*
* Purpose: checks if the word/character sequence read into the stack and queue is a palindrome or not
*			if the stack is emptied front to back and the queue is emptied back to front, it was a palindrome, otherwise it was not
*
*
* Input Parameters: reference to a stack, &stack
*					reference to a queue, &queue
*					reference to a string, &full
* 
* Output parameters: none
*
* Return Value: none
*
******************************************************************************************/

void checkPalindrome(Stack<char>& stack, Queue<char>& queue, string &full)
{
	while ((*stack.top() == *queue.front())) // while the top/front of the stack/queue is equal
	{
		stack.pop(); // pop top letter
		queue.deQ(); // pop back letter
		if ((stack.emptyS()) || queue.emptyQ()) // if either becomes empty, break out of loop
		{
			break;
		}
	}

	if (stack.emptyS() && queue.emptyQ()) // if both were empty by the end
		cout << full << " was a palindrome!" << endl << endl; 
	else // if both were not empty by the end
		cout << full << " was not a palindrome!" << endl << endl; 
	
	while (!(stack.emptyS()) && !(queue.emptyQ())) // make sure queue and stack is empty again
	{
		stack.pop(); queue.deQ();
	}
	full.clear(); // make sure the word is empty again
} // end of checkPalindrome




//Enter a sequence of letters(The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!
//livenotonevil
//&
//livenotonevil was a palindrome!
//
//Would you like to check another word ? (Type 1 for yes and 0 for no!)1
//
//Enter a sequence of letters(The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!
//dad
//&
//dad was a palindrome!
//
//Would you like to check another word ? (Type 1 for yes and 0 for no!)1
//
//Enter a sequence of letters(The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!
//ablewasIereIsawelba
//&
//ablewasIereIsawelba was a palindrome!
//
//Would you like to check another word ? (Type 1 for yes and 0 for no!)1
//
//Enter a sequence of letters(The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!
//naya
//&
//naya was not a palindrome!
//
//Would you like to check another word ? (Type 1 for yes and 0 for no!)1
//
//Enter a sequence of letters(The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!
//loveevol
//&
//loveevol was a palindrome!
//
//Would you like to check another word ? (Type 1 for yes and 0 for no!)1
//
//Enter a sequence of letters(The sequence can make up a word, sentence, or sequence of words!), enter '&' to stop!
//drawkward
//&
//drawkward was a palindrome!
//
//Would you like to check another word ? (Type 1 for yes and 0 for no!)0
//
//C : \Welcome To Kalifornia\Homework\College\Spring 2021\Computer Science II\Lessons\Labs\Lab 7\cs132_Lab7_2021\Debug\cs132_Lab7_2021.exe(process 24284) exited with code 0.
//To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.
//Press any key to close this window . . .
