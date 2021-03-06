# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: adb	%f0, 0                  # encoding: [0xed,0x00,0x00,0x00,0x00,0x1a]
#CHECK: adb	%f0, 4095               # encoding: [0xed,0x00,0x0f,0xff,0x00,0x1a]
#CHECK: adb	%f0, 0(%r1)             # encoding: [0xed,0x00,0x10,0x00,0x00,0x1a]
#CHECK: adb	%f0, 0(%r15)            # encoding: [0xed,0x00,0xf0,0x00,0x00,0x1a]
#CHECK: adb	%f0, 4095(%r1,%r15)     # encoding: [0xed,0x01,0xff,0xff,0x00,0x1a]
#CHECK: adb	%f0, 4095(%r15,%r1)     # encoding: [0xed,0x0f,0x1f,0xff,0x00,0x1a]
#CHECK: adb	%f15, 0                 # encoding: [0xed,0xf0,0x00,0x00,0x00,0x1a]

	adb	%f0, 0
	adb	%f0, 4095
	adb	%f0, 0(%r1)
	adb	%f0, 0(%r15)
	adb	%f0, 4095(%r1,%r15)
	adb	%f0, 4095(%r15,%r1)
	adb	%f15, 0
