Tag SECO_FW_MX8QMB0_V0.1.0  
    SECO_FW_MX8QXPB0_V0.1.0

commit: 31fabbffb180f5ed54af8ef89560ff0453c00cee
version 0.1.0

- Build: Bamboo QX FW build #134 https://bamboo1.sw.nxp.com/browse/IM-AHABFDP-134
	mx8qm-ahab-container.img
- Build: Bamboo QM FW build #381 https://bamboo1.sw.nxp.com/browse/IM-AHABDEV-381
	mx8qx-ahab-container.img

New in version 0.1.0:
- Power request (lpm) fully implemented
- Attestation (prover & verifier modes)
- SRK revocation - Version handling
- SNVS message to configure button time parameters
- CRC on SECO ROM fuse patch
- Moving to closed LC is possible only if event queue is empty




Tags SECO_FW_MX8QMB0_V007 & SECO_FW_MX8QXPB0_V007

Container named respectively:
- mx8qm-ahab-container.img for qm
- mx8qx-ahab-container.img for qx

Tag SECO_FW_QMB0_V007

commit: 327152369c95bae5df480d399e31c21dba4cf054
version 007

- AHAB tree version: tag SECO_FW_QMB0_V007, https://bitbucket.sw.nxp.com/projects/MCUSEC/repos/ahab/browse?at=refs%2Ftags%2FSECO_FW_QMB0_V007
- Build: Bamboo QX FW build #348 https://bamboo1.sw.nxp.com/browse/IM-AHABDEV-348

Signing request:

- Signing certificate = ./imx8qm/crts/OEF_A0F6/IM8QMAX0101.pem
- Data to be signed   = container-201807201413-daa224bf6060fef85dfe79265c8203b0f86334ff.bin


Tag SECO_FW_QXPB0_V007

commit: 327152369c95bae5df480d399e31c21dba4cf054
version 007

- AHAB tree version: https://bitbucket.sw.nxp.com/projects/MCUSEC/repos/ahab/browse?at=refs%2Ftags%2FSECO_FW_QXPB0_V007
- Build: Bamboo QX FW build #110 https://bamboo1.sw.nxp.com/browse/IM-AHABFDP-110

Signing request:

- Signing certificate = ./imx8x/crts/IMXQXP0101.pem
- Data to be signed   = container-201807201404-d2619593f404f9d96fca87c93a5ee05af54d6d86.bin


New in version 007:
 - Fix the issue found on secure RTC:
    . The secure RTC must not be initialized during SNVS initialization
    . Unlike the RTC, the Secure RTC counts in seconds

 - The CAAM TRNG initialization is not handled automatically by the SECO anymore to avoid any impact on the boot time
   Instead the SCFW can control the initialization with the message "start RNG request".

 - Only the first 8 pages of CAAM Secure memory are owned by the SECO instead of 16 pages in the previous versions. Pages 0 & 1 are r/w for the system.

JIRAs:
- AHAB-344: Update FW version to 007
- AHAB-342: CAAM RNG initialization
- AHAB-349: SNVS: fix secure RTC
- AHAB-351: SECO Secure memory handling

Tag SECO_FW_QXPB0_V06

commit: eeb55e1e5747293335ea2974e59fb3189d74e9d4
version 0006

- AHAB tree version: https://bitbucket.sw.nxp.com/projects/MCUSEC/repos/ahab/browse?at=refs%2Ftags%2FSECO_FW_QXPB0_V06
- Build: Bamboo QX FW build #99 https://bamboo1.sw.nxp.com/browse/IM-AHABFDP-99, all build artifacts attached to plan

Signing request

- Signing certificate = ./imx8x/crts/IMXQXP0101.pem
- Data to be signed   = container-201806261453-1d985170c41d31e53c63cd1f7cf254a57bd13d36.bin

New in version 0006:
 High level summary:
  main reason for this release is a fix for the JTAG match (message attach request)

 By the details:
