"tmp.cpp"
"By chyx111 "
"/home/chyx/.vim/acm/scan-and-append.dat"
"ll"
["typedef long long ll;"]
"u64"
["typedef long long unsigned u64;"]
"u32"
["typedef long unsigned u32;"]
"checkMax("
["template<class T> void inline checkMax(T& a, T b)", "{", "\tif(a < b){", "\t\ta = b;", "\t}", "};"]
"checkMin("
["template<class T> void inline checkMin(T& a, T b)", "{", "\tif(b < a){", "\t\ta = b;", "\t}", "};"]
"REP("
["#define REP(i,n) for(int n_##__LINE__ = (n), i = 0; i< n_##__LINE__; ++i)"]
"FORI("
["#define FORI(it,v) for(__typeof__((v).begin()) it = (v).begin(); it != (v).end(); ++it)"]
"FORE("
["#define FORE(elem,v)\\", "\tfor(__typeof__(v.begin()) _it = v.begin(); _it != v.end(); ++_it)\\", "for(int _once=1, _done=0; _once; (!_done) ? (_it=v.end(), --_it) : _it )\\", "for(__typeof__(*_it) & elem = * _it; _once && !(_once=0); _done=1)"]
"FORPAIR"
["#define FORPAIR(a, b, v)\\", "\tfor(__typeof__(v.begin()) _it = v.begin(); _it != v.end(); ++_it)\\", "for(bool _once1 = true, _once2 = true, _done = false; _once1 && _once2; (!_done) ? (_it=v.end(), --_it) : _it )\\", "for(__typeof__(_it->first) & a = _it->first; _once1 && !(_once1 = false); )\\", "for(__typeof__(_it->second) & b = _it->second; _once2 && !(_once2 = false); _done = true)"]
"TWO("
["#define TWO(x) (1 << (x))"]
"TWOLL("
["#define TWOLL(x) (1LL << (x))"]
"DBG("
["#define DBG(a) do{cerr << #a << \": \" << (a) << endl}while(0)"]
"ALL("
["#define ALL(a) (a).begin(), (a).end()"]
"SZ("
["#define SZ(a) ((int)(a).size())"]
"_getint("
["inline int _getint(int n = 0)", "{", "\tchar c;", "\tfor(c = getchar();!isdigit(c);c = getchar());", "\tfor(;isdigit(c);c = getchar()){", "\t\tn = (n << 3) + (n << 1) + c - '0';", "\t}", "\treturn n;", "}"]
"tmp.cpp"
"By chyx111 "
"/home/chyx/.vim/acm/scan-and-append.dat"
"ll"
["typedef long long ll;"]
"u64"
["typedef long long unsigned u64;"]
"u32"
["typedef long unsigned u32;"]
"checkMax("
["template<class T> void inline checkMax(T& a, T b)", "{", "\tif(a < b){", "\t\ta = b;", "\t}", "};"]
"checkMin("
["template<class T> void inline checkMin(T& a, T b)", "{", "\tif(b < a){", "\t\ta = b;", "\t}", "};"]
"REP("
["#define REP(i,n) for(int n_##__LINE__ = (n), i = 0; i< n_##__LINE__; ++i)"]
"FORI("
["#define FORI(it,v) for(__typeof__((v).begin()) it = (v).begin(); it != (v).end(); ++it)"]
"FORE("
["#define FORE(elem,v)\\", "\tfor(__typeof__(v.begin()) _it = v.begin(); _it != v.end(); ++_it)\\", "for(int _once=1, _done=0; _once; (!_done) ? (_it=v.end(), --_it) : _it )\\", "for(__typeof__(*_it) & elem = * _it; _once && !(_once=0); _done=1)"]
"FORPAIR"
["#define FORPAIR(a, b, v)\\", "\tfor(__typeof__(v.begin()) _it = v.begin(); _it != v.end(); ++_it)\\", "for(bool _once1 = true, _once2 = true, _done = false; _once1 && _once2; (!_done) ? (_it=v.end(), --_it) : _it )\\", "for(__typeof__(_it->first) & a = _it->first; _once1 && !(_once1 = false); )\\", "for(__typeof__(_it->second) & b = _it->second; _once2 && !(_once2 = false); _done = true)"]
"TWO("
["#define TWO(x) (1 << (x))"]
"TWOLL("
["#define TWOLL(x) (1LL << (x))"]
"DBG("
["#define DBG(a) do{cerr << #a << \": \" << (a) << endl}while(0)"]
"ALL("
["#define ALL(a) (a).begin(), (a).end()"]
"SZ("
["#define SZ(a) ((int)(a).size())"]
"_getint("
["inline int _getint(int n = 0)", "{", "\tchar c;", "\tfor(c = getchar();!isdigit(c);c = getchar());", "\tfor(;isdigit(c);c = getchar()){", "\t\tn = (n << 3) + (n << 1) + c - '0';", "\t}", "\treturn n;", "}"]
