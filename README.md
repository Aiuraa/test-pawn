
# Test Pawn Size

This test is just a PoC that not maintaining your code properly can cause huge binary size, there is many factor that can cause huge size rather than a lib/plugins only, like for example: 

- Huge variable size (especially more than 1d array), for example: `S3MP4K[10000][10000]`
- Wasted dynamic memory allocation like `#pragma dynamic 69696969` for no reason
- Too many junk in your code that is unused
- Not compressing your pawn by default using `#pragma compress 1`
- And many more

The file provided here is a proof that a few KB of your code can cause such size if you don't properly care and maintain to your own code and may result to have file transfer lag or other things.

This repo is also for educational purposes only, it's supposed to educate you how you should code it _properly_ not vise versa. Please don't use it for _other things_ because i won't be responsible for any damage caused by the code provided here.

## How can i improve my code then?

It's easy, you should consider having Low Value on some variable especially on MAX_PLAYERS, the lower the better. If your player target is 1000, i guess there is no choice but still you need to maintain the value to be as low as possible on every case (not just MAX_PLAYERS one)

Do not fucking with `#pragma compress` and `#pragma dynamic` if you don't know what you're doing, because these two pragma directive is so sensitive that changing it without any knowledge at all might result in your script instability and having huge size without you realizing it.

Make sure to always write the code if you REALLY needed it, don't ever putting some code that you might not consider using it because it will make your script look like trash can plus can also make your amx size go bigger combined with huge variable allocation.

And lastly, always consult with expert what's the best method to archieve good code, don't be afraid to ask to other people if you don't know anything about it. Blindly write the code can make huge mistakes and you might regret it later.

## Testing

I really recommend using `make` command for easier execution, type:

```bash
make test
```
To build the project.

If you don't have it, you can just type the commands manually inside [Makefile](Makefile).

## Notes

- It's recommended to not run the code, because most likely won't work and give you huge bugs.

- The code when compiled will hang for a few minutes, it's not crashing but just wait until it's finished the compilation to see the results.

- If the compiler output give warnings just __IGNORE IT__, because it's normal thing to do since i'm making the variable
unused for just simple reserved space.

- It's also recommended to compile it using sampctl to avoid any problems when compiling it with normal pawno.

- The compiler only capable to compile this gamemode at exact size, do not ever increasing `JUNK_SIZE` number or increasing the case number, because it'll give you "full disk" error.

## Credits
- Y_Less - for telling me worst method possible.
