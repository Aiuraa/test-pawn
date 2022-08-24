
# Test pawn

This test is just a PoC that not maintaining your code properly can cause huge binary size, there is many factor that can cause huge size rather than a lib/plugins only, like for example: 

- Huge variable size, for example: `S3MP4K[10000]`
- Wasted dynamic memory allocation like `#pragma dynamic 69696969` for no reason
- Too many junk in your code
- Not compressing your pawn by default using `#pragma compress 1`
- And many more

The file provided here proof that a few KB of your code can cause such size if you don't properly care to your own code and may result to have file transfer lag or other things.

## Instruction

I really recommend using `make` command for easier execution, type:
```bash
make test
```

To build the project.

If you don't have it, you can just type the commands manually inside the `Makefile` file.
