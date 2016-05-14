/*
 *  setup.S
 */
SETUP_ADDR = 0x7e00 /* setup.S base address in RAM */
SETUP_BASE_ADDR = 0x7e0 /* setup.S base address in RAM */
SETUP_START_SECT = 0x1 
SETUP_SECT_NUM = 4 /* setup.S sector numbers */

/*
 * Disk Driver 
 */
DISK_DATA = 0x1f0
DISK_ERROR = 0x1f1
DISK_FEATURES = 0x1f1
DISK_SECTOR_COUNT = 0x1f2
DISK_LBA_LOW = 0x1f3
DISK_LBA_MID = 0x1f4
DISK_LBA_HIGH = 0x1f5
DISK_DEVICE = 0x1f6
DISK_STATUS = 0x1f7
DISK_COMMAND = 0x1f7

/*
 * Disk Info 
 */
DISK_IOADDR1 = 0x1f0
