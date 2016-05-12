BOOTSEG = 0x7C00  /* bootsect.S start address in RAM */
SETUPSECTS = 4    /* setup.S size */

INITSEG         = DEF_INITSEG           /* we move boot here - out of the way */
SETUPSEG        = DEF_SETUPSEG          /* setup starts here */
SYSSEG          = DEF_SYSSEG            /* system loaded at 0x10000 (65536) */
SYSSIZE         = DEF_SYSSIZE           /* system size: # of 16-byte clicks */
ROOT_DEV        = 0                     /* ROOT_DEV is now written by "build" */
SWAP_DEV        = 0                     /* SWAP_DEV is now written by "build" */
