function muoff_ans = muoff(a,par)
muoff_ans = fminsearch(@(x) chisqoff(x,par), 0);