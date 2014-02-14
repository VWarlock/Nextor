;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Tue Feb 11 14:28:52 2014
;--------------------------------------------------------
	.module fdisk
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PrintDone
	.globl _PrintTargetInfo
	.globl _main
	.globl _strlen
	.globl __ultoa
	.globl _sprintf
	.globl _printf
	.globl _dos1
	.globl _divisor
	.globl _dividend
	.globl _autoPartitionSizeInK
	.globl _canDoDirectFormat
	.globl _canCreatePartitions
	.globl _unpartitionnedSpaceInSectors
	.globl _partitionsExistInDisk
	.globl _partitionsCount
	.globl _partitions
	.globl _screenLinesCount
	.globl _is80ColumnsDisplay
	.globl _currentScreenConfig
	.globl _originalScreenConfig
	.globl _OUT_FLAGS
	.globl _ASMRUT
	.globl _regs
	.globl _availableLunsCount
	.globl _availableDevicesCount
	.globl _installedDriversCount
	.globl _selectedLunIndex
	.globl _selectedDeviceIndex
	.globl _currentDevice
	.globl _devices
	.globl _selectedLun
	.globl _luns
	.globl _selectedDriverName
	.globl _selectedDriver
	.globl _drivers
	.globl _buffer
	.globl _DoFdisk
	.globl _GoDriverSelectionScreen
	.globl _ShowDriverSelectionScreen
	.globl _ComposeSlotString
	.globl _GoDeviceSelectionScreen
	.globl _ShowDeviceSelectionScreen
	.globl _GetDevicesInformation
	.globl _EnsureMaximumStringLength
	.globl _GoLunSelectionScreen
	.globl _InitializePartitionningVariables
	.globl _ShowLunSelectionScreen
	.globl _PrintSize
	.globl _GetRemainingBy1024String
	.globl _GetLunsInformation
	.globl _PrintDeviceInfoWithIndex
	.globl _GoPartitionningMainMenuScreen
	.globl _GetYesOrNo
	.globl _GetDiskPartitionsInfo
	.globl _ShowPartitions
	.globl _PrintOnePartitionInfo
	.globl _DeleteAllPartitions
	.globl _RecalculateAutoPartitionSize
	.globl _AddPartition
	.globl _AddAutoPartition
	.globl _UndoAddPartition
	.globl _TestDeviceAccess
	.globl _InitializeScreenForTestDeviceAccess
	.globl _PrintDosErrorMessage
	.globl _FormatWithoutPartitions
	.globl _CreateFatFileSystem
	.globl _WritePartitionTable
	.globl _PreparePartitionningProcess
	.globl _CreatePartition
	.globl _ConfirmDataDestroy
	.globl _ClearInformationArea
	.globl _GetDriversInformation
	.globl _TerminateRightPaddedStringWithZero
	.globl _WaitKey
	.globl _GetKey
	.globl _SaveOriginalScreenConfiguration
	.globl _ComposeWorkScreenConfiguration
	.globl _SetScreenConfiguration
	.globl _InitializeWorkingScreen
	.globl _PrintRuler
	.globl _Locate
	.globl _LocateX
	.globl _PrintCentered
	.globl _PrintStateMessage
	.globl _putchar
	.globl _print
	.globl _CallFunctionInExtraBank
	.globl _DriverCall
	.globl _DosCall
	.globl _SwitchSystemBankThenCall
	.globl _AsmCallAlt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_buffer::
	.ds 1000
_drivers::
	.ds 512
_selectedDriver::
	.ds 2
_selectedDriverName::
	.ds 50
_luns::
	.ds 91
_selectedLun::
	.ds 2
_devices::
	.ds 455
_currentDevice::
	.ds 2
_selectedDeviceIndex::
	.ds 1
_selectedLunIndex::
	.ds 1
_installedDriversCount::
	.ds 1
_availableDevicesCount::
	.ds 1
_availableLunsCount::
	.ds 1
_regs::
	.ds 12
_ASMRUT::
	.ds 4
_OUT_FLAGS::
	.ds 1
_originalScreenConfig::
	.ds 3
_currentScreenConfig::
	.ds 3
_is80ColumnsDisplay::
	.ds 1
_screenLinesCount::
	.ds 1
_partitions::
	.ds 2304
_partitionsCount::
	.ds 2
_partitionsExistInDisk::
	.ds 1
_unpartitionnedSpaceInSectors::
	.ds 4
_canCreatePartitions::
	.ds 1
_canDoDirectFormat::
	.ds 1
_autoPartitionSizeInK::
	.ds 4
_dividend::
	.ds 4
_divisor::
	.ds 4
_dos1::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;fdisk.c:154: void main(int bc, int hl)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;fdisk.c:156: ASMRUT[0] = 0xC3;   //Code for JP
	ld	hl,#_ASMRUT
	ld	(hl),#0xC3
