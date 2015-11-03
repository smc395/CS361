#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM never_0 */
	case 3: /* STATE 1 - mcs.pml.nvr:5 - [((critical>1))] (6:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[1][1] = 1;
		if (!((now.critical>1)))
			continue;
		/* merge: assert(!((critical>1)))(0, 2, 6) */
		reached[1][2] = 1;
		spin_assert( !((now.critical>1)), " !((critical>1))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[1][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: /* STATE 10 - mcs.pml.nvr:10 - [-end-] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC mcs */
	case 5: /* STATE 1 - mcs.pml:67 - [((count!=3))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((P0 *)this)->count!=3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 2 - mcs.pml:14 - [mynode = _pid] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_1_mynode;
		((P0 *)this)->_2_1_mynode = ((int)((P0 *)this)->_pid);
#ifdef VAR_RANGES
		logval("mcs:mynode", ((P0 *)this)->_2_1_mynode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 3 - mcs.pml:14 - [node[mynode].next = -(1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].next;
		now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].next =  -(1);
#ifdef VAR_RANGES
		logval("node[mcs:mynode].next", now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].next);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 4 - mcs.pml:18 - [pred = mynode] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_1_pred;
		((P0 *)this)->_2_1_pred = ((P0 *)this)->_2_1_mynode;
#ifdef VAR_RANGES
		logval("mcs:pred", ((P0 *)this)->_2_1_pred);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 5 - mcs.pml:20 - [temp = 0] (0:16:4 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_2_1_1_temp;
		((P0 *)this)->_2_1_1_temp = 0;
#ifdef VAR_RANGES
		logval("mcs:temp", ((P0 *)this)->_2_1_1_temp);
#endif
		;
		/* merge: temp = tail(16, 6, 16) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->_2_1_1_temp;
		((P0 *)this)->_2_1_1_temp = now.tail;
#ifdef VAR_RANGES
		logval("mcs:temp", ((P0 *)this)->_2_1_1_temp);
#endif
		;
		/* merge: tail = pred(16, 7, 16) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[2] = now.tail;
		now.tail = ((P0 *)this)->_2_1_pred;
#ifdef VAR_RANGES
		logval("tail", now.tail);
#endif
		;
		/* merge: pred = temp(16, 8, 16) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->_2_1_pred;
		((P0 *)this)->_2_1_pred = ((P0 *)this)->_2_1_1_temp;
#ifdef VAR_RANGES
		logval("mcs:pred", ((P0 *)this)->_2_1_pred);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 10: /* STATE 10 - mcs.pml:25 - [((pred!=-(1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][10] = 1;
		if (!((((P0 *)this)->_2_1_pred!= -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 11 - mcs.pml:26 - [node[mynode].waiting = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].waiting;
		now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].waiting = 1;
#ifdef VAR_RANGES
		logval("node[mcs:mynode].waiting", now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].waiting);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 12 - mcs.pml:27 - [node[pred].next = mynode] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((P0 *)this)->_2_1_pred, 2) ].next;
		now.node[ Index(((P0 *)this)->_2_1_pred, 2) ].next = ((P0 *)this)->_2_1_mynode;
#ifdef VAR_RANGES
		logval("node[mcs:pred].next", now.node[ Index(((P0 *)this)->_2_1_pred, 2) ].next);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 13 - mcs.pml:28 - [((node[mynode].waiting==0))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!((now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].waiting==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _2_1_mynode */  (trpt+1)->bup.oval = ((P0 *)this)->_2_1_mynode;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_1_mynode = 0;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 19 - mcs.pml:69 - [critical = (critical+1)] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][19] = 1;
		(trpt+1)->bup.oval = now.critical;
		now.critical = (now.critical+1);
