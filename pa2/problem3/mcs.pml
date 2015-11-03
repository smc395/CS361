// global variables
typedef Node{
	int next;
	int waiting;
};
#define NULL -1;
Node node[2];
int tail = NULL;
int critical = 0;

inline acquire()
{
	int mynode = _pid;
	node[mynode].next = -1;  //mynode -> next <- null point next node to null
	int pred = mynode;

	//swap
	atomic{
		int temp;
		temp = tail;
		tail = pred;
		pred = temp;
	}
	if
	::(pred != -1) ->
		node[mynode].waiting = 1;
		node[pred].next = mynode;
		(node[mynode].waiting == 0);
	::else ->
		skip;
	fi;
}

inline release()
{
	int mynode = _pid;
	if
	::(node[mynode].next == -1) ->
		bool isTail = 0;
		atomic{
			if
			::(tail == mynode) ->
				tail = -1;
				isTail = 1;
			::else ->
				skip;	
			fi;
		}
		if
		::(isTail == 1) ->
			skip; // goto p1
		::else ->
			(node[mynode].next != -1);
			int w = node[mynode].next;
			node[w].waiting = 0;
		fi;
	::else ->
		w = node[mynode].next;
		node[w].waiting = 0;
	fi;
}

active [2] proctype mcs()
{
	int count=0;
	do
	::(count != 3) ->
		acquire();
		critical = critical + 1;
		assert(critical == 1);
		critical = critical - 1;
		release();
		count++;
	::else -> break;	
	od
}
