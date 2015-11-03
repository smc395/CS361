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

		 /* PROC ticketlock */

	case 5: /* STATE 2 */
		;
		now.ticket = trpt->bup.ovals[1];
		((P0 *)this)->myticket = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 7: /* STATE 5 */
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: /* STATE 7 */
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 10: /* STATE 8 */
		;
		now.serving = trpt->bup.oval;
		;
		goto R999;

	case 11: /* STATE 12 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