#ifdef VAR_RANGES
		logval("critical", now.critical);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 20 - mcs.pml:70 - [assert((critical==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		spin_assert((now.critical==1), "(critical==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 21 - mcs.pml:71 - [critical = (critical-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = now.critical;
		now.critical = (now.critical-1);
#ifdef VAR_RANGES
		logval("critical", now.critical);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 22 - mcs.pml:37 - [mynode = _pid] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_2_mynode;
		((P0 *)this)->_2_2_mynode = ((int)((P0 *)this)->_pid);
#ifdef VAR_RANGES
		logval("mcs:mynode", ((P0 *)this)->_2_2_mynode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 23 - mcs.pml:38 - [((node[mynode].next==-(1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		if (!((now.node[ Index(((P0 *)this)->_2_2_mynode, 2) ].next== -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 24 - mcs.pml:40 - [isTail = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_2_isTail);
		((P0 *)this)->_2_2_isTail = 0;
#ifdef VAR_RANGES
		logval("mcs:isTail", ((int)((P0 *)this)->_2_2_isTail));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 25 - mcs.pml:42 - [((tail==mynode))] (39:0:2 - 1) */
		IfNotBlocked
		reached[0][25] = 1;
		if (!((now.tail==((P0 *)this)->_2_2_mynode)))
			continue;
		/* merge: tail = -(1)(39, 26, 39) */
		reached[0][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.tail;
		now.tail =  -(1);
#ifdef VAR_RANGES
		logval("tail", now.tail);
#endif
		;
		/* merge: isTail = 1(39, 27, 39) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_2_isTail);
		((P0 *)this)->_2_2_isTail = 1;
#ifdef VAR_RANGES
		logval("mcs:isTail", ((int)((P0 *)this)->_2_2_isTail));
#endif
		;
		/* merge: .(goto)(39, 31, 39) */
		reached[0][31] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 21: /* STATE 31 - mcs.pml:48 - [.(goto)] (0:39:0 - 2) */
		IfNotBlocked
		reached[0][31] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 29 - mcs.pml:46 - [(1)] (39:0:0 - 1) */
		IfNotBlocked
		reached[0][29] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(39, 31, 39) */
		reached[0][31] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 23: /* STATE 33 - mcs.pml:50 - [((isTail==1))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][33] = 1;
		if (!((((int)((P0 *)this)->_2_2_isTail)==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _2_2_isTail */  (trpt+1)->bup.oval = ((P0 *)this)->_2_2_isTail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_2_isTail = 0;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 34 - mcs.pml:51 - [(1)] (50:0:1 - 1) */
		IfNotBlocked
		reached[0][34] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(50, 40, 50) */
		reached[0][40] = 1;
		;
		/* merge: .(goto)(50, 45, 50) */
		reached[0][45] = 1;
		;
		/* merge: count = (count+1)(50, 47, 50) */
		reached[0][47] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->count;
		((P0 *)this)->count = (((P0 *)this)->count+1);
#ifdef VAR_RANGES
		logval("mcs:count", ((P0 *)this)->count);
#endif
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[0][51] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 25: /* STATE 36 - mcs.pml:53 - [((node[mynode].next!=-(1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!((now.node[ Index(((P0 *)this)->_2_2_mynode, 2) ].next!= -(1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 37 - mcs.pml:55 - [w = node[mynode].next] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_2_w;
		((P0 *)this)->_2_2_w = now.node[ Index(((P0 *)this)->_2_2_mynode, 2) ].next;
#ifdef VAR_RANGES
		logval("mcs:w", ((P0 *)this)->_2_2_w);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 38 - mcs.pml:55 - [node[w].waiting = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][38] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting;
		now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting = 0;
#ifdef VAR_RANGES
		logval("node[mcs:w].waiting", now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 42 - mcs.pml:58 - [w = node[mynode].next] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][42] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->_2_2_w;
		((P0 *)this)->_2_2_w = now.node[ Index(((P0 *)this)->_2_2_mynode, 2) ].next;
#ifdef VAR_RANGES
		logval("mcs:w", ((P0 *)this)->_2_2_w);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 43 - mcs.pml:59 - [node[w].waiting = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][43] = 1;
		(trpt+1)->bup.oval = now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting;
		now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting = 0;
#ifdef VAR_RANGES
		logval("node[mcs:w].waiting", now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 47 - mcs.pml:73 - [count = (count+1)] (0:50:1 - 5) */
		IfNotBlocked
		reached[0][47] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->count;
		((P0 *)this)->count = (((P0 *)this)->count+1);
#ifdef VAR_RANGES
		logval("mcs:count", ((P0 *)this)->count);
#endif
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[0][51] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 31: /* STATE 53 - mcs.pml:76 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][53] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

