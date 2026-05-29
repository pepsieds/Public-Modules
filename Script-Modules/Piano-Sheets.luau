local module = {}

module['Moonlight Sonata 3rd Movement'] = function()
	local SHEET = [====[
!%[*%]0[!W]*[%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]O[%S]f[!*fHOS] [%fHOS] 
1%[%8]([1W]8[(%]W[1t]([%W]t[1Y]W[%t]Y
[1O]t[%Y]O[1s]Y[%O]s[1D]O[%s]D[18DHOs] [%DHOs] 
7*[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS] 
6*[6Q]e[6T]T[6I]p[6S]S[6G]j[6GLS] [6GLS] 
6*[06]w[6T]T[6u]o[6S]S[6f]h[6hLS] [6hLS] 
[%Hls] [OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[Ot]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h
[HOtW]-[%W]----
!%[*%]0[!W]*[%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]f[%H]L[!*fx] [%fx] 
^0[*w]T[^u]w[*T]u[^o]T[*u]o[^S]u[*o]S
[^f]o[*S]f[^h]S[*f]h[^L]f[*h]L[^fx] [*fx] 
5([(E]T[5Y]E[(T]Y[5P]T[(Y]P[5S]Y[(P]S
[5D]P[(S]D[5J]S[(D]J[5L]J[(D]S[5J]D[(S]P
[%a](7([%D](7(%(7([%a](7[(O]
[^o]O(P[*O]([^o](*(^([*o]([^D](*[(o]
[7P](7([7O](7(7([7O]([7D](7[(O]
[5a](5([5P](5(5([5P]([5D](5[(P]
[%a]([7DZ](%([7DZ](%([7DZ]([%ak]([7HO](
[^HO]([*ho](^([*ho](^([*ho]([^DZ]([*ho](
[7JP]([7HO](7([7HO](7([7HO]([7DZ]([7HO](
[5ak]([5JP](5([5JP](5([5JP]([5DZ]([5JP](
[$ls](%($(%([3LS]*%*3*%*
[3JP]k*Jk$JH*J[@ak]7$7@7$7@7$7
[2HO]7372737[!jp]636!636
[!ho]H^hH@hg^h[7HO]%@%7%@%7%@%
[!*36fjpS]----fGHjkLk
[jpTu]fGHjkLk[jpTu]fGHjkLk
[jpTu]fGH[jpTu]kLz[pTux]ZxZ[pTux]Lkj
[HY]aOaYaOa[JY]kSJkoJkSJkYJkSJkoJHSJ
[aHOu]-[!*36epTu]--uIOpaSa
puIO[*0ep]aSapuIO[*0ep]aSa
pu[*0eI]Opa[*0eS]apu[*0eI]Opa[*0eS]a
[*0ep]uIOpaSdfGHjkLzZ
[*fx]e0e*e0e[9HO]rqr9rqr
[(ak]rWr(rWr[@oTw](9(9(9(
[%OrW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY] 
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY] 
[%aDW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY] 
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY] 
[%aD] [aDrW] [aDrW] [aOrY] * [fSTW] [fSTW] [OSTu] 
( [aDrW] [aDrW] [aOrY] ( [DEPw] [DEPw] [EoPY] 
[%aO] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO] 
[(@*hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS] 
[%aHk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO] 
[(@*hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS] 
[%aHkW] [HkrY] [HkrY] [krWZ] * [HLTu] [HLTu] [LTWx] 
( [HkrY] [HkrY] [krWZ] * [EhJY] [EhJY] [EJwZ] 
7 [DkOY] [DkOY] [HrYZ] * [jpSu] [jpSu] [fLTu] 
( [aHOY] [aHOY] [DkrY] ( [hoPT] [hoPT] [EJST] 
[%aH]W(W%W(W%W(W[%a]W([OW]
[%o]E(E[%DoT]E(E[%DoT]E(E[%DoT]E(E
[%r]OWD(W%W(W%W(W[%k]W([HW]
[%h]E(E[%hSZ]E(E[%hSZ]E(E[%hSZ]E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW]
[%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ]
[!0TuW]%[*%]0[!W]*[%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]O[%S]f[!*fHOS] [%fHOS] 
1%[%8]([1W]8[(%]W[1t]([%W]t[1Y]W[%t]Y
[1O]t[%Y]O[1s]Y[%O]s[1D]O[%s]D[18DHOs] [%DHOs] 
7*[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS] 
6*[6Q]e[6T]T[6I]p[6S]S[6G]j[6GLS] [6GLS] 
6*[06]w[6T]T[6u]o[6S]S[6f]h[6hLS] [6hLS] 
[%Hls] [OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[Ot]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h
[HOtW]-[%W]----
!%[*%]0[!W]*[%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]f[%H]L[!*fx] [%fx] 
^0[*w]T[^u]w[*T]u[^o]T[*u]o[^S]u[*o]S
[^f]o[*S]f[^h]S[*f]h[^L]f[*h]L[^fx] [*fx] 
5([(E]T[5Y]E[(T]Y[5P]T[(Y]P[5S]Y[(P]S
[5D]P[(S]D[5J]S[(D]J[5L]J[(D]S[5J]D[(S]P
[%a](7([%D](7(%(7([%a](7[(O]
[^o]O(P[*O]([^o](*(^([*o]([^D](*[(o]
[7P](7([7O](7(7([7O]([7D](7[(O]
[5a](5([5P](5(5([5P]([5D](5[(P]
[%a]([7DZ](%([7DZ](%([7DZ]([%ak]([7HO](
[^HO]([*ho](^([*ho](^([*ho]([^DZ]([*ho](
[7JP]([7HO](7([7HO](7([7HO]([7DZ]([7HO](
[5ak]([5JP](5([5JP](5([5JP]([5DZ]([5JP](
[$ls](%($(%([3LS]*%*3*%*
[3JP]k*Jk$JH*J[@ak]7$7@7$7@7$7
[2HO]7372737[!jp]636!636
[!ho]H^hH@hg^h[7HO]%@%7%@%7%@%
[!*36fjpS]----fGHjkLk
[jpTu]fGHjkLk[jpTu]fGHjkLk
[jpTu]fGH[jpTu]kLz[pTux]ZxZ[pTux]Lkj
[HY]aOaYaOa[JY]kSJkoJkSJkYJkSJkoJHSJ
[aHOu]-[!*36epTu]--uIOpaSa
puIO[*0ep]aSapuIO[*0ep]aSa
pu[*0eI]Opa[*0eS]apu[*0eI]Opa[*0eS]a
[*0ep]uIOpaSdfGHjkLzZ
[*fx]e0e*e0e[9HO]rqr9rqr
[(ak]rWr(rWr[@oTw](9(9(9(
[%OrW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY] 
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY] 
[%aDW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY] 
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY] 
[%aD] [aDrW] [aDrW] [aOrY] * [fSTW] [fSTW] [OSTu] 
( [aDrW] [aDrW] [aOrY] ( [DEPw] [DEPw] [EoPY] 
[%aO] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO] 
[(@*hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS] 
[%aHk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO] 
[(@*hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS] 
[%aHkW] [HkrY] [HkrY] [krWZ] * [HLTu] [HLTu] [LTWx] 
( [HkrY] [HkrY] [krWZ] * [EhJY] [EhJY] [EJwZ] 
7 [DkOY] [DkOY] [HrYZ] * [jpSu] [jpSu] [fLTu] 
( [aHOY] [aHOY] [DkrY] ( [hoPT] [hoPT] [EJST] 
[%aH]W(W%W(W%W(W[%a]W([OW]
[%o]E(E[%DoT]E(E[%DoT]E(E[%DoT]E(E
[%r]OWD(W%W(W%W(W[%k]W([HW]
[%h]E(E[%hSZ]E(E[%hSZ]E(E[%hSZ]E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW]
[%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ]
[!iqTW]*[%q]W[!T]q[%W]T[!i]W[%T]i[!O]T[%i]O
[!S]i[%O]S[!g]O[%S]g[!H]S[%g]H[!*gHLS] [%gHLS] 
7*[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS] 
6*[6Q]e[6T]T[6I]p[6S]S[6G]j[6GjLS] [6GjLS] 
4*[4W]r[4T]T[4O]a[4S]S[4H]k[4HkLS] [4HkLS] 
[$GjLS]TeT[QS]TeTQTeT[pQ]Te[IT]
[iW]ITO[Ir]T[iW]TrTWT[ir]T[SW]Tr[iT]
[eO]TeT[eI]TeTeT[eI]T[eS]Te[IT]
[pq]TqT[Oq]TqTqT[Oq]T[qS]Tq[OT]
[pQ]SpS[IT]SpSISpS[eI]Sp[QS]
[OQ]SaS[Oq]SaSOS[aq]S[OT]Sa[qS]
[IW]SpS[IQ]SpSIS[pQ]S[IT]Sp[QS]
[IQ]d[pQ]d[Iy]dp[dQ][pQ]d[Qs]d[py]ds[dQ]
[ow]dad[9o]dadodad[7o]da[5d]
[5p]dsd[$p]dsdpd[$s]d[9p]ds[$d]
[6o]dad[5o]dadod[5a]d[9o]da[5d]
[$O]dad[4O]SaSOS[4a]S[*O]Sa[4S]
[$I]S[$p]S[6I]S[$p]S[2I]G[2p]G[$I]G[2p]G
[1I]G[DO]GIG[DO]GIG[1DO]G[@I]G[1DO]G
[!u]f[!S]f[3u]f[!S]f[6u]f[6S]f[!u]f[6S]f
[$Y]D[$S]D[6Y]D[$S]D[5Y]D[5S]D[^Y]D[5S]D
[%DsY]%%%[%O]%%%%%%%[%p]%[%O]%
[%eIT]%%%[%O]%[%I]%[%ruW]%%%[%I]%[%u]%
[%eQY]%%%[%u]%[%Y]%[%0TW]%%%[%Y]%[%T]%
[(%Qt]%%%%%%%[*%0T]%%%%%%%
[%8][%W][%Y]%[%H]%%%%%[%H]%[%j]%[%H]%
[%G]%[%GpS]%[%aDH]%[%GpS]%[%afO]%[%afO]%[%GpS]%[%afO]%
[%DIp]%[%DIp]%[%afO]%[%DIp]%[%OSu]%[%OSu]%[%DIp]%[%OSu]%
[%IsY]%%%%%%%[%STu]%%%%%%%
[%t]I%D%%%%%%%%%%[%STu]%%%
[%IsY]%%%[%IsY]%%%[%STu]%%%[%STu]%%%
[%t]I%D%%%%%%%%%%[%Tu]%[%S]%
[%IY]%[%s]%[%IY]%[%s]%[%Tu]%[%S]%[%Tu]%[%S]%
[%It]%[%D]%[%It]%[%D]%[6Tu]6[6S]6[6Tu]6[6S]6
[$epTY]----
[%OtWY]----
!%[*%]0[!W]*[%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]O[%S]f[!*fHOS] [%fHOS] 
1%[%8]([1W]8[(%]W[1t]([%W]t[1Y]W[%t]Y
[1O]t[%Y]O[1s]Y[%O]s[1D]O[%s]D[18DHOs] [%DHOs] 
7*[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS] 
6*[6Q]e[6T]T[6I]p[6S]S[6G]j[6GLS] [6GLS] 
6*[06]w[6T]T[6u]o[6S]S[6f]h[6hLS] [6hLS] 
[%Hls] [OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[Ot]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h
[HOtW]-[%W]----
*W0W[*O]W0W*W0W[*u]W0[TW]
[(t]TWY[QT]W[(t]WQW(W[Qt]W[(O]WQ[tW]
[0Y]W0W[0T]W0W0W[0T]W[0O]W0[TW]
[8u]W8W[8Y]W8W8W[8Y]W[8O]W8[WY]
[*u]W[0HO]W*W[0HO]W*W[0HO]W[*fu]W[0ST]W
[(ST]W[Qst]W(W[Qst]W(W[Qst]W[(HO]W[Qst]W
[0DY]W[0ST]W0W[0ST]W0W[0ST]W[0HO]W[0ST]W
[8fu]W[8DY]W8W[8DY]W8W[8DY]W[8HO]W[8DY]W
[7gi]W*W7W*W[6GI]Q*Q6Q*Q
[6DY]fQDf7DSQD[%fu]070%070%070
[5ST]0605060[$dy]969$969
[$st]S(sS%sP(s[3ST]*%*3*%*3*%*
[$69dIpQy]----paSdfGf
[deQy]paSdfGf[deQy]paSdfGf
[deQy]paS[deQy]fGh[ejQy]Hkj[ehQy]Gfd
[SW]uTuWuTu[DW]fIDftDfIDfWDfIDftDSID
[eSTu]-[$269eQy]--erTyuIu
yerT[$69y]uIuyerT[$69y]uIu
ye[$69r]Tyu[$69I]opa[$69S]dfG[$69h]H
[$jp]969$969[5ST]0^050^0
[%fu]0*0%0*0[%8Qt]%5%5%5%
[!*0T] [*uW] [*uW] [*uW] [*uW] [*uW] [(WY] [0TW] 
[%QtW] [OQtW] [OQtW] [OQtW] [OQtW] [OQtW] [0OTW] [(OWY] 
[!*Ou] [*uW] [*uW] [*uW] [*uW] [*uW] [(WY] [0TW] 
[%QtW] [OQtW] [OQtW] [OQtW] [OQtW] [OQtW] [0OTW] [(OWY] 
[!*Ou] [*0Ou] [*0Ou] [0TuW] $ [*IpQ] [*IpQ] [eIQT] 
% [*0Ou] [*0Ou] [0TuW] % [(8OY] [(8OY] [(tWY] 
[!*Tu] [*fOuW] [*fOuW] [*fOuW] [*fOuW] [*fOuW] [(DIWY] [0STuW] 
[%QstWY] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [fLSuW] [DGWYZ] 
[!*fHx] [*fOuW] [*fOuW] [*fOuW] [*fOuW] [*fOuW] [(DIWY] [0STuW] 
[%QstWY] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [fLSuW] [DGWYZ] 
[!*fHx] [HLTu] [HLTu] [fHOu] Q [IjLT] [IjLT] [GIjp] 
W [fHTu] [fHTu] [fOSu] Q [DHtY] [DHtY] [DOsY] 
0 [HSTW] [HSTW] [fOTu] $ [eGpQ] [eGpQ] [deIy] 
% [0fOW] [0fOW] [STuW] % [(DIQ] [(DIQ] [QstY] 
[!Su]*%*!*%*!*%*[!u]*%[*T]
[!t](%([!OQt](%([!OQt](%([!OQt](%(
[!0]T*O%*!*%*!*%*[!f]*%[*S]
[!s](%([!HIs](%([!HIs](%([!HIs](%(
[!u]S*H%*!*%*[!I]s(H%(!(%(
[!u]S*H%*!*%*[!I]s(H%(!(%(
[!0][*T][%W][*T][!0][*T][%W][*T][!0][*T][%W][*T][!0][*T][%W][*T]
[*7q][7T][!W][7T][*7q][7T][!W][7T][*7q][7T][!W][7T][*7q][7T][!W][7T]
[*6eQT]*[$Q]e[6T]Q[$e]T[6I]e[$T]I[6p]T[$I]p
[6S]I[$p]S[6G]p[$S]G[6j]S[$G]j[6GjLS] [$GjLS] 
%*[03]W[%T]0[3W]T[%u]W[3T]u[%O]T[3u]O
[%S]u[3O]S[%f]O[3S]f[%H]S[3f]H[%fHLS] [3fHLS] 
5 *0wET 5^!35 TuoPS 5^*0
w SfhJ[ELTuw]----
$ 68(Qe $61@$ etYIp $68(
QpsD[ejQtY]----
*OuO[TW]OuOTOuO[0T]Ou[*O]
[*Y]OIO[8Y]OIOYO[8I]O[WY]OI[8O]
[(T]OuO[*T]OuOTO[*u]O[TW]Ou[*O]
[0t]OIO[(t]OIOtO[(I]O[tW]OI[(O]
[0OTu]W0W[0HO]W0W0W0W[0fu]W0[STW]
[QST]WQW[Qst]WQWQW[Qst]W[HOQ]WQ[stW]
[0DY]W0W[0ST]W0W0W[0ST]W[0HO]W0[STW]
[8fu]W8W[8DY]W8W8W[8DY]W[8HO]W8[DWY]
[*GI]W[*fu]W[*LS]W[*fu]W[7GI]*[7gi]*[7LS]*[7gi]*
[6HO]*[6GI]*[6LS]*[6GI]*[4jp]*[4HO]*[4LS]*[4HO]*
[!$j]GSpITpITeQ*
eQ*6*QeTIpSGjGSp
[$2j]GdpIypIyeQ9
eQ969QeyIpdGjGdp
[!5L]JhfSPfSPouTE
uTEw0*0wETuoPSfhJLJf
[!%x]LHfSOfSOuSOu
TOuTWuTW0TW0*W0*
%6^78*9(0qQwWeEr
tTyYuiIoOpPasSdDfgGhH
[IjtW]kjkjkjkjkjkjkjkjkjkjkjkjkjkjkjk
H G f D G S s D 
p O I p u Y I T 
t Y e W Q e 0 ( 
Q * 8 (-6-%-
[5]----
[%]----
[!*]*%*!*%*!*%*[!u]*
%[*T][!t](%([!OQt](%([!OQt](%([!OQt](
%([!0]T*O%*!*%*!*%*[!f]*
%[*S][!s](%([!HIs](%([!HIs](%([!HIs](
%([!u]S*H%*!*%*[!I]s(H%(!(
%([!u]S*H%*!*%*[!I]s(H%(!(
%([!*%Y]SH[0u][OW][ST][fu][OW][ST][fu][HO][ST][fu][HO][LS][fu]
[HO][LS][fx][LS][HO][fu][LS][HO][fu][ST][HO][fu][ST][OW][fu][ST]
[OW][0u][ST][OW][0u][*T][OW][0u][*T][%W][0u][*T][%W][03][*T][%W]
[03][%W][!*]--[!*%3fHLS]--
[!*%3OSTu]
]====]
	return SHEET
end

module['Piano Man'] = function()
	local SHEET = [[
[8u]-
t u o s [8i]-t 
i s i [8o]-t o s 
o [pq]-[0o]-[9o]-[8o]--
o-[7o]-i--
u [6i] u t--5--
t-[4t]-t--
t [3t]-t y--
[29y]----r5--
o o [8o]-o--
7--i u [6i] 
u t--5--
e e [4e]--i 
i [5i]-u-t-[8t]-
t u o s [8i]-t i 
s i [8o]-t o s o [pq]-
0 o [9o]-[8o]-o-
o-[7o]-i-u-
[6i] u t--5--
t-[4t]-t-
t-[3t]--y y [2y]-
$-9-[5r]--
u i [8o]-o--
o [7o]--i u [6i]-
u-u-[5u]--
t-[4t]-t--u [5i]--
u t-[8t]----
u-o-s-
[ep]--p-[pw]--
a s [aQ]-p--
q----e--
p-[pw]--
a s [aQ]----
9-0-[$pQ]-[ow]-
a-d-[dq]-d-
d-[0f]-f-f-[9g]-
g-g-8h-h--
h [7h]-g--f 
[6g] f s--5----
[4p]-s--
s [3s]--d-[29d]-
$-9-5-f-
g-[8h]-h--
h [7h]-g--g [6g] f 
s--5--
o-[4p]-s-s-[5g]-
f-s-[8s]----
8-t i s i 
[8o]-t o s o [pq]-
[0o]-[9o]-[8o]--
o-[7o]-i--u [6i] 
u t--5--
t-[4t]-t--
t [3t]-t y--[29ey]----
[5r]--
o o [8o]-o--7--
i u i6 u t--
5--e e 
[4e]--i i [5i]-
u-t-[8t]-t u 
o s [8i]-t i s i o8-
t o s o [pq]-0 
o [9o]-[8o]-o-o-
[7o]-i-u-[6i] u 
t--5--
t-[4t]-t-t-[3t]--
y y [2y]-$-
9-[5r]--u i 
[8o]-o--o [7o]--
i u [6i]-u-
u-[5u]--t-t4-
t--u [5i]--
u t-[8t]----
u-o-s-[ep]--
p-5[pw]--
a s [aQ]-p--q----
e--
p-[5pw]--a s 
[aQ]----9-
0-[pQ]-[5ow]-a-
d-[dq]-d-d-[0f]-
f-f-[9g]-g-
g-[8h]-h--
h [7h]-g--f [6g] f 
s--5----
[4p]-s--s [3s]--
[dr]-d[29]-$-
9-5-f-g-
[8h]-h--h [7h]-
g--g [6g] f s--
5--o-p4-
s-s-[5g]-f-
s-[8s]----
8-t i s i [8o]-
t o s o [pq]-[0o]-
[9o]-[8o]-t u o s [8i]-
t i s i 8o-t 
o s o [pq]-[0o]-[9i]-
[8u]----
]]
	
	return SHEET
end

module['Drowning Love'] = function()
	local SHEET = [[
^qEtTO%WtTtW$WtT
tW!*tTYO^qEtTO%W
tTtW$WtTtW!*tTYO
EiPsSHWOsSsOQOsS
sO*TsSDHEiPsSHWO
sSsOQOsSsO*TsSDH
^qEtTO%WtTtW$WtT
GW!*tTYO[^iTW]qE[cgHLt]TO%W
tTtW$WtTtW!*tT*Q
[cE]lJiPsSHWOsSsOQOsS
sO*TsSDHEiPsSHWO
sSsOQOsSsO*TsSDH
[$iTW]
[iTW]*[iTW]$[TWY]
[*iTW] [$TWY]
[$iTW]-[$TW]
*[tW]-[*LTW]Jg-[4qt]TYOYT[HJtZ]T
YOYT[4qt]TYOYT[4P]YTtTY
[$iTW]
[iTW]*[iTW]$[TWY]
[*iTW] [$TWY]
[$iTW]-[$TW]
*[tW]-[*LTW]Jg-[4qt]TYOYT[HJtZ]T
YOYT[4qt]TYOYT[4P]YTtTY
[gOQS]
[gOS]T[gOS]Q[DOS]
[gOST] [DOQS]
[gOQS]-[OQS]
T[Os]-[cOST]LH-[4qs]SDHDS[HJsZ]S
DHDS[4qs]SD[Hl]DS[iJ]DSsSD
[gOQS]
[gOS]T[gOS]Q[DOS]
[gOST] [DOQS]
[gOQS]-[OQS]
T[Os]-[cOST]LH-[4qs]SDHDS[HJsZ]S
DHDS[4qs]SD[Hl]DS[iJ]DSsSD
[gOQS]
[gOS]T[gOS]Q[DOS]
[gOST] [DOQS]
[gOQS]-[OQS]
T[Os]-[cOST]LH-[4qs]SDHDS[HJsZ]S
DHDS[4qs]SD[Hl]DS[4Js]DS[4H]SD
[cE]lJiPsSHWOsSsOQOsS
sO*TsSDH[cE]lJiPsSHWO
sSsOQOsSsO*TsSDH
^qE[git]TO%Wt[HOT]tW$Wt[HOT]
tW!*t[HOT]YO^qE[git]TO%W
t[HOT]tW[$]----
[DT]Pis-PsS-W-
DSis-Ps[GY]--
[%D]SPis-PsS-q-
DSis-PsO Dgs-
[^D]Pis-PsS-q-
lgDs-Ps[gO]--
[%D]SPis-Ps[Oq]-- D
s-Ps----
[*Q]WT[fGkY]uO[7a]Ou[3S]Ou[6D]aO[3f]
[3a]O[%G]aO[@H]aO[*]WT[fGkY]uO[7a]O
u[3S]Ou[6D]aO[3f][3a]O[%G]aO[@D]aO
[!*]D[%f]k[!f]a[7]a[$f]H[7f]a[6j]f[3a]H
[6f]a[3G]D[7a]H[3D]a[!*Z]k[%H]x[!k]H[7C]k
[$H]V[7k]H[6x]k[3f]x[6k]f[3x]k[7f]x[3k]f
[!*]W[%T]Y[!u]a[7]W[$Y]u[7Y]r[6]0[3Y]u
[6Y]r[3]u[7Y]u[3O]a[!*]W[%T]Y[!u]a[7]W
[6Y]u[7Y]r[6]e[3Y]u[6Y]r[03]u[7Y]u[0O]a
[!*]O[%S]D[!f]k[7]O[$D]f[7D]a[6]u[3D]f
[6D]a[03]u[7D]f[0H]k[!*]O[%S]D[!f]k[7a]H
[$Z]x[7Z]k[6fGHS]----
]]
	return SHEET
end

return module
