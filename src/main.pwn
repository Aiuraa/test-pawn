
#include <a_samp>
#include <YSI_Data\y_foreach>

// Capping the junk size to 10k, going little further than this will cause "disk full" error
// causing your entire disk being eaten by compiler (i guess)
#define JUNK_SIZE 10_000

// Having 1000 MAX_PLAYERS on single iterator is not good either, since foreach need to allocate some size
// depending on how many players the code can possibly handle. This is why i said the lower the better but
// if your average playerbases is 1000, you have no choice then.
new Iterator: IterX<MAX_PLAYERS>;

// Having 1 dimensional array with 10k size is no good either, more than one dimensional is consider to be
// worst, imagine having this in many different places (see junkfunc)
new S3MP4K[JUNK_SIZE];

main()
{
    print("Hello World");

    Iter_Add(IterX, 10);

    format(S3MP4K, JUNK_SIZE, "Hello World");
    print(S3MP4K);

    for (new i = 1; i < 5; i ++)
    {
        format(S3MP4K, JUNK_SIZE, "func%d", i);
        CallLocalFunction(S3MP4K, "", "");
    }

    // Making jump case from 0 to 100.000 is consider to be worst too
    // imagine wrote some code like this, why?.
    // You don't have to use this so often if `if` and `else` still possible.
    switch (S3MP4K[0])
    {
        case 0..100000: { print("Hello World"); }
    }

    // call our junkfunc to see the output
    func1(); func2(); func3();
    func4(); func5(); func6();
    func7();
    return;
}

/*
    To simplify the junk code, i used silly macro to speed up the process for me to write it
    I can just generate it using python but you know this topic covers _WORST CODE POSSIBLE_ that
    gives some huge sizes + you NEVER should do any of this at all (1. using silly macro, 2. using worst code). 
*/

// Inside junkfunc macro functions, there is `junk_xxx` variable which is 2 dimentional array, this is considered
// to be the worst code ever written because 1. you don't even need that huge sizes, and 2. you are just wasting
// the precious memory provided by pawn.
#define junkfunc%0(%1) forward%0(%1); public%0(%1) { static junk_%0[JUNK_SIZE][JUNK_SIZE]; print("Hello from "#%0); return 0; }
#define junk_%0\32; junk_

#if 0
    // Since it's just a silly macro, i can declare it like this without any problems, this if you're using
    // #pragma option -l, will give the output
    forward function(); 
    public function() 
    {
        static junk_function[JUNK_SIZE][JUNK_SIZE];
        return 0;
    }

    // This creates a static variable that will be considered to be global variable on a local scope (i think)
    // which the variable, and the value will stay there until the process have been shutdown.
    // Having it reserve so much space it's just very wasted if you're not using it wisely.
#endif

// I delcared 7 same function, which means if one function having much space to be reserved, imagine 7 of them
// and the variable itself is unused, damn...
junkfunc func1()
junkfunc func2()
junkfunc func3()
junkfunc func4()
junkfunc func5()
junkfunc func6()
junkfunc func7()
