lexer grammar vrlexer;

// ============================================ 

// write your rule in order

// ============================================

// R1 : (a+b+c)* abc
R1: [abc]* 'abc';

// R2:  ( (a)^+ + b(a)*c)^+
R2: ('a'+ | 'b' 'a'* 'c')+;

// R3:  ((a+b)*(cbb)^+)^+
R3: ([ab]* 'cbb'+)+;

// R4:  ((b+c)* a (b+c)*a)^+
R4: ([bc]* 'a' [bc]* 'a')+;

// ============================================ 

// for silent skip uncomment it

// ============================================

//  UNKNOWN : . -> skip ;
// UNKNOWN : . { System.out.println("Warning: Skipping invalid character '" + getText() + "'"); } -> skip ;

UNKNOWN : . ;