//queue based on dynamic list class

#include "list.h"

#ifndef QUEUE_H__
#define QUEUE_H__


template <class BaseData>
class Queue : protected List<BaseData>
  {
  public:
    Queue();  //constructor
    ~Queue();    //destructor
    BaseData *front();
    int emptyQ();
    int fullQ();
    void enQ(BaseData item);
    void deQ();
  };

//constructors & destructors of the base class will be called
template <class BaseData>
Queue<BaseData>::Queue() : List<BaseData>()
{}
template <class BaseData>
Queue<BaseData>::~Queue()
{}
template <class BaseData>
void Queue<BaseData>::deQ()
{
	if (!emptyQ())
	{
		this -> first();
		this -> remove();
	}
	else  cout << "empty q" << endl;
}

template <class BaseData>
void Queue<BaseData>::enQ(BaseData item)
{
	if (!fullQ())
	{
		if (this -> numNodes) this -> last();
		this -> insertAfter(item);
	}
	else cout << "full q" << endl;
}

template <class BaseData>
int Queue<BaseData>::emptyQ()
{
	return (this -> numNodes == 0);
}

template <typename BaseData>
int Queue<BaseData>::fullQ()
{
	
	ListNode<BaseData>  *p;

	p = new ListNode<BaseData>; 
	if (!p) return 1;
	delete p;
	return 0;
}

template <class BaseData>
BaseData  *Queue<BaseData>::front()
{
	if (emptyQ()) return 0;
	this -> first();

	return (this -> examine());
}




#endif

