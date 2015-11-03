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
	case 3: /* STATE 1 - ticket.pml.nvr:5 - [((critical>1))] (6:0:0 - 1) */
		
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
	case 4: /* STATE 10 - ticket.pml.nvr:10 - [-end-] (0:0:0 - 1) */
		
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

		 /* PROC ticketlock */
	case 5: /* STATE 1 - ticket.pml:14 - [myticket = ticket] (0:4:2 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->myticket;
		((P0 *)this)->myticket = now.ticket;
#ifdef VAR_RANGES
		logval("ticketlock:myticket", ((P0 *)this)->myticket);
#endif
		;
		/* merge: ticket = (ticket+1)(4, 2, 4) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = now.ticket;
		now.ticket = (now.ticket+1);
#ifdef VAR_RANGES
		logval("ticket", now.ticket);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 6: /* STATE 4 - ticket.pml:17 - [((myticket==serving))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][4] = 1;
		if (!((((P0 *)this)->myticket==now.serving)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 5 - ticket.pml:18 - [critical = (critical+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = now.critical;
		now.critical = (now.critical+1);
#ifdef VAR_RANGES
		logval("critical", now.critical);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 6 - ticket.pml:20 - [assert((critical<=1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][6] = 1;
		spin_assert((now.critical<=1), "(critical<=1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 7 - ticket.pml:21 - [critical = (critical-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = now.critical;
		now.critical = (now.critical-1);
#ifdef VAR_RANGES
		logval("critical", now.critical);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 8 - ticket.pml:22 - [serving = (myticket+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.serving;
		now.serving = (((P0 *)this)->myticket+1);
#ifdef VAR_RANGES
		logval("serving", now.serving);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 12 - ticket.pml:24 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][12] = 1;
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

