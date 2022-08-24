
#include <a_samp>
#include <YSI_Data\y_foreach>

#define junkfunc%0(%1) forward%0(%1); public%0(%1)
#define JUNK_SIZE 1_000_000 * 10

new Iterator: IterX<MAX_PLAYERS>;
new S3MP4K[JUNK_SIZE];

main()
{
    print("Hello World");

    Iter_Add(IterX, 10);

    format(S3MP4K, sizeof(S3MP4K), "Hello World");
    print(S3MP4K);

    for (new i = 1; i < 5; i ++)
    {
        format(S3MP4K, sizeof(S3MP4K), "func%d", i);
        CallLocalFunction(S3MP4K, "", "");
    }

    fill(S3MP4K);
    return;
}

junkfunc func1()
{
    static junk1[JUNK_SIZE];
    format(junk1, sizeof(junk1), "Hello World");

    fill(junk1);
    return 0;
}

junkfunc func2()
{
    static junk2[JUNK_SIZE];
    format(junk2, sizeof(junk2), "Hello World");

    fill(junk2);
    return 0;
}

junkfunc func3()
{
    static junk3[JUNK_SIZE];
    format(junk3, sizeof(junk3), "Hello World");

    fill(junk3);
    return 0;
}

junkfunc func4()
{
    static junk4[JUNK_SIZE];
    format(junk4, sizeof(junk4), "Hello World");

    fill(junk4);
    return 0;
}

junkfunc func5()
{
    static junk5[JUNK_SIZE];
    format(junk5, sizeof(junk5), "Hello World");

    fill(junk5);
    return 0;
}

fill(arr[], len = sizeof(arr))
{
    for (new i; i < len; i ++)
    {
        arr[i] = i;
    }
}
