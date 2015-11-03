	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM never_0 */
;
		
	case 3: /* STATE 1 */
		goto R999;

	case 4: /* STATE 10 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC mcs */
;
		;
		
	case 6: /* STATE 2 */
		;
		((P0 *)this)->_2_1_mynode = trpt->bup.oval;
		;
		goto R999;

	case 7: /* STATE 3 */
		;
		now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].next = trpt->bup.oval;
		;
		goto R999;

	case 8: /* STATE 4 */
		;
		((P0 *)this)->_2_1_pred = trpt->bup.oval;
		;
		goto R999;

	case 9: /* STATE 8 */
		;
		((P0 *)this)->_2_1_pred = trpt->bup.ovals[3];
		now.tail = trpt->bup.ovals[2];
		((P0 *)this)->_2_1_1_temp = trpt->bup.ovals[1];
		((P0 *)this)->_2_1_1_temp = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		;
		
	case 11: /* STATE 11 */
		;
		now.node[ Index(((P0 *)this)->_2_1_mynode, 2) ].waiting = trpt->bup.oval;
		;
		goto R999;

	case 12: /* STATE 12 */
		;
		now.node[ Index(((P0 *)this)->_2_1_pred, 2) ].next = trpt->bup.oval;
		;
		goto R999;

	case 13: /* STATE 13 */
		;
	/* 0 */	((P0 *)this)->_2_1_mynode = trpt->bup.oval;
		;
		;
		goto R999;

	case 14: /* STATE 19 */
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 16: /* STATE 21 */
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 17: /* STATE 22 */
		;
		((P0 *)this)->_2_2_mynode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 19: /* STATE 24 */
		;
		((P0 *)this)->_2_2_isTail = trpt->bup.oval;
		;
		goto R999;

	case 20: /* STATE 27 */
		;
		((P0 *)this)->_2_2_isTail = trpt->bup.ovals[1];
		now.tail = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 21: /* STATE 31 */
		goto R999;
;
		
	case 22: /* STATE 29 */
		goto R999;

	case 23: /* STATE 33 */
		;
	/* 0 */	((P0 *)this)->_2_2_isTail = trpt->bup.oval;
		;
		;
		goto R999;

	case 24: /* STATE 47 */
		;
		((P0 *)this)->count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 26: /* STATE 37 */
		;
		((P0 *)this)->_2_2_w = trpt->bup.oval;
		;
		goto R999;

	case 27: /* STATE 38 */
		;
		now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting = trpt->bup.oval;
		;
		goto R999;

	case 28: /* STATE 42 */
		;
		((P0 *)this)->_2_2_w = trpt->bup.oval;
		;
		goto R999;

	case 29: /* STATE 43 */
		;
		now.node[ Index(((P0 *)this)->_2_2_w, 2) ].waiting = trpt->bup.oval;
		;
		goto R999;

	case 30: /* STATE 47 */
		;
		((P0 *)this)->count = trpt->bup.oval;
		;
		goto R999;

	case 31: /* STATE 53 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