- AHAB-344: Update FW version to 0006
- AHAB-337: use fetched ADM status1 value for attach req handling
- AHAB-228,AHAB-296: fix issue on QX index


Tag SECO_FW_QXPB0_V05

commit: 101e7c63a4f9cf1a86c5328eea4aead1d7a07e49
version 5

- AHAB tree version: https://bitbucket.sw.nxp.com/projects/MCUSEC/repos/ahab/browse?at=refs%2Ftags%2FAHAB_FW_QX_version_5
- Build: Bamboo QX FW build #96 https://bamboo1.sw.nxp.com/browse/IM-AHABFDP-96, all build artifacts attached to plan

Signing request

- Signing certificate = ./imx8x/crts/IMXQXP0101.pem
- Data to be signed   = container-201806221354-4554ab7d9d7894e8fc5d4b151ca05e2f618984b2.bin

New in version 5:
- AHAB-344:  Update FW version to 5
- AHAB-342: RNG initialization
- AHAB-294: Support ENABLE DEBUG message
- AHAB-341: support of GET EVENT message
- AHAB-296 : support of WRITE SECURE FUSE message
- AHAB-331: FW container parser supports DEK image
- AHAB-337: support of ATTACH DEBUG message
- AHAB-335: SNVS power button handling
- AHAB-330: Message Assign JR Request
- AHAB-329: bit 31 of version log indicates a dirty build
- AHAB-327: support of GET CHIP INFO message
- AHAB-243: support RETURN LIFE CYCLE message


Tag AHAB_FW_QX_version_4 / SECO_FW_QXPB0_V04

commit: 063912b6cfdcd6bb79ddb942051a8b7264f9e3b7
version 4

-	AHAB tree version: https://bitbucket.sw.nxp.com/projects/MCUSEC/repos/ahab/browse?at=refs%2Ftags%2FAHAB_FW_QX_version_4
-	Build: Bamboo QX FW build #58 https://bamboo1.sw.nxp.com/browse/IM-AHABFDP-58, all build artifacts attached to plan

New in version 4:

o AHAB-228: write_common_fuse - verify that fuse is not in InFieldSecurityFuses list
o AHAB-187: ADM active kick is self-clear. Fix 24h reset issue due to ADM kick not properly handled in SECO
o AHAB-223: add Certificate support
o AHAB-222: add P256 & P521 support



Tag AHAB_FW_QX_drop_3 / SECO_FW_QXPB0_V03

commit: 041c9f925c9bc00982eeffe1f1c77cbc2fc96899
version 3

Drop 3 below:
�	AHAB tree version: tag AHAB_FW_QX_drop_3, https://bitbucket.sw.nxp.com/projects/MCUSEC/repos/ahab/browse?at=refs%2Ftags%2FAHAB_FW_QX_drop_3
�	Build: Bamboo QX FW build #51 https://bamboo1.sw.nxp.com/browse/IM-AHABFDP-51  , all build artifacts attached to plan


New in this version:

o Get FW version request

o SECO kick request

o Low power request (limited implementaion clearing adm_lpm_inhibit only: SECO FW will not be able to recover if the security subsystem effectively goes into lpm)

o SNVS read/write for the following:
	1. AHAB_SNVS_ID_INIT
	2. AHAB_SNVS_ID_POWER_OFF
	3. AHAB_SNVS_ID_SRTC
	4. AHAB_SNVS_ID_SRTC_CALB
	5. AHAB_SNVS_ID_SRTC_ALRM
	6. AHAB_SNVS_ID_RTC
	7. AHAB_SNVS_ID_RTC_CALB
	8. AHAB_SNVS_ID_RTC_ALRM
	9. AHAB_SNVS_ID_BTN_CONFIG
	10. AHAB_SNVS_ID_BTN_MASK
	11. AHAB_SNVS_ID_BTN
	12. AHAB_SNVS_ID_BTN_CLEAR
	13. AHAB_SNVS_ID_SSM_STATE

o Support for RSA 2, 3 & 4k