;fdisk.c:157: dos1 = (*((byte*)0xF313) == 0);
	ld	a,(#0xF313)
	or	a, a
	jr	NZ,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	xor	a,a
00104$:
	ld	(#_dos1 + 0),a
;fdisk.c:194: DoFdisk();
	jp	_DoFdisk
_main_end::
;fdisk.c:199: void DoFdisk()
;	---------------------------------
; Function DoFdisk
; ---------------------------------
_DoFdisk_start::
_DoFdisk:
;fdisk.c:201: installedDriversCount = 0;
	ld	hl,#_installedDriversCount + 0
	ld	(hl), #0x00
;fdisk.c:202: selectedDeviceIndex = 0;
	ld	hl,#_selectedDeviceIndex + 0
	ld	(hl), #0x00
;fdisk.c:203: selectedLunIndex = 0;
	ld	hl,#_selectedLunIndex + 0
	ld	(hl), #0x00
;fdisk.c:204: availableLunsCount = 0;
	ld	hl,#_availableLunsCount + 0
	ld	(hl), #0x00
;fdisk.c:206: SaveOriginalScreenConfiguration();
	call	_SaveOriginalScreenConfiguration
;fdisk.c:207: ComposeWorkScreenConfiguration();
	call	_ComposeWorkScreenConfiguration
;fdisk.c:208: SetScreenConfiguration(&currentScreenConfig);
	ld	hl,#_currentScreenConfig
	push	hl
	call	_SetScreenConfiguration
;fdisk.c:209: InitializeWorkingScreen("Nextor disk partitionning tool");
	ld	hl, #__str_0
	ex	(sp),hl
	call	_InitializeWorkingScreen
	pop	af
;fdisk.c:211: GoDriverSelectionScreen();
	call	_GoDriverSelectionScreen
;fdisk.c:213: SetScreenConfiguration(&originalScreenConfig);
	ld	hl,#_originalScreenConfig
	push	hl
	call	_SetScreenConfiguration
	pop	af
	ret
_DoFdisk_end::
__str_0:
	.ascii "Nextor disk partitionning tool"
	.db 0x00
;fdisk.c:217: void GoDriverSelectionScreen()
;	---------------------------------
; Function GoDriverSelectionScreen
; ---------------------------------
_GoDriverSelectionScreen_start::
_GoDriverSelectionScreen:
;fdisk.c:221: while(true) {
00113$:
;fdisk.c:222: ShowDriverSelectionScreen();
	call	_ShowDriverSelectionScreen
;fdisk.c:223: if(installedDriversCount == 0) {
	ld	a,(#_installedDriversCount + 0)
	or	a, a
;fdisk.c:224: return;
;fdisk.c:227: while(true) {
	ret	Z
00110$:
;fdisk.c:228: key = WaitKey();
	call	_WaitKey
	ld	d,l
;fdisk.c:229: if(key == ESC) {
	ld	a,d
	sub	a, #0x1B
	ret	Z
	jr	00107$
;fdisk.c:230: return;
	ret
00107$:
;fdisk.c:232: key -= '0';
	ld	a,d
	add	a,#0xD0
;fdisk.c:233: if(key >= 1 && key <= installedDriversCount) {
	ld	d,a
	sub	a, #0x01
	jr	C,00110$
	ld	a,(#_installedDriversCount)
	sub	a, d
	jr	C,00110$
;fdisk.c:234: GoDeviceSelectionScreen(key);
	push	de
	inc	sp
	call	_GoDeviceSelectionScreen
	inc	sp
;fdisk.c:235: break;
	jr	00113$
	ret
_GoDriverSelectionScreen_end::
;fdisk.c:243: void ShowDriverSelectionScreen()
;	---------------------------------
; Function ShowDriverSelectionScreen
; ---------------------------------
_ShowDriverSelectionScreen_start::
_ShowDriverSelectionScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-30
	add	hl,sp
	ld	sp,hl
;fdisk.c:253: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:255: if(installedDriversCount == 0) {
	ld	a,(#_installedDriversCount + 0)
	or	a, a
	jr	NZ,00102$
;fdisk.c:256: GetDriversInformation();
	call	_GetDriversInformation
00102$:
;fdisk.c:259: if(installedDriversCount == 0) {
	ld	a,(#_installedDriversCount + 0)
	or	a, a
	jr	NZ,00104$
;fdisk.c:260: Locate(0, 7);
	ld	hl,#0x0700
	push	hl
	call	_Locate
;fdisk.c:261: PrintCentered("There are no device-based drivers");
	ld	hl, #__str_1
	ex	(sp),hl
	call	_PrintCentered
;fdisk.c:262: CursorDown();
	ld	h,#0x1F
	ex	(sp),hl
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:263: PrintCentered("available in the system");
	ld	hl,#__str_2
	push	hl
	call	_PrintCentered
;fdisk.c:264: PrintStateMessage("Press any key to exit...");
	ld	hl, #__str_3
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:265: WaitKey();
	call	_WaitKey
;fdisk.c:266: return;
	jp	00115$
00104$:
;fdisk.c:269: currentDriver = &drivers[0];
;fdisk.c:270: Locate(0,3);
	ld	hl,#0x0300
	push	hl
	call	_Locate
	pop	af
;fdisk.c:271: for(i = 0; i < installedDriversCount; i++) {
	ld	hl,#0x0005
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	hl,#0x0002
	add	hl,sp
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	-8 (ix),#<(_drivers)
	ld	-7 (ix),#>(_drivers)
	ld	-21 (ix),#0x00
00113$:
	ld	hl,#_installedDriversCount
	ld	a,-21 (ix)
	sub	a, (hl)
	jp	NC,00111$
;fdisk.c:272: ComposeSlotString(currentDriver->slot, slot);
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	h,(hl)
	push	de
	push	hl
	inc	sp
	call	_ComposeSlotString
	pop	af
	inc	sp
;fdisk.c:274: revByte = currentDriver->versionRev;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	de, #0x0007
	add	hl, de
	ld	d,(hl)
;fdisk.c:275: if(revByte == 0) {
	ld	a,d
	or	a, a
	jr	NZ,00106$
;fdisk.c:276: rev[0] = '\0';
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
	jr	00107$
00106$:
;fdisk.c:278: rev[0] = '.';
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x2E
;fdisk.c:279: rev[1] = revByte + '0';
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	ld	a,d
	add	a, #0x30
	ld	(hl),a
;fdisk.c:280: rev[2] = '\0';
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc),a
00107$:
;fdisk.c:283: driverName = currentDriver->driverName;
	ld	a,-8 (ix)
	add	a, #0x08
	ld	-30 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-29 (ix),a
;fdisk.c:292: slot);
	ld	a,-4 (ix)
	ld	-10 (ix),a
	ld	a,-3 (ix)
	ld	-9 (ix),a
;fdisk.c:291: rev,
	ld	a,-6 (ix)
	ld	-12 (ix),a
	ld	a,-5 (ix)
	ld	-11 (ix),a
;fdisk.c:290: currentDriver->versionSec,
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a,(hl)
	ld	-14 (ix),a
	ld	-13 (ix),#0x00
;fdisk.c:289: currentDriver->versionMain,
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a,(hl)
	ld	-16 (ix),a
	ld	-15 (ix),#0x00
;fdisk.c:288: is80ColumnsDisplay ? " " : "\x0D\x0A   ",
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	Z,00117$
	ld	-18 (ix),#<(__str_5)
	ld	-17 (ix),#>(__str_5)
	jr	00118$
00117$:
	ld	-18 (ix),#<(__str_6)
	ld	-17 (ix),#>(__str_6)
00118$:
;fdisk.c:286: i + 1,
	ld	a,-21 (ix)
	ld	-20 (ix),a
	ld	-19 (ix),#0x00
	inc	-20 (ix)
	jr	NZ,00141$
	inc	-19 (ix)
00141$:
;fdisk.c:285: printf("\x1BK%i. %s%sv%i.%i%s on slot %s",
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	hl,#__str_4
	push	hl
	call	_printf
	ld	hl,#0x0010
	add	hl,sp
	ld	sp,hl
;fdisk.c:294: NewLine();
	ld	hl,#__str_7
	push	hl
	call	_print
	pop	af
;fdisk.c:295: if(is80ColumnsDisplay || installedDriversCount <= 4) {
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	NZ,00108$
	ld	a,#0x04
	ld	iy,#_installedDriversCount
	sub	a, 0 (iy)
	jr	C,00109$
00108$:
;fdisk.c:296: NewLine();
	ld	hl,#__str_7
	push	hl
	call	_print
	pop	af
00109$:
;fdisk.c:299: currentDriver++;
	ld	a,-8 (ix)
	add	a, #0x40
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
;fdisk.c:271: for(i = 0; i < installedDriversCount; i++) {
	inc	-21 (ix)
	jp	00113$
00111$:
;fdisk.c:302: NewLine();
	ld	hl,#__str_7
	push	hl
	call	_print
;fdisk.c:303: print("ESC. Exit");
	ld	hl, #__str_8
	ex	(sp),hl
	call	_print
;fdisk.c:305: PrintStateMessage("Select the device driver");
	ld	hl, #__str_9
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
00115$:
	ld	sp,ix
	pop	ix
	ret
_ShowDriverSelectionScreen_end::
__str_1:
	.ascii "There are no device-based drivers"
	.db 0x00
__str_2:
	.ascii "available in the system"
	.db 0x00
__str_3:
	.ascii "Press any key to exit..."
	.db 0x00
__str_4:
	.db 0x1B
	.ascii "K%i. %s%sv%i.%i%s on slot %s"
	.db 0x00
__str_5:
	.ascii " "
	.db 0x00
__str_6:
	.db 0x0D
	.db 0x0A
	.ascii "   "
	.db 0x00
__str_7:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_8:
	.ascii "ESC. Exit"
	.db 0x00
__str_9:
	.ascii "Select the device driver"
	.db 0x00
;fdisk.c:309: void ComposeSlotString(byte slot, char* destination)
;	---------------------------------
; Function ComposeSlotString
; ---------------------------------
_ComposeSlotString_start::
_ComposeSlotString:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:312: destination[0] = slot + '0';
	ld	c,5 (ix)
	ld	b,6 (ix)
;fdisk.c:313: destination[1] = '\0';
	ld	e, c
	ld	d, b
	inc	de
;fdisk.c:311: if((slot & 0x80) == 0) {
	bit	7, 4 (ix)
	jr	NZ,00102$
;fdisk.c:312: destination[0] = slot + '0';
	ld	a,4 (ix)
	add	a, #0x30
	ld	(bc),a
;fdisk.c:313: destination[1] = '\0';
	xor	a, a
	ld	(de),a
	jr	00104$
00102$:
;fdisk.c:315: destination[0] = (slot & 3) + '0';
	ld	a,4 (ix)
	and	a, #0x03
	add	a, #0x30
	ld	(bc),a
;fdisk.c:316: destination[1] = '-';
	ld	a,#0x2D
	ld	(de),a
;fdisk.c:317: destination[2] = ((slot >> 2) & 3) + '0';
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a,4 (ix)
	rrca
	rrca
	and	a,#0x3F
	and	a, #0x03
	add	a, #0x30
	ld	(hl),a
;fdisk.c:318: destination[3] = '\0';
	ld	l,c
	ld	h,b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x00
00104$:
	pop	ix
	ret
_ComposeSlotString_end::
;fdisk.c:323: void GoDeviceSelectionScreen(byte driverIndex)
;	---------------------------------
; Function GoDeviceSelectionScreen
; ---------------------------------
_GoDeviceSelectionScreen_start::
_GoDeviceSelectionScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;fdisk.c:329: selectedDriver = &drivers[driverIndex - 1];
	ld	l,4 (ix)
	dec	l
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,#_drivers
	add	hl,de
	ld	(_selectedDriver),hl
;fdisk.c:330: ComposeSlotString(selectedDriver->slot, slot);
	ld	hl,#0x0000
	add	hl,sp
	ex	de,hl
	ld	c, e
	ld	b, d
	ld	hl,(_selectedDriver)
	ld	h,(hl)
	push	de
	push	bc
	push	hl
	inc	sp
	call	_ComposeSlotString
	pop	af
	inc	sp
	pop	de
;fdisk.c:331: strcpy(selectedDriverName, selectedDriver->driverName);
	ld	hl,(_selectedDriver)
	ld	bc,#0x0008
	add	hl,bc
	push	de
	ld	de,#_selectedDriverName
	xor	a, a
00144$:
	cp	a, (hl)
	ldi
	jr	NZ, 00144$
	pop	de
;fdisk.c:332: if(!is80ColumnsDisplay) {
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	NZ,00102$
;fdisk.c:333: EnsureMaximumStringLength(selectedDriverName, MAX_LINLEN_MSX1 - 12);
	ld	hl,#_selectedDriverName
	push	de
	ld	bc,#0x001C
	push	bc
	push	hl
	call	_EnsureMaximumStringLength
	pop	af
	pop	af
	pop	de
00102$:
;fdisk.c:337: slot);
;fdisk.c:336: " on slot %s\r\n",
;fdisk.c:335: sprintf(selectedDriverName + strlen(selectedDriverName),
	ld	hl,#_selectedDriverName
	push	de
	push	hl
	call	_strlen
	pop	af
	pop	de
	ld	bc,#_selectedDriverName
	add	hl,bc
	push	de
	ld	bc,#__str_10
	push	bc
	push	hl
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
;fdisk.c:339: availableDevicesCount = 0;
	ld	hl,#_availableDevicesCount + 0
	ld	(hl), #0x00
;fdisk.c:341: while(true) {
00116$:
;fdisk.c:342: ShowDeviceSelectionScreen();
	call	_ShowDeviceSelectionScreen
;fdisk.c:343: if(availableDevicesCount == 0) {
	ld	a,(#_availableDevicesCount + 0)
	or	a, a
;fdisk.c:344: return;
;fdisk.c:347: while(true) {
	jr	Z,00118$
00113$:
;fdisk.c:348: key = WaitKey();
	call	_WaitKey
	ld	c,l
;fdisk.c:349: if(key == ESC) {
	ld	a,c
	sub	a, #0x1B
	jr	Z,00118$
	jr	00110$
;fdisk.c:350: return;
	jr	00118$
00110$:
;fdisk.c:352: key -= '0';
	ld	a,c
	add	a,#0xD0
;fdisk.c:353: if(key >= 1 && key <= MAX_DEVICES_PER_DRIVER && devices[key - 1].lunCount != 0) {
	ld	c,a
	sub	a, #0x01
	jr	C,00113$
	ld	a,#0x07
	sub	a, c
	jr	C,00113$
	ld	h,c
	dec	h
	ld	e,h
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de,#_devices
	add	hl,de
	ld	a, (hl)
	or	a, a
	jr	Z,00113$
;fdisk.c:354: GoLunSelectionScreen(key);
	ld	a,c
	push	af
	inc	sp
	call	_GoLunSelectionScreen
	inc	sp
;fdisk.c:355: break;
	jr	00116$
00118$:
	ld	sp,ix
	pop	ix
	ret
_GoDeviceSelectionScreen_end::
__str_10:
	.ascii " on slot %s"
	.db 0x0D
	.db 0x0A
	.db 0x00
;fdisk.c:363: void ShowDeviceSelectionScreen()
;	---------------------------------
; Function ShowDeviceSelectionScreen
; ---------------------------------
_ShowDeviceSelectionScreen_start::
_ShowDeviceSelectionScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;fdisk.c:368: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:369: Locate(0,3);
	ld	hl,#0x0300
	push	hl
	call	_Locate
;fdisk.c:370: print(selectedDriverName);
	ld	hl, #_selectedDriverName
	ex	(sp),hl
	call	_print
;fdisk.c:371: CursorDown();
	ld	h,#0x1F
	ex	(sp),hl
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:372: CursorDown();
	ld	a,#0x1F
	push	af
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:374: if(availableDevicesCount == 0) {
	ld	a,(#_availableDevicesCount + 0)
	or	a, a
	jr	NZ,00102$
;fdisk.c:375: GetDevicesInformation();
	call	_GetDevicesInformation
00102$:
;fdisk.c:378: if(availableDevicesCount == 0) {
	ld	a,(#_availableDevicesCount + 0)
	or	a, a
	jr	NZ,00104$
;fdisk.c:379: Locate(0, 9);
	ld	hl,#0x0900
	push	hl
	call	_Locate
;fdisk.c:380: PrintCentered("There are no suitable devices");
	ld	hl, #__str_11
	ex	(sp),hl
	call	_PrintCentered
;fdisk.c:381: CursorDown();
	ld	h,#0x1F
	ex	(sp),hl
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:382: PrintCentered("attached to the driver");
	ld	hl,#__str_12
	push	hl
	call	_PrintCentered
;fdisk.c:383: PrintStateMessage("Press any key to go back...");
	ld	hl, #__str_13
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:384: WaitKey();
	call	_WaitKey
;fdisk.c:385: return;
	jr	00112$
00104$:
;fdisk.c:388: currentDevice = &devices[0];
	ld	bc,#_devices
;fdisk.c:389: for(i = 0; i < MAX_DEVICES_PER_DRIVER; i++) {
	ld	-1 (ix),#0x00
00110$:
;fdisk.c:390: if(currentDevice->lunCount > 0) {
	ld	a,(bc)
	or	a, a
	jr	Z,00106$
;fdisk.c:393: currentDevice->deviceName);
	ld	l, c
	ld	h, b
	inc	hl
;fdisk.c:392: i + 1,
	ld	e,-1 (ix)
	ld	d,#0x00
	inc	de
;fdisk.c:391: printf("\x1BK%i. %s\r\n\r\n",
	push	bc
	push	hl
	push	de
	ld	hl,#__str_14
	push	hl
	call	_printf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
	pop	bc
00106$:
;fdisk.c:396: currentDevice++;
	ld	hl,#0x0041
	add	hl,bc
	ld	c,l
	ld	b,h
;fdisk.c:389: for(i = 0; i < MAX_DEVICES_PER_DRIVER; i++) {
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x07
	jr	C,00110$
;fdisk.c:399: if(availableDevicesCount < 7) {
	ld	a,(#_availableDevicesCount + 0)
	sub	a, #0x07
	jr	NC,00109$
;fdisk.c:400: NewLine();
	ld	hl,#__str_15
	push	hl
	call	_print
	pop	af
00109$:
;fdisk.c:402: print("ESC. Go back to driver selection screen");
	ld	hl,#__str_16
	push	hl
	call	_print
;fdisk.c:404: PrintStateMessage("Select the device");
	ld	hl, #__str_17
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
00112$:
	inc	sp
	pop	ix
	ret
_ShowDeviceSelectionScreen_end::
__str_11:
	.ascii "There are no suitable devices"
	.db 0x00
__str_12:
	.ascii "attached to the driver"
	.db 0x00
__str_13:
	.ascii "Press any key to go back..."
	.db 0x00
__str_14:
	.db 0x1B
	.ascii "K%i. %s"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_15:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_16:
	.ascii "ESC. Go back to driver selection screen"
	.db 0x00
__str_17:
	.ascii "Select the device"
	.db 0x00
;fdisk.c:408: void GetDevicesInformation()
;	---------------------------------
; Function GetDevicesInformation
; ---------------------------------
_GetDevicesInformation_start::
_GetDevicesInformation:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;fdisk.c:412: deviceInfo* currentDevice = &devices[0];
	ld	-2 (ix),#<(_devices)
	ld	-1 (ix),#>(_devices)
;fdisk.c:436: availableDevicesCount = 0;
	ld	hl,#_availableDevicesCount + 0
	ld	(hl), #0x00
;fdisk.c:438: while(deviceIndex <= MAX_DEVICES_PER_DRIVER) {
	ld	-5 (ix),#0x01
00109$:
	ld	a,#0x07
	sub	a, -5 (ix)
	jp	C,00112$
;fdisk.c:439: currentDeviceName = currentDevice->deviceName;
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-7 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
;fdisk.c:440: regs.Bytes.A = deviceIndex;
	ld	hl,#(_regs + 0x0001)
	ld	a,-5 (ix)
	ld	(hl),a
;fdisk.c:441: regs.Bytes.B = 0;
	ld	hl,#(_regs + 0x0003)
	ld	(hl),#0x00
;fdisk.c:442: regs.Words.HL = (int)currentDevice;
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	hl,#(_regs + 0x0006)
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;fdisk.c:443: DriverCall(selectedDriver->slot, DEV_INFO);
	ld	hl,(_selectedDriver)
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	h,(hl)
	ld	bc,#0x4163
	push	bc
	push	hl
	inc	sp
	call	_DriverCall
	pop	af
	inc	sp
;fdisk.c:444: if(regs.Bytes.A == 0) {
	ld	a,(#(_regs + 0x0001) + 0)
	ld	-4 (ix), a
	or	a, a
	jp	NZ,00107$
;fdisk.c:445: availableDevicesCount++;
	ld	hl, #_availableDevicesCount+0
	inc	(hl)
;fdisk.c:446: regs.Bytes.A = deviceIndex;
	ld	hl,#(_regs + 0x0001)
	ld	a,-5 (ix)
	ld	(hl),a
;fdisk.c:447: regs.Bytes.B = 2;
	ld	hl,#(_regs + 0x0003)
	ld	(hl),#0x02
;fdisk.c:448: regs.Words.HL = (int)currentDeviceName;
	ld	a,-7 (ix)
	ld	-4 (ix),a
	ld	a,-6 (ix)
	ld	-3 (ix),a
	ld	hl,#(_regs + 0x0006)
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;fdisk.c:449: DriverCall(selectedDriver->slot, DEV_INFO);
	ld	hl,(_selectedDriver)
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	h,(hl)
	ld	bc,#0x4163
	push	bc
	push	hl
	inc	sp
	call	_DriverCall
	pop	af
	inc	sp
;fdisk.c:451: if(regs.Bytes.A == 0) {
	ld	a, (#(_regs + 0x0001) + 0)
	or	a, a
	jr	NZ,00102$
;fdisk.c:452: TerminateRightPaddedStringWithZero(currentDeviceName, MAX_INFO_LENGTH);
	ld	a,#0x40
	push	af
	inc	sp
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	call	_TerminateRightPaddedStringWithZero
	pop	af
	inc	sp
	jr	00103$
00102$:
;fdisk.c:454: sprintf(currentDeviceName, "(Unnamed device, ID=%i)", deviceIndex);
	ld	l,-5 (ix)
	ld	h,#0x00
	ld	de,#__str_18
	push	hl
	push	de
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
00103$:
;fdisk.c:456: if(!is80ColumnsDisplay) {
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	NZ,00108$
;fdisk.c:457: EnsureMaximumStringLength(currentDeviceName, MAX_LINLEN_MSX1 - 4);
	ld	hl,#0x0024
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_EnsureMaximumStringLength
	pop	af
	pop	af
	jr	00108$
00107$:
;fdisk.c:460: currentDevice->lunCount = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
00108$:
;fdisk.c:463: deviceIndex++;
	inc	-5 (ix)
;fdisk.c:464: currentDevice++;
	ld	a,-2 (ix)
	add	a, #0x41
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	jp	00109$
00112$:
	ld	sp,ix
	pop	ix
	ret
_GetDevicesInformation_end::
__str_18:
	.ascii "(Unnamed device, ID=%i)"
	.db 0x00
;fdisk.c:470: void EnsureMaximumStringLength(char* string, int maxLength)
;	---------------------------------
; Function EnsureMaximumStringLength
; ---------------------------------
_EnsureMaximumStringLength_start::
_EnsureMaximumStringLength:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:472: int len = strlen(string);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strlen
	pop	af
;fdisk.c:473: if(len > maxLength) {
	ld	a,6 (ix)
	sub	a, l
	ld	a,7 (ix)
	sbc	a, h
	jp	PO, 00108$
	xor	a, #0x80
00108$:
	jp	P,00103$
;fdisk.c:474: string += maxLength - 3;
	ld	a,6 (ix)
	add	a,#0xFD
	ld	h,a
	ld	a,7 (ix)
	adc	a,#0xFF
	ld	l,a
	ld	a,4 (ix)
	add	a, h
	ld	4 (ix),a
	ld	a,5 (ix)
	adc	a, l
	ld	5 (ix),a
;fdisk.c:475: *string++ = '.';
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x2E
	inc	hl
	ld	4 (ix),l
	ld	5 (ix),h
;fdisk.c:476: *string++ = '.';
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x2E
	inc	hl
	ld	4 (ix),l
	ld	5 (ix),h
;fdisk.c:477: *string++ = '.';
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x2E
	inc	hl
	ld	4 (ix),l
	ld	5 (ix),h
;fdisk.c:478: *string = '\0';
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
00103$:
	pop	ix
	ret
_EnsureMaximumStringLength_end::
;fdisk.c:483: void GoLunSelectionScreen(byte deviceIndex)
;	---------------------------------
; Function GoLunSelectionScreen
; ---------------------------------
_GoLunSelectionScreen_start::
_GoLunSelectionScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:488: currentDevice = &devices[deviceIndex - 1];
	ld	l,4 (ix)
	dec	l
	ld	c,l
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de,#_devices
	add	hl,de
	ld	(_currentDevice),hl
;fdisk.c:489: selectedDeviceIndex = deviceIndex;
	ld	a,4 (ix)
	ld	(#_selectedDeviceIndex + 0),a
;fdisk.c:491: availableLunsCount = 0;
	ld	hl,#_availableLunsCount + 0
	ld	(hl), #0x00
;fdisk.c:493: while(true) {
00114$:
;fdisk.c:494: ShowLunSelectionScreen();
	call	_ShowLunSelectionScreen
;fdisk.c:495: if(availableLunsCount == 0) {
	ld	a,(#_availableLunsCount + 0)
	or	a, a
;fdisk.c:496: return;
;fdisk.c:499: while(true) {
	jr	Z,00116$
00111$:
;fdisk.c:500: key = WaitKey();
	call	_WaitKey
	ld	c,l
;fdisk.c:501: if(key == ESC) {
	ld	a,c
	sub	a, #0x1B
	jr	Z,00116$
	jr	00108$
;fdisk.c:502: return;
	jr	00116$
00108$:
;fdisk.c:504: key -= '0';
	ld	a,c
	add	a,#0xD0
;fdisk.c:505: if(key >= 1 && key <= MAX_LUNS_PER_DEVICE && luns[key - 1].suitableForPartitionning) {
	ld	c,a
	sub	a, #0x01
	jr	C,00111$
	ld	a,#0x07
	sub	a, c
	jr	C,00111$
	ld	h,c
	dec	h
	ld	e,h
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de,#_luns
	add	hl,de
	ld	de, #0x000C
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z,00111$
;fdisk.c:506: InitializePartitionningVariables(key);
	ld	a,c
	push	af
	inc	sp
	call	_InitializePartitionningVariables
	inc	sp
;fdisk.c:507: GoPartitionningMainMenuScreen();
	call	_GoPartitionningMainMenuScreen
;fdisk.c:508: break;
	jr	00114$
00116$:
	pop	ix
	ret
_GoLunSelectionScreen_end::
;fdisk.c:516: void InitializePartitionningVariables(byte lunIndex)
;	---------------------------------
; Function InitializePartitionningVariables
; ---------------------------------
_InitializePartitionningVariables_start::
_InitializePartitionningVariables:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:518: selectedLunIndex = lunIndex - 1;
	ld	hl,#_selectedLunIndex
	ld	a,4 (ix)
	add	a,#0xFF
	ld	(hl),a
;fdisk.c:519: selectedLun = &luns[selectedLunIndex];
	ld	bc,(_selectedLunIndex)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de,#_luns
	add	hl,de
	ld	(_selectedLun),hl
;fdisk.c:520: partitionsCount = 0;
	ld	hl,#_partitionsCount + 0
	ld	(hl), #0x00
	ld	hl,#_partitionsCount + 1
	ld	(hl), #0x00
;fdisk.c:521: partitionsExistInDisk = true;
	ld	hl,#_partitionsExistInDisk + 0
	ld	(hl), #0x01
;fdisk.c:522: canCreatePartitions = (selectedLun->sectorCount >= (MIN_DEVICE_SIZE_FOR_PARTITIONS_IN_K * 2));
	ld	de,(_selectedLun)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	h,(hl)
	ld	l,a
	ld	a,b
	sub	a, #0x08
	ld	a,h
	sbc	a, #0x00
	ld	a,l
	sbc	a, #0x00
	ld	a,#0x00
	ccf
	rla
	ld	(#_canCreatePartitions + 0),a
;fdisk.c:523: canDoDirectFormat = (selectedLun->sectorCount <= MAX_DEVICE_SIZE_FOR_DIRECT_FORMAT_IN_K * 2);
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	h,(hl)
	ld	l,a
	xor	a, a
	cp	a, c
	sbc	a, b
	ld	a,#0x01
	sbc	a, h
	ld	a,#0x00
	sbc	a, l
	ld	a,#0x00
	ccf
	rla
	ld	(#_canDoDirectFormat + 0),a
;fdisk.c:524: unpartitionnedSpaceInSectors = selectedLun->sectorCount;
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_unpartitionnedSpaceInSectors + 3),a
;fdisk.c:525: RecalculateAutoPartitionSize(true);
	ld	a,#0x01
	push	af
	inc	sp
	call	_RecalculateAutoPartitionSize
	inc	sp
	pop	ix
	ret
_InitializePartitionningVariables_end::
;fdisk.c:529: void ShowLunSelectionScreen()
;	---------------------------------
; Function ShowLunSelectionScreen
; ---------------------------------
_ShowLunSelectionScreen_start::
_ShowLunSelectionScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-5
	add	hl,sp
	ld	sp,hl
;fdisk.c:534: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:535: Locate(0,3);
	ld	hl,#0x0300
	push	hl
	call	_Locate
;fdisk.c:536: print(selectedDriverName);
	ld	hl, #_selectedDriverName
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:537: print(currentDevice->deviceName);
	ld	hl,(_currentDevice)
	inc	hl
	push	hl
	call	_print
	pop	af
;fdisk.c:538: PrintDeviceInfoWithIndex();
	call	_PrintDeviceInfoWithIndex
;fdisk.c:539: NewLine();
	ld	hl,#__str_19
	push	hl
	call	_print
;fdisk.c:540: NewLine();
	ld	hl, #__str_19
	ex	(sp),hl
	call	_print
;fdisk.c:541: NewLine();
	ld	hl, #__str_19
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:543: if(availableLunsCount == 0) {
	ld	a,(#_availableLunsCount + 0)
	or	a, a
	jr	NZ,00102$
;fdisk.c:544: GetLunsInformation();
	call	_GetLunsInformation
00102$:
;fdisk.c:547: if(availableLunsCount == 0) {
	ld	a,(#_availableLunsCount + 0)
	or	a, a
	jr	NZ,00104$
;fdisk.c:548: Locate(0, 9);
	ld	hl,#0x0900
	push	hl
	call	_Locate
;fdisk.c:549: PrintCentered("There are no suitable logical units");
	ld	hl, #__str_20
	ex	(sp),hl
	call	_PrintCentered
;fdisk.c:550: CursorDown();
	ld	h,#0x1F
	ex	(sp),hl
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:551: PrintCentered("available in the device");
	ld	hl,#__str_21
	push	hl
	call	_PrintCentered
;fdisk.c:552: PrintStateMessage("Press any key to go back...");
	ld	hl, #__str_22
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:553: WaitKey();
	call	_WaitKey
;fdisk.c:554: return;
	jp	00110$
00104$:
;fdisk.c:557: currentLun = &luns[0];
	ld	-2 (ix),#<(_luns)
	ld	-1 (ix),#>(_luns)
;fdisk.c:558: for(i = 0; i < MAX_LUNS_PER_DEVICE; i++) {
	ld	-5 (ix),#0x00
00108$:
;fdisk.c:559: if(currentLun->suitableForPartitionning) {
	ld	a,-2 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	de, #0x000C
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	Z,00106$
;fdisk.c:560: printf("\x1BK%i. Size: ", i + 1);
	ld	l,-5 (ix)
	ld	h,#0x00
	inc	hl
	ld	de,#__str_23
	push	hl
	push	de
	call	_printf
	pop	af
	pop	af
;fdisk.c:561: PrintSize(currentLun->sectorCount / 2);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	rr	d
	rr	e
	push	bc
	push	de
	call	_PrintSize
	pop	af
;fdisk.c:562: NewLine();
	ld	hl, #__str_19
	ex	(sp),hl
	call	_print
	pop	af
00106$:
;fdisk.c:565: i++;
	inc	-5 (ix)
;fdisk.c:566: currentLun++;
	ld	a,-2 (ix)
	add	a, #0x0D
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;fdisk.c:558: for(i = 0; i < MAX_LUNS_PER_DEVICE; i++) {
	inc	-5 (ix)
	ld	a,-5 (ix)
	sub	a, #0x07
	jr	C,00108$
;fdisk.c:569: NewLine();
	ld	hl,#__str_19
	push	hl
	call	_print
;fdisk.c:570: NewLine();
	ld	hl, #__str_19
	ex	(sp),hl
	call	_print
;fdisk.c:571: print("ESC. Go back to device selection screen");
	ld	hl, #__str_24
	ex	(sp),hl
	call	_print
;fdisk.c:573: PrintStateMessage("Select the logical unit");
	ld	hl, #__str_25
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
00110$:
	ld	sp,ix
	pop	ix
	ret
_ShowLunSelectionScreen_end::
__str_19:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_20:
	.ascii "There are no suitable logical units"
	.db 0x00
__str_21:
	.ascii "available in the device"
	.db 0x00
__str_22:
	.ascii "Press any key to go back..."
	.db 0x00
__str_23:
	.db 0x1B
	.ascii "K%i. Size: "
	.db 0x00
__str_24:
	.ascii "ESC. Go back to device selection screen"
	.db 0x00
__str_25:
	.ascii "Select the logical unit"
	.db 0x00
;fdisk.c:577: void PrintSize(ulong sizeInK)
;	---------------------------------
; Function PrintSize
; ---------------------------------
_PrintSize_start::
_PrintSize:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-11
	add	hl,sp
	ld	sp,hl
;fdisk.c:584: if(sizeInK < (ulong)(10 * 1024)) {
	ld	a,5 (ix)
	sub	a, #0x28
	ld	a,6 (ix)
	sbc	a, #0x00
	ld	a,7 (ix)
	sbc	a, #0x00
	jr	NC,00102$
;fdisk.c:585: printf("%iK", sizeInK);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	hl,#__str_26
	push	hl
	call	_printf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
;fdisk.c:586: return;
	jp	00106$
00102$:
;fdisk.c:589: dividedSize = sizeInK >> 10;
	push	af
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	c,6 (ix)
	ld	d,7 (ix)
	pop	af
	ld	b,#0x0A
00114$:
	srl	d
	rr	c
	rr	h
	rr	l
	djnz	00114$
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	-9 (ix),c
	ld	-8 (ix),d
;fdisk.c:590: if(dividedSize < (ulong)(10 * 1024)) {
	ld	a,-10 (ix)
	sub	a, #0x28
	ld	a,-9 (ix)
	sbc	a, #0x00
	ld	a,-8 (ix)
	sbc	a, #0x00
	jr	NC,00104$
;fdisk.c:591: printf("%i", dividedSize + GetRemainingBy1024String(sizeInK, buf));
	ld	hl,#0x0004
	add	hl,sp
	ld	e,l
	ld	d,h
	push	de
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_GetRemainingBy1024String
	pop	af
	pop	af
	pop	af
	pop	de
	ld	h,#0x00
	ld	bc,#0x0000
	ld	a,-11 (ix)
	add	a, l
	ld	-4 (ix),a
	ld	a,-10 (ix)
	adc	a, h
	ld	-3 (ix),a
	ld	a,-9 (ix)
	adc	a, c
	ld	-2 (ix),a
	ld	a,-8 (ix)
	adc	a, b
	ld	-1 (ix),a
	ld	bc,#__str_27
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	bc
	call	_printf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
;fdisk.c:592: printf("%sM", buf);
	pop	hl
	ld	de,#__str_28
	push	hl
	push	de
	call	_printf
	pop	af
	pop	af
	jp	00106$
00104$:
;fdisk.c:594: sizeInK >>= 10;
	ld	4 (ix),l
	ld	5 (ix),h
	ld	6 (ix),c
	ld	7 (ix),d
;fdisk.c:595: dividedSize = sizeInK >> 10;
	push	af
	ld	a,4 (ix)
	ld	-11 (ix),a
	ld	a,5 (ix)
	ld	-10 (ix),a
	ld	a,6 (ix)
	ld	-9 (ix),a
	ld	a,7 (ix)
	ld	-8 (ix),a
	pop	af
	ld	b,#0x0A
00116$:
	srl	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	djnz	00116$
;fdisk.c:596: printf("%i", dividedSize + GetRemainingBy1024String(sizeInK, buf));
	ld	hl,#0x0004
	add	hl,sp
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_GetRemainingBy1024String
	pop	af
	pop	af
	pop	af
	ld	h,#0x00
	ld	de,#0x0000
	ld	a,-11 (ix)
	add	a, l
	ld	c,a
	ld	a,-10 (ix)
	adc	a, h
	ld	b,a
	ld	a,-9 (ix)
	adc	a, e
	ld	l,a
	ld	a,-8 (ix)
	adc	a, d
	ld	h,a
	ld	de,#__str_27
	push	hl
	push	bc
	push	de
	call	_printf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
;fdisk.c:597: printf("%sG", buf);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	de,#__str_29
	push	hl
	push	de
	call	_printf
	pop	af
	pop	af
00106$:
	ld	sp,ix
	pop	ix
	ret
_PrintSize_end::
__str_26:
	.ascii "%iK"
	.db 0x00
__str_27:
	.ascii "%i"
	.db 0x00
__str_28:
	.ascii "%sM"
	.db 0x00
__str_29:
	.ascii "%sG"
	.db 0x00
;fdisk.c:602: byte GetRemainingBy1024String(ulong value, char* destination)
;	---------------------------------
; Function GetRemainingBy1024String
; ---------------------------------
_GetRemainingBy1024String_start::
_GetRemainingBy1024String:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;fdisk.c:607: int remaining = value & 0x3FF;
	ld	h,4 (ix)
	ld	a,5 (ix)
	and	a, #0x03
	ld	-2 (ix), h
	ld	-1 (ix), a
;fdisk.c:609: *destination = '\0';
	ld	c,8 (ix)
	ld	b,9 (ix)
;fdisk.c:608: if(remaining >= 950) {
	ld	a,-2 (ix)
	sub	a, #0xB6
	ld	a,-1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	C,00102$
;fdisk.c:609: *destination = '\0';
	xor	a, a
	ld	(bc),a
;fdisk.c:610: return 1;
	ld	l,#0x01
	jr	00108$
00102$:
;fdisk.c:612: remaining2 = remaining % 100;
	push	bc
	ld	hl,#0x0064
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	bc
	ld	e,l
;fdisk.c:613: remainingDigit = (remaining / 100) + '0';
	push	bc
	push	de
	ld	hl,#0x0064
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	add	a, #0x30
	ld	d,a
;fdisk.c:614: if(remaining2 >= 50) {
	ld	a,e
	sub	a, #0x32
	jr	C,00104$
;fdisk.c:615: remainingDigit++;
	inc	d
00104$:
;fdisk.c:618: if(remainingDigit == '0') {
	ld	a,d
	sub	a, #0x30
	jr	NZ,00106$
;fdisk.c:619: *destination = '\0';
	xor	a, a
	ld	(bc),a
	jr	00107$
00106$:
;fdisk.c:621: destination[0] = '.';
	ld	a,#0x2E
	ld	(bc),a
;fdisk.c:622: destination[1] = remainingDigit;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl),d
;fdisk.c:623: destination[2] = '\0';
	ld	l,c
	ld	h,b
	inc	hl
	inc	hl
	ld	(hl),#0x00
00107$:
;fdisk.c:626: return 0;
	ld	l,#0x00
00108$:
	ld	sp,ix
	pop	ix
	ret
_GetRemainingBy1024String_end::
;fdisk.c:630: void GetLunsInformation()
;	---------------------------------
; Function GetLunsInformation
; ---------------------------------
_GetLunsInformation_start::
_GetLunsInformation:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;fdisk.c:634: lunInfo* currentLun = &luns[0];
	ld	-2 (ix),#<(_luns)
	ld	-1 (ix),#>(_luns)
;fdisk.c:637: while(lunIndex <= MAX_LUNS_PER_DEVICE) {
	ld	-6 (ix),#0x01
00106$:
	ld	a,#0x07
	sub	a, -6 (ix)
	jp	C,00109$
;fdisk.c:638: regs.Bytes.A = selectedDeviceIndex;
	ld	hl,#(_regs + 0x0001)
	ld	a,(#_selectedDeviceIndex + 0)
	ld	(hl),a
;fdisk.c:639: regs.Bytes.B = lunIndex;
	ld	hl,#_regs + 3
	ld	a,-6 (ix)
	ld	(hl),a
;fdisk.c:640: regs.Words.HL = (int)currentLun;
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	((_regs + 0x0006)), de
;fdisk.c:641: DriverCall(selectedDriver->slot, LUN_INFO);
	ld	hl,(_selectedDriver)
	ld	h,(hl)
	ld	bc,#0x4169
	push	bc
	push	hl
	inc	sp
	call	_DriverCall
	pop	af
	inc	sp
;fdisk.c:647: currentLun->suitableForPartitionning =
	ld	a,-2 (ix)
	add	a, #0x0C
	ld	c,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	b,a
;fdisk.c:648: (regs.Bytes.A == 0) &&
	ld	a, (#_regs + 1)
	or	a, a
	jr	NZ,00111$
;fdisk.c:649: (currentLun->mediumType == BLOCK_DEVICE) &&
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00111$
;fdisk.c:650: (currentLun->sectorSize == 512) &&
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,d
	or	a, a
	jr	NZ,00111$
	ld	a,h
	sub	a, #0x02
	jr	NZ,00111$
;fdisk.c:651: (currentLun->sectorCount >= MIN_DEVICE_SIZE_IN_K * 2) &&
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a, #0x14
	ld	a,d
	sbc	a, #0x00
	ld	a,h
	sbc	a, #0x00
	ld	a,l
	sbc	a, #0x00
	ld	a,#0x00
	ccf
	rla
	or	a, a
	jr	Z,00111$
;fdisk.c:652: ((currentLun->flags & (READ_ONLY_LUN | FLOPPY_DISK_LUN)) == 0);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0007
	add	hl, de
	ld	a,(hl)
	and	a,#0x06
	jr	Z,00112$
00111$:
	ld	a,#0x00
	jr	00113$
00112$:
	ld	a,#0x01
00113$:
	ld	(bc),a
;fdisk.c:653: if(currentLun->suitableForPartitionning) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x000C
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;fdisk.c:654: availableLunsCount++;
	ld	hl, #_availableLunsCount+0
	inc	(hl)
00102$:
;fdisk.c:657: if(currentLun->sectorsPerTrack == 0 || currentLun->sectorsPerTrack > EXTRA_PARTITION_SECTORS) {
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	push	bc
	pop	iy
	ld	a,11 (iy)
	ld	-3 (ix), a
	or	a, a
	jr	Z,00103$
	ld	a,#0x01
	sub	a, -3 (ix)
	jr	NC,00104$
00103$:
;fdisk.c:658: currentLun->sectorsPerTrack = EXTRA_PARTITION_SECTORS;
	ld	a,-2 (ix)
	add	a, #0x0B
	ld	-5 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x01
00104$:
;fdisk.c:661: lunIndex++;
	inc	-6 (ix)
;fdisk.c:662: currentLun++;
	ld	a,-2 (ix)
	add	a, #0x0D
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	jp	00106$
00109$:
	ld	sp,ix
	pop	ix
	ret
_GetLunsInformation_end::
;fdisk.c:667: void PrintDeviceInfoWithIndex()
;	---------------------------------
; Function PrintDeviceInfoWithIndex
; ---------------------------------
_PrintDeviceInfoWithIndex_start::
_PrintDeviceInfoWithIndex:
;fdisk.c:669: printf(is80ColumnsDisplay ? " (Id = %i)" : " (%i)", selectedDeviceIndex);
	ld	hl,#_selectedDeviceIndex + 0
	ld	c, (hl)
	ld	b,#0x00
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	Z,00103$
	ld	hl,#__str_30
	jr	00104$
00103$:
	ld	hl,#__str_31
00104$:
	push	bc
	push	hl
	call	_printf
	pop	af
	pop	af
	ret
_PrintDeviceInfoWithIndex_end::
__str_30:
	.ascii " (Id = %i)"
	.db 0x00
__str_31:
	.ascii " (%i)"
	.db 0x00
;fdisk.c:673: void PrintTargetInfo()
;	---------------------------------
; Function PrintTargetInfo
; ---------------------------------
_PrintTargetInfo_start::
_PrintTargetInfo:
;fdisk.c:675: Locate(0,3);
	ld	hl,#0x0300
	push	hl
	call	_Locate
;fdisk.c:676: print(selectedDriverName);
	ld	hl, #_selectedDriverName
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:677: print(currentDevice->deviceName);
	ld	hl,(_currentDevice)
	inc	hl
	push	hl
	call	_print
	pop	af
;fdisk.c:678: PrintDeviceInfoWithIndex();
	call	_PrintDeviceInfoWithIndex
;fdisk.c:679: NewLine();
	ld	hl,#__str_32
	push	hl
	call	_print
	pop	af
;fdisk.c:680: printf("Logical unit %i, size: ", selectedLunIndex + 1);
	ld	hl,#_selectedLunIndex + 0
	ld	e, (hl)
	ld	d,#0x00
	inc	de
	ld	hl,#__str_33
	push	de
	push	hl
	call	_printf
	pop	af
	pop	af
;fdisk.c:681: PrintSize(selectedLun->sectorCount / 2);
	ld	hl,(_selectedLun)
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	rr	d
	rr	e
	push	bc
	push	de
	call	_PrintSize
	pop	af
;fdisk.c:682: NewLine();
	ld	hl, #__str_32
	ex	(sp),hl
	call	_print
	pop	af
	ret
_PrintTargetInfo_end::
__str_32:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_33:
	.ascii "Logical unit %i, size: "
	.db 0x00
;fdisk.c:686: void GoPartitionningMainMenuScreen()
;	---------------------------------
; Function GoPartitionningMainMenuScreen
; ---------------------------------
_GoPartitionningMainMenuScreen_start::
_GoPartitionningMainMenuScreen:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;fdisk.c:691: bool mustRetrievePartitionInfo = true;
	ld	-3 (ix),#0x01
;fdisk.c:693: while(true) {
00174$:
;fdisk.c:694: if(mustRetrievePartitionInfo) {
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00108$
;fdisk.c:695: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:696: PrintTargetInfo();
	call	_PrintTargetInfo
;fdisk.c:698: if(canCreatePartitions) {
	ld	a,(#_canCreatePartitions + 0)
	or	a, a
	jr	Z,00106$
;fdisk.c:699: Locate(0, MESSAGE_ROW);
	ld	hl,#0x0900
	push	hl
	call	_Locate
;fdisk.c:700: PrintCentered("Searching partitions...");
	ld	hl, #__str_34
	ex	(sp),hl
	call	_PrintCentered
;fdisk.c:701: PrintStateMessage("Please wait...");
	ld	hl, #__str_35
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:702: error = GetDiskPartitionsInfo();
	call	_GetDiskPartitionsInfo
	ld	h,l
;fdisk.c:703: if(error != 0) {
	ld	a,h
	or	a, a
	jr	Z,00104$
;fdisk.c:704: PrintDosErrorMessage(error, "Error when searching partitions:");
	ld	de,#__str_36
	push	de
	push	hl
	inc	sp
	call	_PrintDosErrorMessage
;fdisk.c:705: PrintStateMessage("Manage device anyway? (y/n) ");
	inc	sp
	ld	hl,#__str_37
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:706: if(!GetYesOrNo()) {
	call	_GetYesOrNo
	ld	a,l
	or	a, a
;fdisk.c:707: return;
	jp	Z,00176$
00104$:
;fdisk.c:710: partitionsExistInDisk = (partitionsCount > 0);
	ld	hl,#_partitionsExistInDisk
	xor	a, a
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00318$
	xor	a, #0x80
00318$:
	rlca
	and	a,#0x01
	ld	(hl),a
00106$:
;fdisk.c:712: mustRetrievePartitionInfo = false;
	ld	-3 (ix),#0x00
00108$:
;fdisk.c:715: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:716: PrintTargetInfo();
	call	_PrintTargetInfo
;fdisk.c:717: if(!partitionsExistInDisk) {
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	NZ,00110$
;fdisk.c:718: print("Unpartitionned space available: ");
	ld	hl,#__str_38
	push	hl
	call	_print
	pop	af
;fdisk.c:719: PrintSize(unpartitionnedSpaceInSectors / 2);
	push	af
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	l,0 (iy)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	h,1 (iy)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	e,2 (iy)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	d,3 (iy)
	pop	af
	srl	d
	rr	e
	rr	h
	rr	l
	push	de
	push	hl
	call	_PrintSize
	pop	af
;fdisk.c:720: NewLine();
	ld	hl, #__str_39
	ex	(sp),hl
	call	_print
	pop	af
00110$:
;fdisk.c:722: NewLine();
	ld	hl,#__str_39
	push	hl
	call	_print
	pop	af
;fdisk.c:725: "\r\n", is80ColumnsDisplay ? " " : "\r\n");
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	Z,00178$
	ld	de,#__str_41
	jr	00179$
00178$:
	ld	de,#__str_42
00179$:
	ld	hl,#__str_40
	push	de
	push	hl
	call	_printf
	pop	af
	pop	af
;fdisk.c:727: if(partitionsCount > 0) {
	xor	a, a
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00321$
	xor	a, #0x80
00321$:
	jp	P,00114$
;fdisk.c:731: partitionsExistInDisk ? "found" : "defined");
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	Z,00180$
	ld	hl,#__str_44
	jr	00181$
00180$:
	ld	hl,#__str_45
00181$:
;fdisk.c:729: "D. Delete all partitions\r\n",
	ld	de,#__str_43
	push	hl
	ld	hl,(_partitionsCount)
	push	hl
	push	de
	call	_printf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
	jr	00115$
00114$:
;fdisk.c:732: } else if(canCreatePartitions) {
	ld	a,(#_canCreatePartitions + 0)
	or	a, a
	jr	Z,00115$
;fdisk.c:733: print("(No partitions found or defined)\r\n");
	ld	hl,#__str_46
	push	hl
	call	_print
	pop	af
00115$:
;fdisk.c:736: !partitionsExistInDisk && 
	ld	a,(#_partitionsExistInDisk + 0)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	d,a
	or	a, a
	jr	Z,00182$
;fdisk.c:737: canCreatePartitions && 
	ld	a,(#_canCreatePartitions + 0)
	or	a, a
	jr	Z,00182$
;fdisk.c:738: unpartitionnedSpaceInSectors >= (MIN_REMAINING_SIZE_FOR_NEW_PARTITIONS_IN_K * 2) + (EXTRA_PARTITION_SECTORS) &&
	ld	a,(#_unpartitionnedSpaceInSectors + 0)
	sub	a, #0xC9
	ld	a,(#_unpartitionnedSpaceInSectors + 1)
	sbc	a, #0x00
	ld	a,(#_unpartitionnedSpaceInSectors + 2)
	sbc	a, #0x00
	ld	a,(#_unpartitionnedSpaceInSectors + 3)
	sbc	a, #0x00
	ld	a,#0x00
	ccf
	rla
	ld	d,a
	or	a, a
	jr	Z,00182$
;fdisk.c:739: partitionsCount < MAX_PARTITIONS_TO_HANDLE;
	ld	a,(#_partitionsCount + 1)
	xor	a, #0x80
	sub	a, #0x81
	jr	C,00183$
00182$:
	ld	a,#0x00
	jr	00184$
00183$:
	ld	a,#0x01
00184$:
;fdisk.c:740: if(canAddPartitionsNow) {
	ld	-2 (ix), a
	or	a, a
	jr	Z,00117$
;fdisk.c:741: print("A. Add one ");
	ld	hl,#__str_47
	push	hl
	call	_print
	pop	af
;fdisk.c:742: PrintSize(autoPartitionSizeInK);
	ld	hl,(_autoPartitionSizeInK + 2)
	push	hl
	ld	hl,(_autoPartitionSizeInK)
	push	hl
	call	_PrintSize
	pop	af
;fdisk.c:743: print(" partition\r\n");
	ld	hl, #__str_48
	ex	(sp),hl
	call	_print
;fdisk.c:744: print("P. Add partition...\r\n");
	ld	hl, #__str_49
	ex	(sp),hl
	call	_print
	pop	af
00117$:
;fdisk.c:746: if(!partitionsExistInDisk && partitionsCount > 0) {
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	NZ,00119$
	xor	a, a
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00322$
	xor	a, #0x80
00322$:
	jp	P,00119$
;fdisk.c:747: print("U. Undo add ");
	ld	hl,#__str_50
	push	hl
	call	_print
	pop	af
;fdisk.c:748: PrintSize(partitions[partitionsCount - 1].sizeInK);
	ld	hl,#_partitionsCount + 0
	ld	e, (hl)
	ld	hl,#_partitionsCount + 1
	ld	d, (hl)
	dec	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de,#_partitions
	add	hl,de
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	push	de
	call	_PrintSize
	pop	af
;fdisk.c:749: print(" partition\r\n");
	ld	hl, #__str_48
	ex	(sp),hl
	call	_print
	pop	af
00119$:
;fdisk.c:751: NewLine();
	ld	hl,#__str_39
	push	hl
	call	_print
	pop	af
;fdisk.c:752: if(canDoDirectFormat) {
	ld	a,(#_canDoDirectFormat + 0)
	or	a, a
	jr	Z,00122$
;fdisk.c:753: print("F. Format device without partitions\r\n\r\n");
	ld	hl,#__str_51
	push	hl
	call	_print
	pop	af
00122$:
;fdisk.c:755: if(!partitionsExistInDisk && partitionsCount > 0) {
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	NZ,00124$
	xor	a, a
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00323$
	xor	a, #0x80
00323$:
	jp	P,00124$
;fdisk.c:756: print("W. Write partitions to disk\r\n\r\n");
	ld	hl,#__str_52
	push	hl
	call	_print
	pop	af
00124$:
;fdisk.c:758: print("T. Test device access\r\n");
	ld	hl,#__str_53
	push	hl
	call	_print
;fdisk.c:760: PrintStateMessage("Select an option or press ESC to return");
	ld	hl, #__str_54
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:762: while((key = WaitKey()) == 0);
00126$:
	call	_WaitKey
	ld	a,l
	ld	-1 (ix),a
	or	a, a
	jr	Z,00126$
;fdisk.c:763: if(key == ESC) {
	ld	a,-1 (ix)
	sub	a, #0x1B
	jr	NZ,00136$
;fdisk.c:764: if(partitionsExistInDisk || partitionsCount == 0) {
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jp	NZ,00176$
	ld	a,(#_partitionsCount + 1)
	ld	hl,#_partitionsCount + 0
	or	a,(hl)
;fdisk.c:765: return;
	jp	Z,00176$
;fdisk.c:767: PrintStateMessage("Discard changes and return? (y/n) ");
	ld	hl,#__str_55
	push	hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:768: if(GetYesOrNo()) {
	call	_GetYesOrNo
	ld	a,l
	or	a, a
	jp	Z,00174$
;fdisk.c:769: return;
	jp	00176$
;fdisk.c:771: continue;
00136$:
;fdisk.c:774: key |= 32;
	set	5, -1 (ix)
	ld	a, -1 (ix)
;fdisk.c:710: partitionsExistInDisk = (partitionsCount > 0);
	xor	a, a
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00326$
	xor	a, #0x80
00326$:
	rlca
	and	a,#0x01
	ld	d,a
;fdisk.c:775: if(key == 's' && partitionsCount > 0) {
	ld	a,-1 (ix)
	sub	a,#0x73
	jr	NZ,00170$
	or	a,d
	jr	Z,00170$
;fdisk.c:776: ShowPartitions();
	call	_ShowPartitions
	jp	00174$
00170$:
;fdisk.c:777: } else if(key == 'd' && partitionsCount > 0) {
	ld	a,-1 (ix)
	sub	a,#0x64
	jr	NZ,00166$
	or	a,d
	jr	Z,00166$
;fdisk.c:778: DeleteAllPartitions();
	call	_DeleteAllPartitions
	jp	00174$
00166$:
;fdisk.c:779: } else if(key == 'p' && canAddPartitionsNow > 0) {
	ld	a,-1 (ix)
	sub	a, #0x70
	jr	NZ,00162$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00162$
;fdisk.c:780: AddPartition();
	call	_AddPartition
	jp	00174$
00162$:
;fdisk.c:781: } else if(key == 'a' && canAddPartitionsNow > 0) {
	ld	a,-1 (ix)
	sub	a, #0x61
	jr	NZ,00158$
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00158$
;fdisk.c:782: AddAutoPartition();
	call	_AddAutoPartition
	jp	00174$
00158$:
;fdisk.c:783: } else if(key == 'u' && !partitionsExistInDisk && partitionsCount > 0) {
	ld	a,-1 (ix)
	sub	a, #0x75
	jr	NZ,00153$
	ld	a,(#_partitionsExistInDisk + 0)
	or	a,a
	jr	NZ,00153$
	or	a,d
	jr	Z,00153$
;fdisk.c:784: UndoAddPartition();
	call	_UndoAddPartition
	jp	00174$
00153$:
;fdisk.c:785: }else if(key == 't') {
	ld	a,-1 (ix)
	sub	a, #0x74
	jr	NZ,00150$
;fdisk.c:786: TestDeviceAccess();
	call	_TestDeviceAccess
	jp	00174$
00150$:
;fdisk.c:787: } else if(key == 'f' && canDoDirectFormat) {
	ld	a,-1 (ix)
	sub	a, #0x66
	jr	NZ,00146$
	ld	a,(#_canDoDirectFormat + 0)
	or	a, a
	jr	Z,00146$
;fdisk.c:788: if(FormatWithoutPartitions()) {
	call	_FormatWithoutPartitions
	ld	a,l
	or	a, a
	jp	Z,00174$
;fdisk.c:789: mustRetrievePartitionInfo = true;
	ld	-3 (ix),#0x01
	jp	00174$
00146$:
;fdisk.c:791: }else if(key == 'w' && !partitionsExistInDisk && partitionsCount > 0) {
	ld	a,-1 (ix)
	sub	a, #0x77
	jp	NZ,00174$
	ld	a,(#_partitionsExistInDisk + 0)
	or	a,a
	jp	NZ,00174$
	or	a,d
	jp	Z,00174$
;fdisk.c:792: if(WritePartitionTable()) {
	call	_WritePartitionTable
	ld	a,l
	or	a, a
	jp	Z,00174$
;fdisk.c:793: mustRetrievePartitionInfo = true;
	ld	-3 (ix),#0x01
	jp	00174$
00176$:
	ld	sp,ix
	pop	ix
	ret
_GoPartitionningMainMenuScreen_end::
__str_34:
	.ascii "Searching partitions..."
	.db 0x00
__str_35:
	.ascii "Please wait..."
	.db 0x00
__str_36:
	.ascii "Error when searching partitions:"
	.db 0x00
__str_37:
	.ascii "Manage device anyway? (y/n) "
	.db 0x00
__str_38:
	.ascii "Unpartitionned space available: "
	.db 0x00
__str_39:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_40:
	.ascii "Changes are not committed%suntil W is pressed."
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_41:
	.ascii " "
	.db 0x00
__str_42:
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_43:
	.ascii "S. Show partitions (%i %s)"
	.db 0x0D
	.db 0x0A
	.ascii "D. Delete all partitions"
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_44:
	.ascii "found"
	.db 0x00
__str_45:
	.ascii "defined"
	.db 0x00
__str_46:
	.ascii "(No partitions found or defined)"
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_47:
	.ascii "A. Add one "
	.db 0x00
__str_48:
	.ascii " partition"
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_49:
	.ascii "P. Add partition..."
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_50:
	.ascii "U. Undo add "
	.db 0x00
__str_51:
	.ascii "F. Format device without partitions"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_52:
	.ascii "W. Write partitions to disk"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_53:
	.ascii "T. Test device access"
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_54:
	.ascii "Select an option or press ESC to return"
	.db 0x00
__str_55:
	.ascii "Discard changes and return? (y/n) "
	.db 0x00
;fdisk.c:800: bool GetYesOrNo()
;	---------------------------------
; Function GetYesOrNo
; ---------------------------------
_GetYesOrNo_start::
_GetYesOrNo:
;fdisk.c:804: DisplayCursor();
	ld	hl,#__str_56
	push	hl
	call	_print
	pop	af
;fdisk.c:805: key = WaitKey() | 32;
	call	_WaitKey
	ld	a,l
	set	5, a
	ld	h,a
;fdisk.c:806: HideCursor();
	ld	de,#__str_57
	push	hl
	push	de
	call	_print
	pop	af
	pop	hl
;fdisk.c:807: return key == 'y';
	ld	a,h
	sub	a, #0x79
	jr	NZ,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	xor	a,a
00104$:
	ld	l,a
	ret
_GetYesOrNo_end::
__str_56:
	.db 0x1B
	.ascii "y5"
	.db 0x00
__str_57:
	.db 0x1B
	.ascii "x5"
	.db 0x00
;fdisk.c:811: byte GetDiskPartitionsInfo()
;	---------------------------------
; Function GetDiskPartitionsInfo
; ---------------------------------
_GetDiskPartitionsInfo_start::
_GetDiskPartitionsInfo:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;fdisk.c:814: byte extendedIndex = 0;
	ld	-6 (ix),#0x00
;fdisk.c:817: partitionInfo* currentPartition = &partitions[0];
	ld	-2 (ix),#<(_partitions)
	ld	-1 (ix),#>(_partitions)
;fdisk.c:830: partitionsCount = 0;
	ld	hl,#_partitionsCount + 0
	ld	(hl), #0x00
	ld	hl,#_partitionsCount + 1
	ld	(hl), #0x00
;fdisk.c:832: do {
	ld	-5 (ix),#0x01
00111$:
;fdisk.c:833: regs.Bytes.A = selectedDriver->slot;
	ld	hl,(_selectedDriver)
	ld	a,(hl)
	ld	(#(_regs + 0x0001)),a
;fdisk.c:834: regs.Bytes.B = 0xFF;
	ld	hl,#(_regs + 0x0003)
	ld	(hl),#0xFF
;fdisk.c:835: regs.Bytes.D = selectedDeviceIndex;
	ld	hl,#_regs + 5
	ld	a,(#_selectedDeviceIndex + 0)
	ld	(hl),a
;fdisk.c:836: regs.Bytes.E = selectedLunIndex + 1;
	ld	a,(#_selectedLunIndex + 0)
	inc	a
	ld	(#(_regs + 0x0004)),a
;fdisk.c:837: regs.Bytes.H = primaryIndex;
	ld	hl,#_regs + 7
	ld	a,-5 (ix)
	ld	(hl),a
;fdisk.c:838: regs.Bytes.L = extendedIndex;
	ld	hl,#_regs + 6
	ld	a,-6 (ix)
	ld	(hl),a
;fdisk.c:839: DosCall(_GPART, REGS_ALL);
	ld	hl,#0x037A
	push	hl
	call	_DosCall
	pop	af
;fdisk.c:840: error = regs.Bytes.A;
	ld	hl, #(_regs + 0x0001) + 0
	ld	l,(hl)
;fdisk.c:841: if(error == 0) {
	ld	a,l
	or	a, a
	jp	NZ,00108$
;fdisk.c:842: if(regs.Bytes.B == PARTYPE_EXTENDED) {
	ld	a, (#(_regs + 0x0003) + 0)
	sub	a, #0x05
	jr	NZ,00102$
;fdisk.c:843: extendedIndex = 1;
	ld	-6 (ix),#0x01
	jp	00112$
00102$:
;fdisk.c:845: currentPartition->primaryIndex = primaryIndex;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-5 (ix)
	ld	(hl),a
;fdisk.c:846: currentPartition->extendedIndex = extendedIndex;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a,-6 (ix)
	ld	(hl),a
;fdisk.c:847: currentPartition->partitionType = regs.Bytes.B;
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	inc	de
	inc	de
	ld	a, (#(_regs + 0x0003) + 0)
	ld	(de),a
;fdisk.c:848: ((uint*)&(currentPartition->sizeInK))[0] = regs.UWords.IY;
	ld	a,-2 (ix)
	add	a, #0x03
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	pop	bc
	pop	de
	push	de
	push	bc
	ld	bc, (#_regs + 10)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;fdisk.c:849: ((uint*)&(currentPartition->sizeInK))[1] = regs.UWords.IX;
	pop	bc
	pop	de
	push	de
	push	bc
	inc	de
	inc	de
	ld	bc, (#_regs + 8)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;fdisk.c:850: currentPartition->sizeInK /= 2;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	rr	d
	rr	e
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;fdisk.c:851: partitionsCount++;
	ld	hl, #_partitionsCount+0
	inc	(hl)
	jr	NZ,00135$
	ld	hl, #_partitionsCount+1
	inc	(hl)
00135$:
;fdisk.c:852: currentPartition++;
	ld	a,-2 (ix)
	add	a, #0x09
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;fdisk.c:853: extendedIndex++;
	inc	-6 (ix)
	jr	00112$
00108$:
;fdisk.c:855: } else if(error == _IPART) {
	ld	a,l
	sub	a, #0xB4
	jr	NZ,00114$
;fdisk.c:856: primaryIndex++;
	inc	-5 (ix)
;fdisk.c:857: extendedIndex = 0;
	ld	-6 (ix),#0x00
	jr	00112$
;fdisk.c:859: return error;
	jr	00114$
00112$:
;fdisk.c:861: } while(primaryIndex <= 4 && partitionsCount < MAX_PARTITIONS_TO_HANDLE);
	ld	a,#0x04
	sub	a, -5 (ix)
	jr	C,00113$
	ld	a,(#_partitionsCount + 1)
	xor	a, #0x80
	sub	a, #0x81
	jp	C,00111$
00113$:
;fdisk.c:863: return 0;
	ld	l,#0x00
00114$:
	ld	sp,ix
	pop	ix
	ret
_GetDiskPartitionsInfo_end::
;fdisk.c:868: void ShowPartitions()
;	---------------------------------
; Function ShowPartitions
; ---------------------------------
_ShowPartitions_start::
_ShowPartitions:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;fdisk.c:871: int firstShownPartitionIndex = 1;
	ld	-8 (ix),#0x01
	ld	-7 (ix),#0x00
;fdisk.c:878: Locate(0, screenLinesCount-1);
	ld	hl,#_screenLinesCount + 0
	ld	d, (hl)
	dec	d
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Locate
;fdisk.c:879: DeleteToEndOfLine();
	ld	hl, #__str_58
	ex	(sp),hl
	call	_print
;fdisk.c:880: PrintCentered("Press ESC to return");
	ld	hl, #__str_59
	ex	(sp),hl
	call	_PrintCentered
	pop	af
;fdisk.c:882: while(true) {
00121$:
;fdisk.c:883: isFirstPage = (firstShownPartitionIndex == 1);
	ld	a,-8 (ix)
	dec	a
	jr	NZ,00187$
	ld	a,-7 (ix)
	or	a, a
	jr	NZ,00187$
	ld	a,#0x01
	jr	00188$
00187$:
	xor	a,a
00188$:
	ld	-12 (ix),a
;fdisk.c:884: isLastPage = (firstShownPartitionIndex + PARTITIONS_PER_PAGE) > partitionsCount;
	ld	a,-8 (ix)
	add	a, #0x0F
	ld	-2 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	hl,#_partitionsCount
	ld	a,(hl)
	sub	a, -2 (ix)
	inc	hl
	ld	a,(hl)
	sbc	a, -1 (ix)
	jp	PO, 00189$
	xor	a, #0x80
00189$:
	rlca
	and	a,#0x01
;fdisk.c:885: lastPartitionIndexToShow = isLastPage ? partitionsCount : firstShownPartitionIndex + PARTITIONS_PER_PAGE - 1;
	ld	-11 (ix), a
	or	a, a
	jr	Z,00128$
	ld	hl,(_partitionsCount)
	ld	-10 (ix),l
	ld	-9 (ix),h
	jr	00129$
00128$:
	ld	a,-8 (ix)
	add	a, #0x0E
	ld	-10 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
00129$:
;fdisk.c:887: Locate(0, screenLinesCount-1);
	ld	hl,#_screenLinesCount + 0
	ld	d, (hl)
	dec	d
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Locate
	pop	af
;fdisk.c:888: print(isFirstPage ? "   " : "<--");
	ld	a,-12 (ix)
	or	a, a
	jr	Z,00130$
	ld	de,#__str_60
	jr	00131$
00130$:
	ld	de,#__str_61
00131$:
	push	de
	call	_print
	pop	af
;fdisk.c:890: Locate(currentScreenConfig.screenWidth - 4, screenLinesCount-1);
	ld	hl,#_screenLinesCount + 0
	ld	d, (hl)
	dec	d
	ld	a, (#_currentScreenConfig + 1)
	add	a,#0xFC
	push	de
	inc	sp
	push	af
	inc	sp
	call	_Locate
	pop	af
;fdisk.c:891: print(isLastPage ? "   " : "-->");
	ld	a,-11 (ix)
	or	a, a
	jr	Z,00132$
	ld	hl,#__str_60
	jr	00133$
00132$:
	ld	hl,#__str_62
00133$:
	push	hl
	call	_print
	pop	af
;fdisk.c:893: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:894: Locate(0, 3);
	ld	hl,#0x0300
	push	hl
	call	_Locate
	pop	af
;fdisk.c:895: if(partitionsCount == 1) {
	ld	a,(#_partitionsCount + 0)
	dec	a
	jr	NZ,00102$
	ld	a,(#_partitionsCount + 1)
	or	a, a
	jr	NZ,00102$
;fdisk.c:896: PrintCentered(partitionsExistInDisk ? "One partition found on device" : "One new partition defined");
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	Z,00134$
	ld	hl,#__str_63
	jr	00135$
00134$:
	ld	hl,#__str_64
00135$:
	push	hl
	call	_PrintCentered
	pop	af
	jr	00103$
00102$:
;fdisk.c:898: sprintf(buffer, partitionsExistInDisk ? "%i partitions found on device" : "%i new partitions defined", partitionsCount);
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	Z,00136$
	ld	bc,#__str_65
	jr	00137$
00136$:
	ld	bc,#__str_66
00137$:
	ld	de,#_buffer
	ld	hl,(_partitionsCount)
	push	hl
	push	bc
	push	de
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
;fdisk.c:899: PrintCentered(buffer);
	ld	hl,#_buffer
	push	hl
	call	_PrintCentered
	pop	af
00103$:
;fdisk.c:901: NewLine();
	ld	hl,#__str_67
	push	hl
	call	_print
	pop	af
;fdisk.c:902: if(partitionsCount > PARTITIONS_PER_PAGE) {
	ld	a,#0x0F
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00192$
	xor	a, #0x80
00192$:
	jp	P,00105$
;fdisk.c:903: sprintf(buffer, "Displaying partitions %i - %i", 
	ld	hl,#_buffer
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	push	bc
	ld	bc,#__str_68
	push	bc
	push	hl
	call	_sprintf
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
;fdisk.c:906: PrintCentered(buffer);
	ld	hl,#_buffer
	push	hl
	call	_PrintCentered
;fdisk.c:907: NewLine();
	ld	hl, #__str_67
	ex	(sp),hl
	call	_print
	pop	af
00105$:
;fdisk.c:909: NewLine();
	ld	hl,#__str_67
	push	hl
	call	_print
	pop	af
;fdisk.c:911: currentPartition = &partitions[firstShownPartitionIndex - 1];
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	dec	hl
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de,#_partitions
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
;fdisk.c:913: for(i = firstShownPartitionIndex; i <= lastPartitionIndexToShow; i++) {
	ld	a,-8 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	ld	-5 (ix),a
00124$:
	ld	a,-10 (ix)
	sub	a, -6 (ix)
	ld	a,-9 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00193$
	xor	a, #0x80
00193$:
	jp	M,00118$
;fdisk.c:914: PrintOnePartitionInfo(currentPartition);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_PrintOnePartitionInfo
	pop	af
;fdisk.c:915: currentPartition++;
	ld	a,-4 (ix)
	add	a, #0x09
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;fdisk.c:913: for(i = firstShownPartitionIndex; i <= lastPartitionIndexToShow; i++) {
	inc	-6 (ix)
	jr	NZ,00124$
	inc	-5 (ix)
	jr	00124$
;fdisk.c:918: while(true) {
00118$:
;fdisk.c:919: key = WaitKey();
	call	_WaitKey
;fdisk.c:920: if(key == ESC) {
	ld	a,l
	sub	a, #0x1B
	jr	Z,00126$
	jr	00115$
;fdisk.c:921: return;
	jr	00126$
00115$:
;fdisk.c:922: } else if(key == CURSOR_LEFT && !isFirstPage) {
	ld	a,l
	sub	a, #0x1D
	jr	NZ,00111$
	ld	a,-12 (ix)
	or	a, a
	jr	NZ,00111$
;fdisk.c:923: firstShownPartitionIndex -= PARTITIONS_PER_PAGE;
	ld	a,-8 (ix)
	add	a,#0xF1
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	-7 (ix),a
;fdisk.c:924: break;
	jp	00121$
00111$:
;fdisk.c:925: } else if(key == CURSOR_RIGHT && !isLastPage) {
	ld	a,l
	sub	a, #0x1C
	jr	NZ,00118$
	ld	a,-11 (ix)
	or	a, a
	jr	NZ,00118$
;fdisk.c:926: firstShownPartitionIndex += PARTITIONS_PER_PAGE;
	ld	a,-2 (ix)
	ld	-8 (ix),a
	ld	a,-1 (ix)
	ld	-7 (ix),a
;fdisk.c:927: break;
	jp	00121$
00126$:
	ld	sp,ix
	pop	ix
	ret
_ShowPartitions_end::
__str_58:
	.db 0x1B
	.ascii "K"
	.db 0x00
__str_59:
	.ascii "Press ESC to return"
	.db 0x00
__str_60:
	.ascii "   "
	.db 0x00
__str_61:
	.ascii "<--"
	.db 0x00
__str_62:
	.ascii "-->"
	.db 0x00
__str_63:
	.ascii "One partition found on device"
	.db 0x00
__str_64:
	.ascii "One new partition defined"
	.db 0x00
__str_65:
	.ascii "%i partitions found on device"
	.db 0x00
__str_66:
	.ascii "%i new partitions defined"
	.db 0x00
__str_67:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_68:
	.ascii "Displaying partitions %i - %i"
	.db 0x00
;fdisk.c:934: void PrintOnePartitionInfo(partitionInfo* info)
;	---------------------------------
; Function PrintOnePartitionInfo
; ---------------------------------
_PrintOnePartitionInfo_start::
_PrintOnePartitionInfo:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;fdisk.c:937: putchar(info->primaryIndex == 1 ? '1' : info->extendedIndex + 1 + '0');
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
;fdisk.c:936: if(!partitionsExistInDisk && partitionsCount <= 4) {
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	NZ,00104$
	ld	a,#0x04
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00148$
	xor	a, #0x80
00148$:
	jp	M,00104$
;fdisk.c:937: putchar(info->primaryIndex == 1 ? '1' : info->extendedIndex + 1 + '0');
	dec	e
	jr	NZ,00122$
	ld	a,#0x31
	jr	00123$
00122$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a,(hl)
	add	a, #0x31
00123$:
	push	af
	inc	sp
	call	_putchar
	inc	sp
	jr	00105$
00104$:
;fdisk.c:939: putchar(info->primaryIndex + '0');
	ld	a,e
	add	a, #0x30
	push	af
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:940: if(info->extendedIndex != 0) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00105$
;fdisk.c:941: printf("-%i", info->extendedIndex);
	ld	l,a
	ld	h,#0x00
	ld	de,#__str_69
	push	hl
	push	de
	call	_printf
	pop	af
	pop	af
00105$:
;fdisk.c:944: print(": ");
	ld	hl,#__str_70
	push	hl
	call	_print
	pop	af
;fdisk.c:945: if(info->partitionType == PARTYPE_FAT12) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-3 (ix), a
	dec	a
	jr	NZ,00118$
;fdisk.c:946: print("FAT12");
	ld	hl,#__str_71
	push	hl
	call	_print
	pop	af
	jr	00119$
00118$:
;fdisk.c:947: } else if(info->partitionType == PARTYPE_FAT16) {
	ld	a,-3 (ix)
	sub	a, #0x06
	jr	NZ,00115$
;fdisk.c:948: print("FAT16");
	ld	hl,#__str_72
	push	hl
	call	_print
	pop	af
	jr	00119$
00115$:
;fdisk.c:949: } else if(info->partitionType == 0xB || info->partitionType == 0xC) {
	ld	a,-3 (ix)
	sub	a, #0x0B
	jr	Z,00110$
	ld	a,-3 (ix)
	sub	a, #0x0C
	jr	NZ,00111$
00110$:
;fdisk.c:950: print("FAT32");
	ld	hl,#__str_73
	push	hl
	call	_print
	pop	af
	jr	00119$
00111$:
;fdisk.c:951: } else if(info->partitionType == 7) {
	ld	a,-3 (ix)
	sub	a, #0x07
	jr	NZ,00108$
;fdisk.c:952: print("NTFS");
	ld	hl,#__str_74
	push	hl
	call	_print
	pop	af
	jr	00119$
00108$:
;fdisk.c:954: printf("Type #%x", info->partitionType);
	ld	l,-3 (ix)
	ld	h,#0x00
	ld	de,#__str_75
	push	hl
	push	de
	call	_printf
	pop	af
	pop	af
00119$:
;fdisk.c:956: print(", ");
	ld	hl,#__str_76
	push	hl
	call	_print
	pop	af
;fdisk.c:957: PrintSize(info->sizeInK);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	push	de
	call	_PrintSize
	pop	af
;fdisk.c:958: NewLine();
	ld	hl, #__str_77
	ex	(sp),hl
	call	_print
	ld	sp,ix
	pop	ix
	ret
_PrintOnePartitionInfo_end::
__str_69:
	.ascii "-%i"
	.db 0x00
__str_70:
	.ascii ": "
	.db 0x00
__str_71:
	.ascii "FAT12"
	.db 0x00
__str_72:
	.ascii "FAT16"
	.db 0x00
__str_73:
	.ascii "FAT32"
	.db 0x00
__str_74:
	.ascii "NTFS"
	.db 0x00
__str_75:
	.ascii "Type #%x"
	.db 0x00
__str_76:
	.ascii ", "
	.db 0x00
__str_77:
	.db 0x0A
	.db 0x0D
	.db 0x00
;fdisk.c:962: void DeleteAllPartitions()
;	---------------------------------
; Function DeleteAllPartitions
; ---------------------------------
_DeleteAllPartitions_start::
_DeleteAllPartitions:
;fdisk.c:964: sprintf(buffer, "Discard all %s partitions? (y/n) ", partitionsExistInDisk ? "existing" : "defined");
	ld	a,(#_partitionsExistInDisk + 0)
	or	a, a
	jr	Z,00105$
	ld	de,#__str_79
	jr	00106$
00105$:
	ld	de,#__str_80
00106$:
	ld	bc,#__str_78
	ld	hl,#_buffer
	push	de
	push	bc
	push	hl
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
;fdisk.c:965: PrintStateMessage(buffer);
	ld	hl,#_buffer
	push	hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:966: if(!GetYesOrNo()) {
	call	_GetYesOrNo
	ld	a,l
	or	a, a
;fdisk.c:967: return;
	ret	Z
;fdisk.c:970: partitionsCount = 0;
	ld	hl,#_partitionsCount + 0
	ld	(hl), #0x00
	ld	hl,#_partitionsCount + 1
	ld	(hl), #0x00
;fdisk.c:971: partitionsExistInDisk = false;
	ld	hl,#_partitionsExistInDisk + 0
	ld	(hl), #0x00
;fdisk.c:972: unpartitionnedSpaceInSectors = selectedLun->sectorCount;
	ld	hl,(_selectedLun)
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_unpartitionnedSpaceInSectors + 3),a
;fdisk.c:973: RecalculateAutoPartitionSize(true);
	ld	a,#0x01
	push	af
	inc	sp
	call	_RecalculateAutoPartitionSize
	inc	sp
	ret
_DeleteAllPartitions_end::
__str_78:
	.ascii "Discard all %s partitions? (y/n) "
	.db 0x00
__str_79:
	.ascii "existing"
	.db 0x00
__str_80:
	.ascii "defined"
	.db 0x00
;fdisk.c:977: void RecalculateAutoPartitionSize(bool setToAllSpaceAvailable)
;	---------------------------------
; Function RecalculateAutoPartitionSize
; ---------------------------------
_RecalculateAutoPartitionSize_start::
_RecalculateAutoPartitionSize:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:979: ulong maxAbsolutePartitionSizeInK = (unpartitionnedSpaceInSectors - EXTRA_PARTITION_SECTORS) / 2;
	ld	a,(#_unpartitionnedSpaceInSectors + 0)
	add	a,#0xFF
	ld	d,a
	ld	a,(#_unpartitionnedSpaceInSectors + 1)
	adc	a,#0xFF
	ld	b,a
	ld	a,(#_unpartitionnedSpaceInSectors + 2)
	adc	a,#0xFF
	ld	e,a
	ld	a,(#_unpartitionnedSpaceInSectors + 3)
	adc	a,#0xFF
	ld	c,a
	srl	c
	rr	e
	rr	b
	rr	d
;fdisk.c:981: if(setToAllSpaceAvailable) {
	ld	a,4 (ix)
	or	a, a
	jr	Z,00102$
;fdisk.c:982: autoPartitionSizeInK = maxAbsolutePartitionSizeInK;
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), d
	ld	hl,#_autoPartitionSizeInK + 1
	ld	(hl), b
	ld	hl,#_autoPartitionSizeInK + 2
	ld	(hl), e
	ld	hl,#_autoPartitionSizeInK + 3
	ld	(hl), c
00102$:
;fdisk.c:985: if(autoPartitionSizeInK > MAX_FAT16_PARTITION_SIZE_IN_K) {
	xor	a, a
	ld	iy,#_autoPartitionSizeInK
	cp	a, 0 (iy)
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 1 (iy)
	ld	a,#0x40
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 2 (iy)
	ld	a,#0x00
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 3 (iy)
	jr	NC,00107$
;fdisk.c:986: autoPartitionSizeInK = MAX_FAT16_PARTITION_SIZE_IN_K;
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), #0x00
	ld	hl,#_autoPartitionSizeInK + 1
	ld	(hl), #0x00
	ld	hl,#_autoPartitionSizeInK + 2
	ld	(hl), #0x40
	ld	hl,#_autoPartitionSizeInK + 3
	ld	(hl), #0x00
	jr	00108$
00107$:
;fdisk.c:987: } else if(!setToAllSpaceAvailable && autoPartitionSizeInK > maxAbsolutePartitionSizeInK) {
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00108$
	ld	a,d
	ld	iy,#_autoPartitionSizeInK
	sub	a, 0 (iy)
	ld	a,b
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 1 (iy)
	ld	a,e
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 2 (iy)
	ld	a,c
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 3 (iy)
	jr	NC,00108$
;fdisk.c:988: autoPartitionSizeInK = maxAbsolutePartitionSizeInK;
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), d
	ld	hl,#_autoPartitionSizeInK + 1
	ld	(hl), b
	ld	hl,#_autoPartitionSizeInK + 2
	ld	(hl), e
	ld	hl,#_autoPartitionSizeInK + 3
	ld	(hl), c
00108$:
;fdisk.c:991: if(autoPartitionSizeInK < MIN_PARTITION_SIZE_IN_K) {
	ld	a,(#_autoPartitionSizeInK + 0)
	sub	a, #0x64
	ld	a,(#_autoPartitionSizeInK + 1)
	sbc	a, #0x00
	ld	a,(#_autoPartitionSizeInK + 2)
	sbc	a, #0x00
	ld	a,(#_autoPartitionSizeInK + 3)
	sbc	a, #0x00
	jr	NC,00112$
;fdisk.c:992: autoPartitionSizeInK = MIN_PARTITION_SIZE_IN_K;
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), #0x64
	xor	a, a
	ld	(#_autoPartitionSizeInK + 1),a
	ld	(#_autoPartitionSizeInK + 2),a
	ld	(#_autoPartitionSizeInK + 3),a
	jr	00113$
00112$:
;fdisk.c:993: } else if(autoPartitionSizeInK > maxAbsolutePartitionSizeInK) {
	ld	a,d
	ld	iy,#_autoPartitionSizeInK
	sub	a, 0 (iy)
	ld	a,b
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 1 (iy)
	ld	a,e
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 2 (iy)
	ld	a,c
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 3 (iy)
	jr	NC,00113$
;fdisk.c:994: autoPartitionSizeInK = maxAbsolutePartitionSizeInK;
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), d
	ld	hl,#_autoPartitionSizeInK + 1
	ld	(hl), b
	ld	hl,#_autoPartitionSizeInK + 2
	ld	(hl), e
	ld	hl,#_autoPartitionSizeInK + 3
	ld	(hl), c
00113$:
;fdisk.c:997: if(dos1 && autoPartitionSizeInK > 16*1024) {
	ld	a,(#_dos1 + 0)
	or	a, a
	jr	Z,00117$
	xor	a, a
	ld	iy,#_autoPartitionSizeInK
	cp	a, 0 (iy)
	ld	a,#0x40
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 1 (iy)
	ld	a,#0x00
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 2 (iy)
	ld	a,#0x00
	ld	iy,#_autoPartitionSizeInK
	sbc	a, 3 (iy)
	jr	NC,00117$
;fdisk.c:998: autoPartitionSizeInK = 16*1024;
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), #0x00
	ld	hl,#_autoPartitionSizeInK + 1
	ld	(hl), #0x40
	ld	hl,#_autoPartitionSizeInK + 2
	ld	(hl), #0x00
	ld	hl,#_autoPartitionSizeInK + 3
	ld	(hl), #0x00
00117$:
	pop	ix
	ret
_RecalculateAutoPartitionSize_end::
;fdisk.c:1003: void AddPartition()
;	---------------------------------
; Function AddPartition
; ---------------------------------
_AddPartition_start::
_AddPartition:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-28
	add	hl,sp
	ld	sp,hl
;fdisk.c:1010: bool validNumberEntered = false;
	ld	-18 (ix),#0x00
;fdisk.c:1014: ulong unpartitionnedSpaceExceptAlignmentInK = (unpartitionnedSpaceInSectors - EXTRA_PARTITION_SECTORS) / 2;
	ld	a,(#_unpartitionnedSpaceInSectors + 0)
	add	a,#0xFF
	ld	e,a
	ld	a,(#_unpartitionnedSpaceInSectors + 1)
	adc	a,#0xFF
	ld	d,a
	ld	a,(#_unpartitionnedSpaceInSectors + 2)
	adc	a,#0xFF
	ld	c,a
	ld	a,(#_unpartitionnedSpaceInSectors + 3)
	adc	a,#0xFF
	ld	b,a
	push	af
	ld	-28 (ix),e
	ld	-27 (ix),d
	ld	-26 (ix),c
	ld	-25 (ix),b
	pop	af
	ld	a,#0x01
	srl	-25 (ix)
	rr	-26 (ix)
	rr	-27 (ix)
	rr	-28 (ix)
;fdisk.c:1016: maxPartitionSizeInM = (uint)((unpartitionnedSpaceInSectors / 2) >> 10);
	push	af
	ld	hl,#_unpartitionnedSpaceInSectors + 0
	ld	c, (hl)
	ld	hl,#_unpartitionnedSpaceInSectors + 1
	ld	h, (hl)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	l,2 (iy)
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	d,3 (iy)
	pop	af
	srl	d
	rr	l
	rr	h
	rr	c
	ld	b,#0x0A
00215$:
	srl	d
	rr	l
	rr	h
	rr	c
	djnz	00215$
	ld	-14 (ix),c
	ld	-13 (ix),h
;fdisk.c:1017: maxPartitionSizeInK = unpartitionnedSpaceExceptAlignmentInK > (ulong)32767 ? (uint)32767 : unpartitionnedSpaceExceptAlignmentInK;
	bit	7, -27 (ix)
	jr	NZ,00217$
	ld	a,-26 (ix)
	or	a, a
	jr	NZ,00217$
	ld	a,-25 (ix)
	or	a, a
	jr	Z,00138$
00217$:
	ld	hl,#0xFF7F
	jr	00139$
00138$:
	ld	h,-28 (ix)
	ld	l,-27 (ix)
00139$:
	ld	-16 (ix),h
	ld	-15 (ix),l
;fdisk.c:1019: lessThan1MAvailable = (maxPartitionSizeInM == 0);
	ld	a,-14 (ix)
	or	a, -13 (ix)
	jr	NZ,00218$
	ld	a,#0x01
	jr	00219$
00218$:
	xor	a,a
00219$:
	ld	-23 (ix),a
;fdisk.c:1021: if(maxPartitionSizeInM > (ulong)MAX_FAT16_PARTITION_SIZE_IN_M) {
	ld	h,-14 (ix)
	ld	l,-13 (ix)
	ld	de,#0x0000
	xor	a, a
	cp	a, h
	ld	a,#0x10
	sbc	a, l
	ld	a,#0x00
	sbc	a, d
	ld	a,#0x00
	sbc	a, e
	jr	NC,00102$
;fdisk.c:1022: maxPartitionSizeInM = MAX_FAT16_PARTITION_SIZE_IN_M;
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x10
00102$:
;fdisk.c:1025: PrintStateMessage("Enter size or press ENTER to cancel");
	ld	hl,#__str_81
	push	hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:1027: while(!validNumberEntered) {
00133$:
	ld	a,-18 (ix)
	or	a, a
	jp	NZ,00135$
;fdisk.c:1028: sizeInKSpecified = true;
	ld	-24 (ix),#0x01
;fdisk.c:1029: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:1030: PrintTargetInfo();
	call	_PrintTargetInfo
;fdisk.c:1031: NewLine();
	ld	hl,#__str_82
	push	hl
	call	_print
;fdisk.c:1032: print("Add new partition\r\n\r\n");
	ld	hl, #__str_83
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:1034: if(dos1) {
	ld	a,(#_dos1 + 0)
	or	a, a
	jr	Z,00104$
;fdisk.c:1036: is80ColumnsDisplay ? " " : "\r\n");
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	Z,00140$
	ld	-2 (ix),#<(__str_85)
	ld	-1 (ix),#>(__str_85)
	jr	00141$
00140$:
	ld	-2 (ix),#<(__str_86)
	ld	-1 (ix),#>(__str_86)
00141$:
;fdisk.c:1035: printf("WARNING: only partitions of 16M or less%scan be used in DOS 1 mode\r\n\r\n",
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#__str_84
	push	hl
	call	_printf
	pop	af
	pop	af
00104$:
;fdisk.c:1039: if(lessThan1MAvailable) {
	ld	a,-23 (ix)
	or	a, a
	jr	Z,00106$
;fdisk.c:1040: print("Enter");
	ld	hl,#__str_87
	push	hl
	call	_print
	pop	af
	jr	00107$
00106$:
;fdisk.c:1042: printf("Enter partition size in MB (1-%i)\r\nor",
	ld	hl,#__str_88
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	push	bc
	push	hl
	call	_printf
	pop	af
	pop	af
00107$:
;fdisk.c:1046: is80ColumnsDisplay ? " " : "\r\n",
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	Z,00142$
	ld	de,#__str_85
	jr	00143$
00142$:
	ld	de,#__str_86
00143$:
;fdisk.c:1045: printf(" partition size in KB followed by%s\"K\" (%i-%i): ", 
	ld	hl,#__str_89
	ld	c,-16 (ix)
	ld	b,-15 (ix)
	push	bc
	ld	bc,#0x0064
	push	bc
	push	de
	push	hl
	call	_printf
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
;fdisk.c:1050: buffer[0] = 6;
	ld	hl,#_buffer
	ld	(hl),#0x06
;fdisk.c:1051: regs.Words.DE = (int)buffer;
	ld	de,#_buffer
	ld	((_regs + 0x0004)), de
;fdisk.c:1052: DosCall(_BUFIN, REGS_NONE);
	ld	hl,#0x000A
	push	hl
	call	_DosCall
	pop	af
;fdisk.c:1053: lineLength = buffer[1];
	ld	hl, #_buffer + 1
	ld	c,(hl)
;fdisk.c:1054: if(lineLength == 0) {
	ld	a,c
	or	a, a
;fdisk.c:1055: return;
	jp	Z,00136$
;fdisk.c:1058: pointer = buffer + 2;
	ld	de,#(_buffer + 0x0002)
;fdisk.c:1059: pointer[lineLength] = '\0';
	ld	l,c
	ld	h,#0x00
	add	hl,de
	ld	(hl),#0x00
;fdisk.c:1060: enteredSizeInK = 0;
	xor	a, a
	ld	-22 (ix),a
	ld	-21 (ix),a
	ld	-20 (ix),a
	ld	-19 (ix),a
;fdisk.c:1061: while(true) {
	ld	-2 (ix),c
	ld	-4 (ix),e
	ld	-3 (ix),d
00124$:
;fdisk.c:1062: ch = (*pointer++) | 32;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	inc	-4 (ix)
	jr	NZ,00220$
	inc	-3 (ix)
00220$:
	set	5, a
;fdisk.c:1063: if(ch == 'k') {
	ld	-17 (ix), a
	sub	a, #0x6B
	jr	NZ,00119$
;fdisk.c:1064: validNumberEntered = true;
	ld	-18 (ix),#0x01
;fdisk.c:1065: break;
	jp	00125$
00119$:
;fdisk.c:1066: } else if(ch == '\0' || ch == 13 || ch == 'm') {
	ld	a,-17 (ix)
	or	a, a
	jr	Z,00113$
	ld	a,-17 (ix)
	sub	a, #0x0D
	jr	Z,00113$
	ld	a,-17 (ix)
	sub	a, #0x6D
	jr	NZ,00114$
00113$:
;fdisk.c:1067: validNumberEntered = true;
	ld	-18 (ix),#0x01
;fdisk.c:1068: enteredSizeInK *= 1024;
	push	af
	pop	af
	ld	b,#0x0A
00226$:
	sla	-22 (ix)
	rl	-21 (ix)
	rl	-20 (ix)
	rl	-19 (ix)
	djnz	00226$
;fdisk.c:1069: sizeInKSpecified = false;
	ld	-24 (ix),#0x00
;fdisk.c:1070: break;
	jp	00125$
00114$:
;fdisk.c:1071: } else if(ch < '0' || ch > '9') {
	ld	a,-17 (ix)
	xor	a, #0x80
	sub	a, #0xB0
	jp	C,00125$
	ld	a,#0x39
	sub	a, -17 (ix)
	jp	PO, 00228$
	xor	a, #0x80
00228$:
	jp	M,00125$
;fdisk.c:1074: enteredSizeInK = (enteredSizeInK * 10) + (ch - '0');
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	call	__mullong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-5 (ix),d
	ld	-6 (ix),e
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	h,-17 (ix)
	ld	a,-17 (ix)
	rla
	sbc	a, a
	ld	l,a
	ld	a,h
	add	a,#0xD0
	ld	h,a
	ld	a,l
	adc	a,#0xFF
	ld	l,a
	ld	-12 (ix),h
	ld	-11 (ix),l
	ld	a,l
	rla
	sbc	a, a
	ld	-10 (ix),a
	ld	-9 (ix),a
	ld	a,-8 (ix)
	add	a, -12 (ix)
	ld	-12 (ix),a
	ld	a,-7 (ix)
	adc	a, -11 (ix)
	ld	-11 (ix),a
	ld	a,-6 (ix)
	adc	a, -10 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	adc	a, -9 (ix)
	ld	-9 (ix),a
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	hl, #16
	add	hl, sp
	ld	bc, #4
	ldir
;fdisk.c:1076: lineLength--;
	dec	-2 (ix)
;fdisk.c:1077: if(lineLength == 0) {
	ld	a,-2 (ix)
	or	a, a
	jp	NZ,00124$
;fdisk.c:1078: validNumberEntered = true;
	ld	-18 (ix),#0x01
;fdisk.c:1079: enteredSizeInK *= 1024;
	push	af
	pop	af
	ld	b,#0x0A
00229$:
	sla	-22 (ix)
	rl	-21 (ix)
	rl	-20 (ix)
	rl	-19 (ix)
	djnz	00229$
;fdisk.c:1080: sizeInKSpecified = false;
	ld	-24 (ix),#0x00
;fdisk.c:1081: break;
00125$:
;fdisk.c:1085: if(validNumberEntered &&
	ld	a,-18 (ix)
	or	a, a
	jr	Z,00132$
;fdisk.c:1086: (sizeInKSpecified && (enteredSizeInK > maxPartitionSizeInK) || (enteredSizeInK < MIN_PARTITION_SIZE_IN_K)) ||
	ld	a,-24 (ix)
	or	a, a
	jr	Z,00129$
	ld	h,-16 (ix)
	ld	l,-15 (ix)
	ld	de,#0x0000
	ld	a,h
	sub	a, -22 (ix)
	ld	a,l
	sbc	a, -21 (ix)
	ld	a,d
	sbc	a, -20 (ix)
	ld	a,e
	sbc	a, -19 (ix)
	jr	C,00126$
00129$:
	ld	a,-22 (ix)
	sub	a, #0x64
	ld	a,-21 (ix)
	sbc	a, #0x00
	ld	a,-20 (ix)
	sbc	a, #0x00
	ld	a,-19 (ix)
	sbc	a, #0x00
	jr	C,00126$
00132$:
;fdisk.c:1087: (!sizeInKSpecified && (enteredSizeInK > ((ulong)maxPartitionSizeInM * (ulong)1024)))
	ld	a,-24 (ix)
	or	a, a
	jp	NZ,00133$
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	de,#0x0000
	push	af
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	-10 (ix),e
	ld	-9 (ix),d
	pop	af
	ld	a,#0x0A
00231$:
	sla	-12 (ix)
	rl	-11 (ix)
	rl	-10 (ix)
	rl	-9 (ix)
	dec	a
	jr	NZ,00231$
	ld	a,-12 (ix)
	sub	a, -22 (ix)
	ld	a,-11 (ix)
	sbc	a, -21 (ix)
	ld	a,-10 (ix)
	sbc	a, -20 (ix)
	ld	a,-9 (ix)
	sbc	a, -19 (ix)
	jp	NC,00133$
00126$:
;fdisk.c:1089: validNumberEntered = false;
	ld	-18 (ix),#0x00
	jp	00133$
00135$:
;fdisk.c:1093: autoPartitionSizeInK = enteredSizeInK > unpartitionnedSpaceExceptAlignmentInK ? unpartitionnedSpaceExceptAlignmentInK : enteredSizeInK;
	ld	a,-28 (ix)
	sub	a, -22 (ix)
	ld	a,-27 (ix)
	sbc	a, -21 (ix)
	ld	a,-26 (ix)
	sbc	a, -20 (ix)
	ld	a,-25 (ix)
	sbc	a, -19 (ix)
	jr	NC,00144$
	ld	hl, #16
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #4
	ldir
	jr	00145$
00144$:
	ld	hl, #16
	add	hl, sp
	ex	de, hl
	ld	hl, #6
	add	hl, sp
	ld	bc, #4
	ldir
00145$:
	ld	de, #_autoPartitionSizeInK
	ld	hl, #16
	add	hl, sp
	ld	bc, #4
	ldir
;fdisk.c:1094: AddAutoPartition();
	call	_AddAutoPartition
;fdisk.c:1095: unpartitionnedSpaceExceptAlignmentInK = (unpartitionnedSpaceInSectors - EXTRA_PARTITION_SECTORS) / 2;
	ld	a,(#_unpartitionnedSpaceInSectors + 0)
	add	a,#0xFF
	ld	d,a
	ld	a,(#_unpartitionnedSpaceInSectors + 1)
	adc	a,#0xFF
	ld	e,a
	ld	a,(#_unpartitionnedSpaceInSectors + 2)
	adc	a,#0xFF
	ld	b,a
	ld	iy,#_unpartitionnedSpaceInSectors
	ld	a,3 (iy)
	adc	a,#0xFF
	ld	c,a
	push	af
	ld	-28 (ix),d
	ld	-27 (ix),e
	ld	-26 (ix),b
	ld	-25 (ix),c
	pop	af
	srl	-25 (ix)
	rr	-26 (ix)
	rr	-27 (ix)
	rr	-28 (ix)
;fdisk.c:1096: autoPartitionSizeInK = enteredSizeInK > unpartitionnedSpaceExceptAlignmentInK ? unpartitionnedSpaceExceptAlignmentInK : enteredSizeInK;
	ld	a,-28 (ix)
	sub	a, -22 (ix)
	ld	a,-27 (ix)
	sbc	a, -21 (ix)
	ld	a,-26 (ix)
	sbc	a, -20 (ix)
	ld	a,-25 (ix)
	sbc	a, -19 (ix)
	jr	NC,00146$
	ld	hl, #16
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #4
	ldir
	jr	00147$
00146$:
	ld	hl, #16
	add	hl, sp
	ex	de, hl
	ld	hl, #6
	add	hl, sp
	ld	bc, #4
	ldir
00147$:
	ld	de, #_autoPartitionSizeInK
	ld	hl, #16
	add	hl, sp
	ld	bc, #4
	ldir
;fdisk.c:1097: RecalculateAutoPartitionSize(false);
	xor	a, a
	push	af
	inc	sp
	call	_RecalculateAutoPartitionSize
	inc	sp
00136$:
	ld	sp,ix
	pop	ix
	ret
_AddPartition_end::
__str_81:
	.ascii "Enter size or press ENTER to cancel"
	.db 0x00
__str_82:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_83:
	.ascii "Add new partition"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_84:
	.ascii "WARNING: only partitions of 16M or less%scan be used in DOS "
	.ascii "1 mode"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_85:
	.ascii " "
	.db 0x00
__str_86:
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_87:
	.ascii "Enter"
	.db 0x00
__str_88:
	.ascii "Enter partition size in MB (1-%i)"
	.db 0x0D
	.db 0x0A
	.ascii "or"
	.db 0x00
__str_89:
	.ascii " partition size in KB followed by%s"
	.db 0x22
	.ascii "K"
	.db 0x22
	.ascii " (%i-%i): "
	.db 0x00
;fdisk.c:1101: void AddAutoPartition()
;	---------------------------------
; Function AddAutoPartition
; ---------------------------------
_AddAutoPartition_start::
_AddAutoPartition:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;fdisk.c:1103: partitionInfo* partition = &partitions[partitionsCount];
	ld	bc,(_partitionsCount)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de,#_partitions
	add	hl,de
;fdisk.c:1105: partition->sizeInK = autoPartitionSizeInK;
	ld	e,l
	ld	d,h
	inc	hl
	inc	hl
	inc	hl
	ld	a,(#_autoPartitionSizeInK + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_autoPartitionSizeInK + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_autoPartitionSizeInK + 2)
	ld	(hl),a
	inc	hl
	ld	iy,#_autoPartitionSizeInK
	ld	a,3 (iy)
	ld	(hl),a
;fdisk.c:1106: partition->partitionType = 
	ld	hl,#0x0002
	add	hl,de
	ex	(sp), hl
;fdisk.c:1107: partition->sizeInK > MAX_FAT12_PARTITION_SIZE_IN_K ? PARTYPE_FAT16 : PARTYPE_FAT12;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	xor	a, a
	cp	a, c
	ld	a,#0x80
	sbc	a, b
	ld	a,#0x00
	sbc	a, l
	ld	a,#0x00
	sbc	a, h
	jr	NC,00106$
	ld	a,#0x06
	jr	00107$
00106$:
	ld	a,#0x01
00107$:
	pop	hl
	push	hl
	ld	(hl),a
;fdisk.c:1110: partition->extendedIndex = 0;
	ld	c, e
	ld	b, d
	inc	bc
;fdisk.c:1108: if(partitionsCount == 0) {
	ld	a,(#_partitionsCount + 1)
	ld	hl,#_partitionsCount + 0
	or	a,(hl)
	jr	NZ,00102$
;fdisk.c:1109: partition->primaryIndex = 1;
	ld	a,#0x01
	ld	(de),a
;fdisk.c:1110: partition->extendedIndex = 0;
	xor	a, a
	ld	(bc),a
	jr	00103$
00102$:
;fdisk.c:1112: partition->primaryIndex = 2;
	ld	a,#0x02
	ld	(de),a
;fdisk.c:1113: partition->extendedIndex = partitionsCount;
	ld	a,(#_partitionsCount + 0)
	ld	(bc),a
00103$:
;fdisk.c:1116: unpartitionnedSpaceInSectors -= (autoPartitionSizeInK * 2);
	push	af
	ld	hl,#_autoPartitionSizeInK + 0
	ld	d, (hl)
	ld	hl,#_autoPartitionSizeInK + 1
	ld	e, (hl)
	ld	hl,#_autoPartitionSizeInK + 2
	ld	b, (hl)
	ld	hl,#_autoPartitionSizeInK + 3
	ld	c, (hl)
	pop	af
	sla	d
	rl	e
	rl	b
	rl	c
	ld	hl,#_unpartitionnedSpaceInSectors
	ld	a,(hl)
	sub	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, e
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, b
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sbc	a, c
	ld	(hl),a
;fdisk.c:1117: unpartitionnedSpaceInSectors -= EXTRA_PARTITION_SECTORS;
	ld	hl,#_unpartitionnedSpaceInSectors
	ld	a,(hl)
	add	a,#0xFF
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a,#0xFF
	ld	(hl),a
;fdisk.c:1118: partitionsCount++;
	ld	hl, #_partitionsCount+0
	inc	(hl)
	jr	NZ,00116$
	ld	hl, #_partitionsCount+1
	inc	(hl)
00116$:
;fdisk.c:1119: RecalculateAutoPartitionSize(false);
	xor	a, a
	push	af
	inc	sp
	call	_RecalculateAutoPartitionSize
	ld	sp,ix
	pop	ix
	ret
_AddAutoPartition_end::
;fdisk.c:1123: void UndoAddPartition()
;	---------------------------------
; Function UndoAddPartition
; ---------------------------------
_UndoAddPartition_start::
_UndoAddPartition:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;fdisk.c:1125: partitionInfo* partition = &partitions[partitionsCount - 1];
	ld	a,(#_partitionsCount + 0)
	add	a,#0xFF
	ld	-2 (ix),a
	ld	a,(#_partitionsCount + 1)
	adc	a,#0xFF
	ld	-1 (ix),a
	pop	bc
	push	bc
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de,#_partitions
	add	hl,de
;fdisk.c:1126: autoPartitionSizeInK = partition->sizeInK;
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_autoPartitionSizeInK + 0
	ld	(hl), e
	ld	hl,#_autoPartitionSizeInK + 1
	ld	(hl), d
	ld	hl,#_autoPartitionSizeInK + 2
	ld	(hl), c
	ld	hl,#_autoPartitionSizeInK + 3
	ld	(hl), b
;fdisk.c:1127: unpartitionnedSpaceInSectors += (partition->sizeInK * 2);
	sla	e
	rl	d
	rl	c
	rl	b
	ld	hl,#_unpartitionnedSpaceInSectors
	ld	a,(hl)
	add	a, e
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, d
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, c
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	adc	a, b
	ld	(hl),a
;fdisk.c:1128: unpartitionnedSpaceInSectors += EXTRA_PARTITION_SECTORS;
	ld	hl, #_unpartitionnedSpaceInSectors+0
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_unpartitionnedSpaceInSectors+1
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_unpartitionnedSpaceInSectors+2
	inc	(hl)
	jr	NZ,00105$
	ld	hl, #_unpartitionnedSpaceInSectors+3
	inc	(hl)
00105$:
;fdisk.c:1129: partitionsCount--;
	pop	hl
	push	hl
	ld	(_partitionsCount),hl
;fdisk.c:1130: RecalculateAutoPartitionSize(false);
	xor	a, a
	push	af
	inc	sp
	call	_RecalculateAutoPartitionSize
	ld	sp,ix
	pop	ix
	ret
_UndoAddPartition_end::
;fdisk.c:1134: void TestDeviceAccess()
;	---------------------------------
; Function TestDeviceAccess
; ---------------------------------
_TestDeviceAccess_start::
_TestDeviceAccess:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-5
	add	hl,sp
	ld	sp,hl
;fdisk.c:1136: ulong sectorNumber = 0;
	xor	a, a
	ld	-4 (ix),a
	ld	-3 (ix),a
	ld	-2 (ix),a
	ld	-1 (ix),a
;fdisk.c:1137: char* message = "Now reading device sector ";
;fdisk.c:1138: byte messageLen = strlen(message);
	ld	hl,#__str_90
	push	hl
	call	_strlen
	pop	af
	ld	-5 (ix),l
;fdisk.c:1140: char* errorMessageHeader = "Error when reading sector ";
;fdisk.c:1142: InitializeScreenForTestDeviceAccess(message);
	ld	hl,#__str_90
	push	hl
	call	_InitializeScreenForTestDeviceAccess
	pop	af
;fdisk.c:1144: while(GetKey() == 0) {
00107$:
	call	_GetKey
	ld	a,l
	or	a, a
	jp	NZ,00110$
;fdisk.c:1145: _ultoa(sectorNumber, buffer, 10);
	ld	de,#_buffer
	ld	a,#0x0A
	push	af
	inc	sp
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__ultoa
	ld	hl,#0x0007
	add	hl,sp
	ld	sp,hl
;fdisk.c:1146: Locate(messageLen, MESSAGE_ROW);
	ld	a,#0x09
	push	af
	inc	sp
	ld	a,-5 (ix)
	push	af
	inc	sp
	call	_Locate
;fdisk.c:1147: print(buffer);
	ld	hl, #_buffer
	ex	(sp),hl
	call	_print
;fdisk.c:1148: print(" ...\x1BK");
	ld	hl, #__str_92
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:1150: regs.Flags.C = 0;
	ld	hl,#_regs
	ld	a,(hl)
	and	a,#0xFE
	ld	(hl),a
;fdisk.c:1151: regs.Bytes.A = selectedDeviceIndex;
	ld	hl,#_regs + 1
	ld	a,(#_selectedDeviceIndex + 0)
	ld	(hl),a
;fdisk.c:1152: regs.Bytes.B = 1;
	ld	hl,#_regs + 3
	ld	(hl),#0x01
;fdisk.c:1153: regs.Bytes.C = selectedLunIndex + 1;
	ld	de,#_regs + 2
	ld	a,(#_selectedLunIndex + 0)
	inc	a
	ld	(de),a
;fdisk.c:1154: regs.Words.HL = (int)buffer;
	ld	de,#_buffer
	ld	((_regs + 0x0006)), de
;fdisk.c:1155: regs.Words.DE = (int)&sectorNumber;
	ld	hl,#0x0001
	add	hl,sp
	ex	de,hl
	ld	((_regs + 0x0004)), de
;fdisk.c:1156: DriverCall(selectedDriver->slot, DEV_RW);
	ld	hl,(_selectedDriver)
	ld	h,(hl)
	ld	bc,#0x4160
	push	bc
	push	hl
	inc	sp
	call	_DriverCall
	pop	af
	inc	sp
;fdisk.c:1158: if((error = regs.Bytes.A) != 0) {
	ld	a, (#_regs + 1)
	ld	c,a
	or	a, a
	jr	Z,00104$
;fdisk.c:1159: strcpy(buffer, errorMessageHeader);
	ld	de,#_buffer
	push	bc
	ld	hl,#__str_91
	xor	a, a
00127$:
	cp	a, (hl)
	ldi
	jr	NZ, 00127$
	ld	hl,#__str_91
	push	hl
	call	_strlen
	pop	af
	pop	bc
	ld	de,#_buffer
	add	hl,de
	ex	de,hl
	push	bc
	ld	a,#0x0A
	push	af
	inc	sp
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__ultoa
	ld	hl,#0x0007
	add	hl,sp
	ld	sp,hl
	pop	bc
;fdisk.c:1161: strcpy(buffer + strlen(buffer), ":");
	ld	hl,#_buffer
	push	bc
	push	hl
	call	_strlen
	pop	af
	pop	bc
	ld	de,#_buffer
	add	hl,de
	ld	de,#__str_93
	push	bc
	ex	de, hl
	xor	a, a
00128$:
	cp	a, (hl)
	ldi
	jr	NZ, 00128$
	pop	bc
;fdisk.c:1162: PrintDosErrorMessage(error, buffer);
	ld	hl,#_buffer
	push	hl
	ld	a,c
	push	af
	inc	sp
	call	_PrintDosErrorMessage
;fdisk.c:1163: PrintStateMessage("Continue reading sectors? (y/n) ");
	inc	sp
	ld	hl,#__str_94
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:1164: if(!GetYesOrNo()) {
	call	_GetYesOrNo
	ld	a,l
	or	a, a
;fdisk.c:1165: return;
	jr	Z,00110$
;fdisk.c:1167: InitializeScreenForTestDeviceAccess(message);
	ld	hl,#__str_90
	push	hl
	call	_InitializeScreenForTestDeviceAccess
	pop	af
00104$:
;fdisk.c:1170: sectorNumber++;
	inc	-4 (ix)
	jr	NZ,00129$
	inc	-3 (ix)
	jr	NZ,00129$
	inc	-2 (ix)
	jr	NZ,00129$
	inc	-1 (ix)
00129$:
;fdisk.c:1171: if(sectorNumber >= selectedLun->sectorCount) {
	ld	hl,(_selectedLun)
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,-4 (ix)
	sub	a, e
	ld	a,-3 (ix)
	sbc	a, d
	ld	a,-2 (ix)
	sbc	a, c
	ld	a,-1 (ix)
	sbc	a, h
	jp	C,00107$
;fdisk.c:1172: sectorNumber = 0;
	xor	a, a
	ld	-4 (ix),a
	ld	-3 (ix),a
	ld	-2 (ix),a
	ld	-1 (ix),a
	jp	00107$
00110$:
	ld	sp,ix
	pop	ix
	ret
_TestDeviceAccess_end::
__str_90:
	.ascii "Now reading device sector "
	.db 0x00
__str_91:
	.ascii "Error when reading sector "
	.db 0x00
__str_92:
	.ascii " ..."
	.db 0x1B
	.ascii "K"
	.db 0x00
__str_93:
	.ascii ":"
	.db 0x00
__str_94:
	.ascii "Continue reading sectors? (y/n) "
	.db 0x00
;fdisk.c:1178: void InitializeScreenForTestDeviceAccess(char* message)
;	---------------------------------
; Function InitializeScreenForTestDeviceAccess
; ---------------------------------
_InitializeScreenForTestDeviceAccess_start::
_InitializeScreenForTestDeviceAccess:
;fdisk.c:1180: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:1181: PrintTargetInfo();
	call	_PrintTargetInfo
;fdisk.c:1182: Locate(0, MESSAGE_ROW);
	ld	hl,#0x0900
	push	hl
	call	_Locate
	pop	af
;fdisk.c:1183: print(message);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_print
;fdisk.c:1184: PrintStateMessage("Press any key to stop...");
	ld	hl, #__str_95
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
	ret
_InitializeScreenForTestDeviceAccess_end::
__str_95:
	.ascii "Press any key to stop..."
	.db 0x00
;fdisk.c:1188: void PrintDosErrorMessage(byte code, char* header)
;	---------------------------------
; Function PrintDosErrorMessage
; ---------------------------------
_PrintDosErrorMessage_start::
_PrintDosErrorMessage:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:1190: Locate(0, MESSAGE_ROW);
	ld	hl,#0x0900
	push	hl
	call	_Locate
	pop	af
;fdisk.c:1191: PrintCentered(header);
	ld	l,5 (ix)
	ld	h,6 (ix)
	push	hl
	call	_PrintCentered
;fdisk.c:1192: NewLine();
	ld	hl, #__str_96
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:1194: regs.Bytes.B = code;
	ld	hl,#_regs + 3
	ld	a,4 (ix)
	ld	(hl),a
;fdisk.c:1195: regs.Words.DE = (int)buffer;
	ld	de,#_buffer
	ld	c, e
	ld	b, d
	ld	((_regs + 0x0004)), bc
;fdisk.c:1196: DosCall(_EXPLAIN, REGS_NONE);
	push	de
	ld	hl,#0x0066
	push	hl
	call	_DosCall
	pop	af
	pop	de
;fdisk.c:1197: if(strlen(buffer) > currentScreenConfig.screenWidth) {
	ld	l, e
	ld	h, d
	push	de
	push	hl
	call	_strlen
	pop	af
	ld	c,l
	ld	b,h
	pop	de
	ld	a, (#_currentScreenConfig + 1)
	ld	l,a
	ld	h,#0x00
	cp	a, a
	sbc	hl, bc
	jr	NC,00102$
;fdisk.c:1198: print(buffer);
	push	de
	call	_print
	pop	af
	jr	00103$
00102$:
;fdisk.c:1200: PrintCentered(buffer);
	push	de
	call	_PrintCentered
	pop	af
00103$:
;fdisk.c:1203: PrintStateMessage("Press any key to return...");
	ld	hl,#__str_97
	push	hl
	call	_PrintStateMessage
	pop	af
	pop	ix
	ret
_PrintDosErrorMessage_end::
__str_96:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_97:
	.ascii "Press any key to return..."
	.db 0x00
;fdisk.c:1207: void PrintDone()
;	---------------------------------
; Function PrintDone
; ---------------------------------
_PrintDone_start::
_PrintDone:
;fdisk.c:1209: PrintCentered("Done!");
	ld	hl,#__str_98
	push	hl
	call	_PrintCentered
;fdisk.c:1210: print("\x0A\x0D\x0A\x0A\x0A");
	ld	hl, #__str_99
	ex	(sp),hl
	call	_print
;fdisk.c:1211: PrintCentered("If this device had drives mapped to,");
	ld	hl, #__str_100
	ex	(sp),hl
	call	_PrintCentered
;fdisk.c:1212: NewLine();
	ld	hl, #__str_101
	ex	(sp),hl
	call	_print
;fdisk.c:1213: PrintCentered("please reset the computer.");
	ld	hl, #__str_102
	ex	(sp),hl
	call	_PrintCentered
	pop	af
	ret
_PrintDone_end::
__str_98:
	.ascii "Done!"
	.db 0x00
__str_99:
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x00
__str_100:
	.ascii "If this device had drives mapped to,"
	.db 0x00
__str_101:
	.db 0x0A
	.db 0x0D
	.db 0x00
__str_102:
	.ascii "please reset the computer."
	.db 0x00
;fdisk.c:1216: bool FormatWithoutPartitions()
;	---------------------------------
; Function FormatWithoutPartitions
; ---------------------------------
_FormatWithoutPartitions_start::
_FormatWithoutPartitions:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;fdisk.c:1221: if(!ConfirmDataDestroy("Format device without partitions")) {
	ld	hl,#__str_103
	push	hl
	call	_ConfirmDataDestroy
	pop	af
	ld	a,l
;fdisk.c:1222: return false;
	or	a,a
	jr	NZ,00102$
	ld	l,a
	jp	00106$
00102$:
;fdisk.c:1225: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:1226: PrintTargetInfo();
	call	_PrintTargetInfo
;fdisk.c:1227: Locate(0, MESSAGE_ROW);
	ld	hl,#0x0900
	push	hl
	call	_Locate
;fdisk.c:1228: PrintCentered("Formatting the device...");
	ld	hl, #__str_104
	ex	(sp),hl
	call	_PrintCentered
;fdisk.c:1229: PrintStateMessage("Please wait...");
	ld	hl, #__str_105
	ex	(sp),hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:1236: error = CreateFatFileSystem(0, selectedLun->sectorCount / 2);
	ld	hl,(_selectedLun)
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	rr	d
	rr	e
	push	bc
	push	de
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_CreateFatFileSystem
	pop	af
	pop	af
	pop	af
	pop	af
	ld	d,l
;fdisk.c:1237: if(error == 0) {
	ld	a,d
	or	a, a
	jr	NZ,00104$
;fdisk.c:1238: Locate(0, MESSAGE_ROW + 2);
	push	de
	ld	hl,#0x0B00
	push	hl
	call	_Locate
	pop	af
	call	_PrintDone
	pop	de
;fdisk.c:1240: PrintStateMessage("Press any key to return...");
	ld	hl,#__str_106
	push	de
	push	hl
	call	_PrintStateMessage
	pop	af
	pop	de
	jr	00105$
00104$:
;fdisk.c:1242: PrintDosErrorMessage(error, "Error when formatting device:");
	ld	hl,#__str_107
	push	de
	push	hl
	push	de
	inc	sp
	call	_PrintDosErrorMessage
	pop	af
	inc	sp
	pop	de
00105$:
;fdisk.c:1244: WaitKey();
	push	de
	call	_WaitKey
	pop	de
;fdisk.c:1245: return (error == 0);
	ld	a,d
	or	a, a
	jr	NZ,00116$
	ld	a,#0x01
	jr	00117$
00116$:
	xor	a,a
00117$:
	ld	l,a
00106$:
	ld	sp,ix
	pop	ix
	ret
_FormatWithoutPartitions_end::
__str_103:
	.ascii "Format device without partitions"
	.db 0x00
__str_104:
	.ascii "Formatting the device..."
	.db 0x00
__str_105:
	.ascii "Please wait..."
	.db 0x00
__str_106:
	.ascii "Press any key to return..."
	.db 0x00
__str_107:
	.ascii "Error when formatting device:"
	.db 0x00
;fdisk.c:1250: byte CreateFatFileSystem(ulong firstDeviceSector, ulong fileSystemSizeInK)
;	---------------------------------
; Function CreateFatFileSystem
; ---------------------------------
_CreateFatFileSystem_start::
_CreateFatFileSystem:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;fdisk.c:1252: byte* remoteCallParams = buffer;
;fdisk.c:1254: remoteCallParams[0] = selectedDriver->slot;
	ld	hl,(_selectedDriver)
	ld	a,(hl)
	ld	hl,#_buffer
	ld	(hl),a
;fdisk.c:1255: remoteCallParams[1] = selectedDeviceIndex;
	inc	hl
	ld	a,(#_selectedDeviceIndex + 0)
	ld	(hl),a
;fdisk.c:1256: remoteCallParams[2] = selectedLunIndex + 1;
	ld	de,#_buffer + 2
	ld	a,(#_selectedLunIndex + 0)
	inc	a
	ld	(de),a
;fdisk.c:1257: *((ulong*)&remoteCallParams[3]) = 0;
	ld	hl,#_buffer + 3
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;fdisk.c:1258: *((ulong*)&remoteCallParams[7]) = selectedLun->sectorCount / 2;
	ld	-2 (ix),#<((_buffer + 0x0007))
	ld	-1 (ix),#>((_buffer + 0x0007))
	ld	hl,(_selectedLun)
	inc	hl
	inc	hl
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	push	af
	ld	-6 (ix),d
	ld	-5 (ix),b
	ld	-4 (ix),e
	ld	-3 (ix),h
	pop	af
	srl	-3 (ix)
	rr	-4 (ix)
	rr	-5 (ix)
	rr	-6 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0000
	add	hl, sp
	ld	bc, #0x0004
	ldir
;fdisk.c:1260: return (byte)CallFunctionInExtraBank(f_CreateFatFileSystem, remoteCallParams);
	ld	hl,#_buffer
	push	hl
	ld	hl,#0x0002
	push	hl
	call	_CallFunctionInExtraBank
	ld	sp,ix
	pop	ix
	ret
_CreateFatFileSystem_end::
;fdisk.c:1275: bool WritePartitionTable()
;	---------------------------------
; Function WritePartitionTable
; ---------------------------------
_WritePartitionTable_start::
_WritePartitionTable:
;fdisk.c:1283: if(partitionsCount <= 4) {
	ld	a,#0x04
	ld	iy,#_partitionsCount
	cp	a, 0 (iy)
	ld	a,#0x00
	ld	iy,#_partitionsCount
	sbc	a, 1 (iy)
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	M,00102$
;fdisk.c:1284: sprintf(buffer, "Create %i primary partitions on device", partitionsCount);
	ld	de,#__str_108
	ld	bc,#_buffer
	ld	hl,(_partitionsCount)
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
	jr	00103$
00102$:
;fdisk.c:1286: sprintf(buffer, "Create %i partitions on device", partitionsCount);
	ld	de,#_buffer
	ld	hl,(_partitionsCount)
	push	hl
	ld	hl,#__str_109
	push	hl
	push	de
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
00103$:
;fdisk.c:1288: if(!ConfirmDataDestroy(buffer)) {
	ld	hl,#_buffer
	push	hl
	call	_ConfirmDataDestroy
	pop	af
	ld	a,l
;fdisk.c:1289: return false;
	or	a,a
	jr	NZ,00105$
	ld	l,a
	ret
00105$:
;fdisk.c:1292: ClearInformationArea();
	call	_ClearInformationArea
;fdisk.c:1293: PrintTargetInfo();
	call	_PrintTargetInfo
;fdisk.c:1294: PrintStateMessage("Please wait...");
	ld	hl,#__str_110
	push	hl
	call	_PrintStateMessage
;fdisk.c:1296: Locate(0, MESSAGE_ROW);
	ld	hl, #0x0900
	ex	(sp),hl
	call	_Locate
;fdisk.c:1297: PrintCentered("Preparing partitionning process...");
	ld	hl, #__str_111
	ex	(sp),hl
	call	_PrintCentered
	pop	af
;fdisk.c:1298: PreparePartitionningProcess();
	call	_PreparePartitionningProcess
;fdisk.c:1300: for(i = 0; i < partitionsCount; i++) {
	ld	bc,#0x0000
00110$:
	ld	hl,#_partitionsCount
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P,00108$
;fdisk.c:1301: Locate(0, MESSAGE_ROW);
	push	bc
	ld	hl,#0x0900
	push	hl
	call	_Locate
	pop	af
	pop	bc
;fdisk.c:1302: sprintf(buffer, "Creating partition %i of %i ...", i + 1, partitionsCount);
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	push	de
	ld	hl,(_partitionsCount)
	push	hl
	push	de
	ld	hl,#__str_112
	push	hl
	ld	hl,#_buffer
	push	hl
	call	_sprintf
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	pop	de
	pop	bc
;fdisk.c:1303: PrintCentered(buffer);
	ld	hl,#_buffer
	push	bc
	push	de
	push	hl
	call	_PrintCentered
	pop	af
	pop	de
	pop	bc
;fdisk.c:1305: error = CreatePartition(i);
	push	de
	push	bc
	call	_CreatePartition
	pop	af
	pop	de
;fdisk.c:1306: if(error != 0) {
	ld	a,l
	or	a, a
	jr	Z,00111$
;fdisk.c:1307: sprintf(buffer, "Error when creating partition %i :", i + 1);
	ld	bc,#__str_113
	push	hl
	push	de
	push	bc
	ld	bc,#_buffer
	push	bc
	call	_sprintf
	ld	hl,#0x0006
	add	hl,sp
	ld	sp,hl
	pop	hl
;fdisk.c:1308: PrintDosErrorMessage(error, buffer);
	ld	de,#_buffer
	push	de
	ld	a,l
	push	af
	inc	sp
	call	_PrintDosErrorMessage
	pop	af
	inc	sp
;fdisk.c:1309: WaitKey();
	call	_WaitKey
;fdisk.c:1310: return false;
	ld	l,#0x00
	ret
00111$:
;fdisk.c:1300: for(i = 0; i < partitionsCount; i++) {
	ld	c, e
	ld	b, d
	jr	00110$
00108$:
;fdisk.c:1316: Locate(0, MESSAGE_ROW + 2);
	ld	hl,#0x0B00
	push	hl
	call	_Locate
	pop	af
;fdisk.c:1317: PrintDone();
	call	_PrintDone
;fdisk.c:1318: PrintStateMessage("Press any key to return...");
	ld	hl,#__str_114
	push	hl
	call	_PrintStateMessage
	pop	af
;fdisk.c:1319: WaitKey();
	call	_WaitKey
;fdisk.c:1320: return true;
	ld	l,#0x01
	ret
_WritePartitionTable_end::
__str_108:
	.ascii "Create %i primary partitions on device"
	.db 0x00
__str_109:
	.ascii "Create %i partitions on device"
	.db 0x00
__str_110:
	.ascii "Please wait..."
	.db 0x00
__str_111:
	.ascii "Preparing partitionning process..."
	.db 0x00
__str_112:
	.ascii "Creating partition %i of %i ..."
	.db 0x00
__str_113:
	.ascii "Error when creating partition %i :"
	.db 0x00
__str_114:
	.ascii "Press any key to return..."
	.db 0x00
;fdisk.c:1324: void PreparePartitionningProcess()
;	---------------------------------
; Function PreparePartitionningProcess
; ---------------------------------
_PreparePartitionningProcess_start::
_PreparePartitionningProcess:
;fdisk.c:1326: byte* remoteCallParams = buffer;
;fdisk.c:1328: remoteCallParams[0] = selectedDriver->slot;
	ld	hl,(_selectedDriver)
	ld	a,(hl)
	ld	hl,#_buffer
	ld	(hl),a
;fdisk.c:1329: remoteCallParams[1] = selectedDeviceIndex;
	inc	hl
	ld	a,(#_selectedDeviceIndex + 0)
	ld	(hl),a
;fdisk.c:1330: remoteCallParams[2] = selectedLunIndex + 1;
	ld	a,(#_selectedLunIndex + 0)
	inc	a
	ld	(#(_buffer + 0x0002)),a
;fdisk.c:1331: *((uint*)&remoteCallParams[3]) = partitionsCount;
	ld	hl,#(_buffer + 0x0003)
	ld	a,(#_partitionsCount + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_partitionsCount + 1)
	ld	(hl),a
;fdisk.c:1332: *((partitionInfo**)&remoteCallParams[5]) = &partitions[0];
	ld	de,#(_buffer + 0x0005)
	ld	a,#<(_partitions)
	ld	(de),a
	inc	de
	ld	a,#>(_partitions)
	ld	(de),a
;fdisk.c:1333: *((uint*)&remoteCallParams[7]) = luns[selectedLunIndex].sectorsPerTrack;
	ld	de,#(_buffer + 0x0007)
	ld	bc,(_selectedLunIndex)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_luns
	add	hl,bc
	ld	bc, #0x000B
	add	hl, bc
	ld	c,(hl)
	ld	b,#0x00
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;fdisk.c:1335: CallFunctionInExtraBank(f_PreparePartitionningProcess, remoteCallParams);
	ld	hl,#_buffer
	push	hl
	ld	hl,#0x0003
	push	hl
	call	_CallFunctionInExtraBank
	pop	af
	pop	af
	ret
_PreparePartitionningProcess_end::
;fdisk.c:1339: byte CreatePartition(int index)
;	---------------------------------
; Function CreatePartition
; ---------------------------------
_CreatePartition_start::
_CreatePartition:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:1341: byte* remoteCallParams = buffer;
	ld	de,#_buffer
;fdisk.c:1343: *((uint*)&remoteCallParams[0]) = index;
	ld	l, e
	ld	h, d
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;fdisk.c:1345: return (byte)CallFunctionInExtraBank(f_CreatePartition, remoteCallParams);
	push	de
	ld	hl,#0x0004
	push	hl
	call	_CallFunctionInExtraBank
	pop	af
	pop	af
	pop	ix
	ret
_CreatePartition_end::
;fdisk.c:1349: bool ConfirmDataDestroy(char* action)
;	---------------------------------
; Function ConfirmDataDestroy
; ---------------------------------
_ConfirmDataDestroy_start::
_ConfirmDataDestroy:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:1351: char* spaceOrNewLine = is80ColumnsDisplay ? " " : "\r\n";
	ld	a,(#_is80ColumnsDisplay + 0)
	or	a, a
	jr	Z,00103$
	ld	de,#__str_115
	jr	00104$
00103$:
	ld	de,#__str_116
00104$:
;fdisk.c:1353: PrintStateMessage("");
	ld	hl,#__str_117
	push	de
	push	hl
	call	_PrintStateMessage
	pop	af
	call	_ClearInformationArea
	call	_PrintTargetInfo
	ld	hl,#0x0900
	push	hl
	call	_Locate
	pop	af
	pop	de
;fdisk.c:1363: "Are you sure? (y/n) ",
	ld	hl,#__str_118
	push	de
	push	de
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	push	hl
	call	_printf
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
;fdisk.c:1368: return GetYesOrNo();
	pop	ix
	jp	_GetYesOrNo
_ConfirmDataDestroy_end::
__str_115:
	.ascii " "
	.db 0x00
__str_116:
	.db 0x0D
	.db 0x0A
	.db 0x00
__str_117:
	.db 0x00
__str_118:
	.ascii "%s"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.ascii "THIS WILL DESTROY%sALL DATA ON THE DEVICE!!"
	.db 0x0D
	.db 0x0A
	.ascii "This acti"
	.ascii "on can't be cancelled%sand can't be undone"
	.db 0x0D
	.db 0x0A
	.db 0x0D
	.db 0x0A
	.ascii "Are you sure? "
	.ascii "(y/n) "
	.db 0x00
;fdisk.c:1372: void ClearInformationArea()
;	---------------------------------
; Function ClearInformationArea
; ---------------------------------
_ClearInformationArea_start::
_ClearInformationArea:
;fdisk.c:1376: Locate(0, 2);
	ld	hl,#0x0200
	push	hl
	call	_Locate
	pop	af
;fdisk.c:1377: for(i = 0; i < screenLinesCount - 4; i++) {
	ld	de,#0x0000
00103$:
	ld	iy,#_screenLinesCount
	ld	a, 0 (iy)
	ld	h, #0x00
	add	a,#0xFC
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00114$
	xor	a, #0x80
00114$:
	ret	P
;fdisk.c:1378: DeleteToEndOfLineAndCursorDown();
	ld	hl,#__str_119
	push	de
	push	hl
	call	_print
	pop	af
	pop	de
;fdisk.c:1377: for(i = 0; i < screenLinesCount - 4; i++) {
	inc	de
	jr	00103$
	ret
_ClearInformationArea_end::
__str_119:
	.db 0x1B
	.ascii "K"
	.db 0x1F
	.db 0x00
;fdisk.c:1383: void GetDriversInformation()
;	---------------------------------
; Function GetDriversInformation
; ---------------------------------
_GetDriversInformation_start::
_GetDriversInformation:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;fdisk.c:1385: byte error = 0;
	ld	c,#0x00
;fdisk.c:1387: driverInfo* currentDriver = &drivers[0];
	ld	-2 (ix),#<(_drivers)
	ld	-1 (ix),#>(_drivers)
;fdisk.c:1389: installedDriversCount = 0;
	ld	hl,#_installedDriversCount + 0
	ld	(hl), #0x00
;fdisk.c:1411: while(error == 0 && driverIndex <= MAX_INSTALLED_DRIVERS) {
	ld	e,#0x01
00105$:
	ld	a,c
	or	a, a
	jr	NZ,00108$
	ld	a,#0x08
	sub	a, e
	jr	C,00108$
;fdisk.c:1412: regs.Bytes.A = driverIndex;
	ld	hl,#_regs + 1
	ld	(hl),e
;fdisk.c:1413: regs.Words.HL = (int)currentDriver;
	pop	bc
	push	bc
	ld	((_regs + 0x0006)), bc
;fdisk.c:1414: DosCall(_GDRVR, REGS_AF);
	push	de
	ld	hl,#0x0178
	push	hl
	call	_DosCall
	pop	af
	pop	de
;fdisk.c:1415: if((error = regs.Bytes.A) == 0 && (currentDriver->flags & (DRIVER_IS_DOS250 | DRIVER_IS_DEVICE_BASED) == (DRIVER_IS_DOS250 | DRIVER_IS_DEVICE_BASED))) {
	ld	a, (#_regs + 1)
	ld	c,a
	or	a, a
	jr	NZ,00102$
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	rrca
	jr	NC,00102$
;fdisk.c:1416: installedDriversCount++;
	ld	hl, #_installedDriversCount+0
	inc	(hl)
;fdisk.c:1417: TerminateRightPaddedStringWithZero(currentDriver->driverName, DRIVER_NAME_LENGTH);
	ld	a,-2 (ix)
	add	a, #0x08
	ld	d,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	b,a
	push	bc
	push	de
	ld	a,#0x20
	push	af
	inc	sp
	ld	c,d
	push	bc
	call	_TerminateRightPaddedStringWithZero
	pop	af
	inc	sp
	pop	de
	pop	bc
;fdisk.c:1418: currentDriver++;
	ld	a,-2 (ix)
	add	a, #0x40
	ld	-2 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
00102$:
;fdisk.c:1420: driverIndex++;
	inc	e
	jr	00105$
00108$:
	ld	sp,ix
	pop	ix
	ret
_GetDriversInformation_end::
;fdisk.c:1426: void TerminateRightPaddedStringWithZero(char* string, byte length)
;	---------------------------------
; Function TerminateRightPaddedStringWithZero
; ---------------------------------
_TerminateRightPaddedStringWithZero_start::
_TerminateRightPaddedStringWithZero:
;fdisk.c:1428: char* pointer = string + length - 1;
	ld	hl,#4
	add	hl,sp
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	add	a, (hl)
	ld	e,a
	ld	a,1 (iy)
	adc	a, #0x00
	ld	d,a
	dec	de
;fdisk.c:1429: while(*pointer == ' ' && length > 0) {
	ld	hl, #4+0
	add	hl, sp
	ld	b, (hl)
00102$:
	ld	a,(de)
	sub	a,#0x20
	jr	NZ,00104$
	or	a,b
	jr	Z,00104$
;fdisk.c:1430: pointer--;
	dec	de
;fdisk.c:1431: length--;
	dec	b
	jr	00102$
00104$:
;fdisk.c:1433: pointer[1] = '\0';
	inc	de
	xor	a, a
	ld	(de),a
	ret
_TerminateRightPaddedStringWithZero_end::
;fdisk.c:1437: byte WaitKey()
;	---------------------------------
; Function WaitKey
; ---------------------------------
_WaitKey_start::
_WaitKey:
;fdisk.c:1441: while((key = GetKey()) == 0);
00101$:
	call	_GetKey
	ld	a,l
	or	a, a
	jr	Z,00101$
;fdisk.c:1442: return key;
	ret
_WaitKey_end::
;fdisk.c:1446: byte GetKey()
;	---------------------------------
; Function GetKey
; ---------------------------------
_GetKey_start::
_GetKey:
;fdisk.c:1448: regs.Bytes.E = 0xFF;
	ld	hl,#_regs + 4
	ld	(hl),#0xFF
;fdisk.c:1449: DosCall(_DIRIO, REGS_AF);
	ld	hl,#0x0106
	push	hl
	call	_DosCall
	pop	af
;fdisk.c:1450: return regs.Bytes.A;
	ld	a, (#_regs + 1)
	ld	l,a
	ret
_GetKey_end::
;fdisk.c:1454: void SaveOriginalScreenConfiguration()
;	---------------------------------
; Function SaveOriginalScreenConfiguration
; ---------------------------------
_SaveOriginalScreenConfiguration_start::
_SaveOriginalScreenConfiguration:
;fdisk.c:1456: originalScreenConfig.screenMode = *(byte*)SCRMOD;
	ld	a,(#0xFCAF)
	ld	(#_originalScreenConfig),a
;fdisk.c:1457: originalScreenConfig.screenWidth = *(byte*)LINLEN;
	ld	a,(#0xF3B0)
	ld	(#(_originalScreenConfig + 0x0001)),a
;fdisk.c:1458: originalScreenConfig.functionKeysVisible = (*(byte*)CNSDFG != 0);
	ld	a,(#0xF3DE)
	or	a,a
	jr	Z,00104$
	ld	a,#0x01
00104$:
	ld	d,a
	ld	hl,#(_originalScreenConfig + 0x0002)
	ld	(hl),d
	ret
_SaveOriginalScreenConfiguration_end::
;fdisk.c:1462: void ComposeWorkScreenConfiguration()
;	---------------------------------
; Function ComposeWorkScreenConfiguration
; ---------------------------------
_ComposeWorkScreenConfiguration_start::
_ComposeWorkScreenConfiguration:
;fdisk.c:1464: currentScreenConfig.screenMode = 0;
	ld	hl,#_currentScreenConfig
	ld	(hl),#0x00
;fdisk.c:1465: currentScreenConfig.screenWidth = (*(byte*)LINLEN <= MAX_LINLEN_MSX1 ? MAX_LINLEN_MSX1 : MAX_LINLEN_MSX2);
	ld	hl,#0xF3B0
	ld	l,(hl)
	ld	a,#0x28
	sub	a, l
	ld	a,#0x00
	ccf
	rla
	or	a, a
	jr	Z,00103$
	ld	d,#0x28
	jr	00104$
00103$:
	ld	d,#0x50
00104$:
	ld	hl,#(_currentScreenConfig + 0x0001)
	ld	(hl),d
;fdisk.c:1466: currentScreenConfig.functionKeysVisible = false;
	ld	hl,#_currentScreenConfig + 2
	ld	(hl),#0x00
;fdisk.c:1467: is80ColumnsDisplay = (currentScreenConfig.screenWidth == MAX_LINLEN_MSX2);
	ld	a,d
	sub	a, #0x50
	jr	NZ,00108$
	ld	a,#0x01
	jr	00109$
00108$:
	xor	a,a
00109$:
	ld	(#_is80ColumnsDisplay + 0),a
;fdisk.c:1468: screenLinesCount = *(byte*)CRTCNT;
	ld	a,(#0xF3B1)
	ld	(#_screenLinesCount + 0),a
	ret
_ComposeWorkScreenConfiguration_end::
;fdisk.c:1472: void SetScreenConfiguration(ScreenConfiguration* screenConfig)
;	---------------------------------
; Function SetScreenConfiguration
; ---------------------------------
_SetScreenConfiguration_start::
_SetScreenConfiguration:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:1474: if(screenConfig->screenMode == 0) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	or	a, a
	jr	NZ,00102$
;fdisk.c:1475: *((byte*)LINL40) = screenConfig->screenWidth;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,(hl)
	ld	(#0xF3AE),a
;fdisk.c:1476: AsmCall(INITXT, &regs, REGS_NONE, REGS_NONE);
	ld	de,#_regs
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	push	de
	ld	l, #0x6C
	push	hl
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	pop	bc
	jr	00103$
00102$:
;fdisk.c:1478: *((byte*)LINL32) = screenConfig->screenWidth;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,(hl)
	ld	(#0xF3AF),a
;fdisk.c:1479: AsmCall(INIT32, &regs, REGS_NONE, REGS_NONE);
	ld	de,#_regs
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	push	de
	ld	l, #0x6F
	push	hl
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	pop	bc
00103$:
;fdisk.c:1482: AsmCall(screenConfig->functionKeysVisible ? DSPFNK : ERAFNK, &regs, REGS_NONE, REGS_NONE);
	ld	de,#_regs
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00106$
	ld	c,#0xCF
	jr	00107$
00106$:
	ld	c,#0xCC
00107$:
	ld	b,#0x00
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	push	de
	push	bc
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	pop	ix
	ret
_SetScreenConfiguration_end::
;fdisk.c:1486: void InitializeWorkingScreen(char* header)
;	---------------------------------
; Function InitializeWorkingScreen
; ---------------------------------
_InitializeWorkingScreen_start::
_InitializeWorkingScreen:
;fdisk.c:1488: ClearScreen();
	ld	a,#0x0C
	push	af
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:1489: PrintCentered(header);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_PrintCentered
;fdisk.c:1490: CursorDown();
	ld	h,#0x1F
	ex	(sp),hl
	inc	sp
	call	_putchar
	inc	sp
;fdisk.c:1491: PrintRuler();
	call	_PrintRuler
;fdisk.c:1492: Locate(0, screenLinesCount - 2);
	ld	hl,#_screenLinesCount + 0
	ld	d, (hl)
	dec	d
	dec	d
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Locate
	pop	af
;fdisk.c:1493: PrintRuler();
	jp	_PrintRuler
_InitializeWorkingScreen_end::
;fdisk.c:1497: void PrintRuler()
;	---------------------------------
; Function PrintRuler
; ---------------------------------
_PrintRuler_start::
_PrintRuler:
;fdisk.c:1501: HomeCursor();
	ld	hl,#__str_120
	push	hl
	call	_print
	pop	af
;fdisk.c:1502: for(i = 0; i < currentScreenConfig.screenWidth; i++) {
	ld	de,#0x0000
00103$:
	ld	a, (#_currentScreenConfig + 1)
	ld	l,a
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00114$
	xor	a, #0x80
00114$:
	ret	P
;fdisk.c:1503: putchar('-');
	push	de
	ld	a,#0x2D
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	de
;fdisk.c:1502: for(i = 0; i < currentScreenConfig.screenWidth; i++) {
	inc	de
	jr	00103$
	ret
_PrintRuler_end::
__str_120:
	.db 0x0D
	.db 0x1B
	.ascii "K"
	.db 0x00
;fdisk.c:1508: void Locate(byte x, byte y)
;	---------------------------------
; Function Locate
; ---------------------------------
_Locate_start::
_Locate:
;fdisk.c:1510: regs.Bytes.H = x + 1;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	inc	a
	ld	(#(_regs + 0x0007)),a
;fdisk.c:1511: regs.Bytes.L = y + 1;
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	inc	a
	ld	(#(_regs + 0x0006)),a
;fdisk.c:1512: AsmCall(POSIT, &regs, REGS_MAIN, REGS_NONE);
	ld	de,#_regs
	ld	hl,#0x0000
	push	hl
	ld	l, #0x02
	push	hl
	push	de
	ld	l, #0xC6
	push	hl
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	ret
_Locate_end::
;fdisk.c:1516: void LocateX(byte x)
;	---------------------------------
; Function LocateX
; ---------------------------------
_LocateX_start::
_LocateX:
;fdisk.c:1518: regs.Bytes.H = x + 1;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	inc	a
	ld	(#(_regs + 0x0007)),a
;fdisk.c:1519: regs.Bytes.L = *(byte*)CSRY;
	ld	a,(#0xF3DC)
	ld	(#(_regs + 0x0006)),a
;fdisk.c:1520: AsmCall(POSIT, &regs, REGS_MAIN, REGS_NONE);
	ld	de,#_regs
	ld	hl,#0x0000
	push	hl
	ld	l, #0x02
	push	hl
	push	de
	ld	l, #0xC6
	push	hl
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	ret
_LocateX_end::
;fdisk.c:1524: void PrintCentered(char* string)
;	---------------------------------
; Function PrintCentered
; ---------------------------------
_PrintCentered_start::
_PrintCentered:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:1526: byte pos = (currentScreenConfig.screenWidth - strlen(string)) / 2;
	ld	a, (#_currentScreenConfig + 1)
	ld	l,a
	ld	h,#0x00
	push	hl
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	call	_strlen
	pop	af
	ex	de,hl
	pop	hl
	cp	a, a
	sbc	hl, de
	srl	h
	rr	l
	ld	h,l
;fdisk.c:1527: HomeCursor();
	ld	de,#__str_121
	push	hl
	push	de
	call	_print
	pop	af
	inc	sp
	call	_LocateX
	inc	sp
;fdisk.c:1529: print(string);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_print
	pop	af
	pop	ix
	ret
_PrintCentered_end::
__str_121:
	.db 0x0D
	.db 0x1B
	.ascii "K"
	.db 0x00
;fdisk.c:1533: void PrintStateMessage(char* string)
;	---------------------------------
; Function PrintStateMessage
; ---------------------------------
_PrintStateMessage_start::
_PrintStateMessage:
;fdisk.c:1535: Locate(0, screenLinesCount-1);
	ld	hl,#_screenLinesCount + 0
	ld	d, (hl)
	dec	d
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Locate
;fdisk.c:1536: DeleteToEndOfLine();
	ld	hl, #__str_122
	ex	(sp),hl
	call	_print
	pop	af
;fdisk.c:1537: print(string);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_print
	pop	af
	ret
_PrintStateMessage_end::
__str_122:
	.db 0x1B
	.ascii "K"
	.db 0x00
;fdisk.c:1541: void putchar(char ch) __naked
;	---------------------------------
; Function putchar
; ---------------------------------
_putchar_start::
_putchar:
;fdisk.c:1551: __endasm;
	push ix
	ld ix,#4
	add ix,sp
	ld a,(ix)
	call 0x00A2
	pop ix
	ret
_putchar_end::
;fdisk.c:1555: void print(char* string) __naked
;	---------------------------------
; Function print
; ---------------------------------
_print_start::
_print:
;fdisk.c:1573: __endasm;
	push ix
	ld ix,#4
	add ix,sp
	ld l,(ix)
	ld h,1(ix)
	PRLOOP:
	ld a,(hl)
	or a
	jr z,PREND
	call 0x00A2
	inc hl
	jr PRLOOP
	PREND:
	pop ix
	ret
_print_end::
;fdisk.c:1578: int CallFunctionInExtraBank(int functionNumber, void* parametersBuffer)
;	---------------------------------
; Function CallFunctionInExtraBank
; ---------------------------------
_CallFunctionInExtraBank_start::
_CallFunctionInExtraBank:
	push	ix
	ld	ix,#0
	add	ix,sp
;fdisk.c:1580: regs.Bytes.A = (*((byte*)0x40ff)) + 1;	//Extra functions bank = our bank + 1
	ld	a,(#0x40FF)
	inc	a
	ld	(#(_regs + 0x0001)),a
;fdisk.c:1581: regs.Words.BC = functionNumber;
	ld	hl,#_regs + 2
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;fdisk.c:1582: regs.Words.HL = (int)parametersBuffer;
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	((_regs + 0x0006)), de
;fdisk.c:1583: regs.Words.IX = (int)0x4100;	//Address of "main" for extra functions program
	ld	hl,#0x4100
	ld	((_regs + 0x0008)), hl
;fdisk.c:1584: AsmCall(CALBNK, &regs, REGS_ALL, REGS_MAIN);
	ld	de,#_regs
	ld	h, #0x00
	push	hl
	ld	hl,#0x0203
	push	hl
	push	de
	ld	hl,#0x4042
	push	hl
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
;fdisk.c:1585: return regs.Words.HL;
	ld	hl, (#_regs + 6)
	pop	ix
	ret
_CallFunctionInExtraBank_end::
;asmcall.c:10: void DriverCall(byte slot, uint routineAddress)
;	---------------------------------
; Function DriverCall
; ---------------------------------
_DriverCall_start::
_DriverCall:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;asmcall.c:15: memcpy(registerData, &regs, 8);
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	hl,#_regs
	push	bc
	ld	bc,#0x0008
	ldir
	pop	bc
;asmcall.c:17: regs.Bytes.A = slot;
	ld	hl,#(_regs + 0x0001)
	ld	a,4 (ix)
	ld	(hl),a
;asmcall.c:18: regs.Bytes.B = 0xFF;
	ld	hl,#_regs + 3
	ld	(hl),#0xFF
;asmcall.c:19: regs.UWords.DE = routineAddress;
	ld	hl,#_regs + 4
	ld	a,5 (ix)
	ld	(hl),a
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
;asmcall.c:20: regs.Words.HL = (int)registerData;
	ld	((_regs + 0x0006)), bc
;asmcall.c:22: DosCall(_CDRVR, REGS_ALL);
	ld	hl,#0x037B
	push	hl
	call	_DosCall
	pop	af
;asmcall.c:24: if(regs.Bytes.A == 0) {
	ld	a, (#(_regs + 0x0001) + 0)
	or	a, a
	jr	NZ,00103$
;asmcall.c:25: regs.Words.AF = regs.Words.IX;
	ld	de, (#_regs + 8)
	ld	(_regs), de
00103$:
	ld	sp,ix
	pop	ix
	ret
_DriverCall_end::
;asmcall.c:30: void DosCall(byte function, register_usage outRegistersDetail)
;	---------------------------------
; Function DosCall
; ---------------------------------
_DosCall_start::
_DosCall:
;asmcall.c:32: regs.Bytes.C = function;
	ld	hl,#_regs + 2
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;asmcall.c:33: SwitchSystemBankThenCall(0xF37D, outRegistersDetail);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl,#0xF37D
	push	hl
	call	_SwitchSystemBankThenCall
	pop	af
	inc	sp
	ret
_DosCall_end::
;asmcall.c:37: void SwitchSystemBankThenCall(int routineAddress, register_usage outRegistersDetail)
;	---------------------------------
; Function SwitchSystemBankThenCall
; ---------------------------------
_SwitchSystemBankThenCall_start::
_SwitchSystemBankThenCall:
;asmcall.c:39: *((int*)BK4_ADD) = routineAddress;
	ld	hl,#0xF84C
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	inc	hl
	ld	a,1 (iy)
	ld	(hl),a
;asmcall.c:40: AsmCall(CALLB0, &regs, REGS_ALL, outRegistersDetail);
	ld	de,#_regs
	ld	hl,#0x0000
	push	hl
	ld	hl, #6+0
	add	hl, sp
	ld	b, (hl)
	ld	c,#0x03
	push	bc
	push	de
	ld	hl,#0x403F
	push	hl
	call	_AsmCallAlt
	ld	hl,#0x0008
	add	hl,sp
	ld	sp,hl
	ret
_SwitchSystemBankThenCall_end::
;asmcall.c:44: void AsmCallAlt(uint address, Z80_registers* regs, register_usage inRegistersDetail, register_usage outRegistersDetail, int alternateAf) __naked
;	---------------------------------
; Function AsmCallAlt
; ---------------------------------
_AsmCallAlt_start::
_AsmCallAlt:
;asmcall.c:157: __endasm;
	push ix
	ld ix,#4
	add ix,sp
	ld e,6(ix) ;Alternate AF
	ld d,7(ix)
	ex af,af
	push de
	pop af
	ex af,af
	ld l,(ix) ;HL=Routine address
	ld h,1(ix)
	ld e,2(ix) ;DE=regs address
	ld d,3(ix)
	ld a,5(ix)
	ld (_OUT_FLAGS),a
	ld a,4(ix) ;A=in registers detail
	ld (_ASMRUT+1),hl
	push de
	or a
	jr z,ASMRUT_DO
	push de
	pop ix ;IX=&Z80regs
	exx
	ld l,(ix)
	ld h,1(ix) ;AF
	dec a
	jr z,ASMRUT_DOAF
	exx
	ld c,2(ix) ;BC, DE, HL
	ld b,3(ix)
	ld e,4(ix)
	ld d,5(ix)
	ld l,6(ix)
	ld h,7(ix)
	dec a
	exx
	jr z,ASMRUT_DOAF
	ld c,8(ix) ;IX
	ld b,9(ix)
	ld e,10(ix) ;IY
	ld d,11(ix)
	push de
	push bc
	pop ix
	pop iy
	ASMRUT_DOAF:
	push hl
	pop af
	exx
	ASMRUT_DO:
	call _ASMRUT
;ASMRUT: call 0
	ex (sp),ix ;IX to stack, now IX=&Z80regs
	ex af,af ;Alternate AF
	ld a,(_OUT_FLAGS)
	or a
	jr z,CALL_END
	exx ;Alternate HLDEBC
	ex af,af ;Main AF
	push af
	pop hl
	ld (ix),l
	ld 1(ix),h
	exx ;Main HLDEBC
	ex af,af ;Alternate AF
	dec a
	jr z,CALL_END
	ld 2(ix),c ;BC, DE, HL
	ld 3(ix),b
	ld 4(ix),e
	ld 5(ix),d
	ld 6(ix),l
	ld 7(ix),h
	dec a
	jr z,CALL_END
	exx ;Alternate HLDEBC
	pop hl
	ld 8(ix),l ;IX
	ld 9(ix),h
	push iy
	pop hl
	ld 10(ix),l ;IY
	ld 11(ix),h
	exx ;Main HLDEBC
	ex af,af
	pop ix
	ret
	CALL_END:
	ex af,af
	pop hl
	pop ix
	ret
;OUT_FLAGS: .db #0
_AsmCallAlt_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
