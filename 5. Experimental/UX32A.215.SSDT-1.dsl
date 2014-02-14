/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of SSDT-1.aml, Fri Feb 14 16:50:51 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000099F (2463)
 *     Revision         0x01
 *     Checksum         0x2B
 *     OEM ID           "PmRef"
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20131218 (538120728)
 */
DefinitionBlock ("SSDT-1.aml", "SSDT", 1, "PmRef", "CpuPm", 0x00003000)
{

    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU0.ACST, MethodObj)    // 0 Arguments
    External (_PR_.CPU0.APSS, PkgObj)
    External (_PR_.CPU1, ProcessorObj)
    External (_PR_.CPU2, ProcessorObj)
    External (_PR_.CPU3, ProcessorObj)
    External (_SB_.CPUP, FieldUnitObj)
    External (_SB_.SLMT, FieldUnitObj)
    External (LIMT, MethodObj)    // 0 Arguments
    External (TCNT, FieldUnitObj)

    Scope (\)
    {
        Name (SSDT, Package (0x0C)
        {
            "CPU0IST ", 
            0xD865A018, 
            0x0886, 
            "APIST   ", 
            0xDA5C8A98, 
            0x0303, 
            "CPU0CST ", 
            0xDA5C7018, 
            0x0853, 
            "APCST   ", 
            0xDA5C9C18, 
            0x0119
        })
        Name (CFGD, 0x0066F6FF)
        Name (\PDC0, 0x80000000)
        Name (\PDC1, 0x80000000)
        Name (\PDC2, 0x80000000)
        Name (\PDC3, 0x80000000)
        Name (\PDC4, 0x80000000)
        Name (\PDC5, 0x80000000)
        Name (\PDC6, 0x80000000)
        Name (\PDC7, 0x80000000)
        Name (\SDTL, Zero)
    }

    Scope (\_PR)
    {
        OperationRegion (PPMT, SystemMemory, 0xDA899E18, 0x29)
        Field (PPMT, AnyAcc, Lock, Preserve)
        {
            PGRV,   8, 
            Offset (0x06), 
            ACRT,   8, 
            APSV,   8, 
            AAC0,   8, 
            CPID,   32, 
            CPPC,   8, 
            CCTP,   8, 
            CLVL,   8, 
            CBMI,   8, 
            PL10,   16, 
            PL20,   16, 
            PLW0,   8, 
            CTC0,   8, 
            TAR0,   8, 
            PPC0,   8, 
            PL11,   16, 
            PL21,   16, 
            PLW1,   8, 
            CTC1,   8, 
            TAR1,   8, 
            PPC1,   8, 
            PL12,   16, 
            PL22,   16, 
            PLW2,   8, 
            CTC2,   8, 
            TAR2,   8, 
            PPC2,   8
        }
    }

    Scope (\_PR.CPU0)
    {
        Name (HI0, Zero)
        Name (HC0, Zero)
        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (CPPC, \_PR.CPU0._PPC)
            Store (CPDC (Arg0), Local0)
            GCAP (Local0)
        }

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)
            Return (Local0)
        }

        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.ACST ())
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (\LIMT ())
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            If (LLessEqual (\_PR.CPPC, \_SB.CPUP))
            {
                Store (Subtract (\_SB.CPUP, \_PR.CPPC), \_SB.SLMT)
            }

            If (LAnd (And (CFGD, One), And (PDC0, One)))
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }

            Return (Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x10,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000001000, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x00000000000000B3, // Address
                        ,)
                }
            })
        }

        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.APSS)
        }

        Name (PSDF, Zero)
        Method (_PSD, 0, NotSerialized)  // _PSD: Power State Dependencies
        {
            If (LNot (PSDF))
            {
                Store (TCNT, Index (DerefOf (Index (HPSD, Zero)), 0x04))
                Store (TCNT, Index (DerefOf (Index (SPSD, Zero)), 0x04))
                Store (Ones, PSDF)
            }

            If (And (PDC0, 0x0800))
            {
                Return (HPSD)
            }

            Return (SPSD)
        }

        Name (HPSD, Package (One)
        {
            Package (0x05)
            {
                0x05, 
                Zero, 
                Zero, 
                0xFE, 
                0x80
            }
        })
        Name (SPSD, Package (One)
        {
            Package (0x05)
            {
                0x05, 
                Zero, 
                Zero, 
                0xFC, 
                0x80
            }
        })
        Method (CPDC, 1, Serialized)
        {
            CreateDWordField (Arg0, Zero, REVS)
            CreateDWordField (Arg0, 0x04, SIZE)
            Store (SizeOf (Arg0), Local0)
            Store (Subtract (Local0, 0x08), Local1)
            CreateField (Arg0, 0x40, Multiply (Local1, 0x08), TEMP)
            Name (STS0, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            Concatenate (STS0, TEMP, Local2)
            Return (COSC (Buffer (0x10)
                {
                    /* 0000 */   0x16, 0xA6, 0x77, 0x40, 0x0C, 0x29, 0xBE, 0x47,
                    /* 0008 */   0x9E, 0xBD, 0xD8, 0x70, 0x58, 0x71, 0x39, 0x53
                }, REVS, SIZE, Local2))
        }

        Method (COSC, 4, Serialized)
        {
            CreateDWordField (Arg3, Zero, STS0)
            CreateDWordField (Arg0, Zero, IID0)
            CreateDWordField (Arg0, 0x04, IID1)
            CreateDWordField (Arg0, 0x08, IID2)
            CreateDWordField (Arg0, 0x0C, IID3)
            Name (UID0, Buffer (0x10)
            {
                /* 0000 */   0x16, 0xA6, 0x77, 0x40, 0x0C, 0x29, 0xBE, 0x47,
                /* 0008 */   0x9E, 0xBD, 0xD8, 0x70, 0x58, 0x71, 0x39, 0x53
            })
            CreateDWordField (UID0, Zero, EID0)
            CreateDWordField (UID0, 0x04, EID1)
            CreateDWordField (UID0, 0x08, EID2)
            CreateDWordField (UID0, 0x0C, EID3)
            If (LNot (LAnd (LAnd (LEqual (IID0, EID0), LEqual (IID1, EID1)), 
                LAnd (LEqual (IID2, EID2), LEqual (IID3, EID3)))))
            {
                Store (0x06, STS0)
                Return (Arg3)
            }

            If (LNotEqual (Arg1, One))
            {
                Store (0x0A, STS0)
                Return (Arg3)
            }

            Return (Arg3)
        }

        Method (GCAP, 1, Serialized)
        {
            CreateDWordField (Arg0, Zero, STS0)
            CreateDWordField (Arg0, 0x04, CAP0)
            If (LOr (LEqual (STS0, 0x06), LEqual (STS0, 0x0A)))
            {
                Return (Zero)
            }

            If (And (STS0, One))
            {
                And (CAP0, 0x0BFF, CAP0)
                Return (Zero)
            }

            Or (And (PDC0, 0x7FFFFFFF), CAP0, PDC0)
            If (And (CFGD, 0x3E))
            {
                If (LAnd (LAnd (And (CFGD, 0x0400), And (PDC0, 0x18
                    )), LNot (And (SDTL, 0x02))))
                {
                    Or (SDTL, 0x02, SDTL)
                    OperationRegion (CST0, SystemMemory, DerefOf (Index (SSDT, 0x07)), DerefOf (Index (SSDT, 0x08
                        )))
                    Load (CST0, HC0)
                }
            }

            Return (Zero)
        }
    }

    Scope (\_PR.CPU1)
    {
        Name (HI1, Zero)
        Name (HC1, Zero)
        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_PR.CPU0.CPDC (Arg0), Local0)
            GCAP (Local0)
        }

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_PR.CPU0.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)
            Return (Local0)
        }

        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.ACST ())
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (\_PR.CPU0._PPC ())
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (\_PR.CPU0._PCT ())
        }

        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.APSS)
        }

        Method (_PSD, 0, NotSerialized)  // _PSD: Power State Dependencies
        {
            Return (\_PR.CPU0._PSD ())
        }

        Method (GCAP, 1, NotSerialized)
        {
            CreateDWordField (Arg0, Zero, STS1)
            CreateDWordField (Arg0, 0x04, CAP1)
            If (LOr (LEqual (STS1, 0x06), LEqual (STS1, 0x0A)))
            {
                Return (Zero)
            }

            If (And (STS1, One))
            {
                And (CAP1, 0x0BFF, CAP1)
                Return (Zero)
            }

            Or (And (PDC1, 0x7FFFFFFF), CAP1, PDC1)
            If (LEqual (And (PDC1, 0x09), 0x09))
            {
                APPT ()
            }

            If (And (PDC1, 0x18))
            {
                APCT ()
            }

            Store (PDC1, PDC0)
            Return (Zero)
        }

        Method (APCT, 0, Serialized)
        {
            If (LAnd (And (CFGD, 0x2E), LNot (And (SDTL, 0x20
                ))))
            {
                Or (SDTL, 0x20, SDTL)
                OperationRegion (CST1, SystemMemory, DerefOf (Index (SSDT, 0x0A)), DerefOf (Index (SSDT, 0x0B
                    )))
                Load (CST1, HC1)
            }
        }

        Method (APPT, 0, Serialized)
        {
            If (LAnd (And (CFGD, One), LNot (And (SDTL, 0x10
                ))))
            {
                Or (SDTL, 0x10, SDTL)
                OperationRegion (IST1, SystemMemory, DerefOf (Index (SSDT, 0x04)), DerefOf (Index (SSDT, 0x05
                    )))
                Load (IST1, HI1)
            }
        }
    }

    Scope (\_PR.CPU2)
    {
        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_PR.CPU0.CPDC (Arg0), Local0)
            GCAP (Local0)
        }

        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.ACST ())
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (\_PR.CPU0._PPC ())
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (\_PR.CPU0._PCT ())
        }

        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.APSS)
        }

        Method (_PSD, 0, NotSerialized)  // _PSD: Power State Dependencies
        {
            Return (\_PR.CPU0._PSD ())
        }

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_PR.CPU0.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)
            Return (Local0)
        }

        Method (GCAP, 1, NotSerialized)
        {
            CreateDWordField (Arg0, Zero, STS2)
            CreateDWordField (Arg0, 0x04, CAP2)
            If (LOr (LEqual (STS2, 0x06), LEqual (STS2, 0x0A)))
            {
                Return (Zero)
            }

            If (And (STS2, One))
            {
                And (CAP2, 0x0BFF, CAP2)
                Return (Zero)
            }

            Or (And (PDC2, 0x7FFFFFFF), CAP2, PDC2)
            If (LEqual (And (PDC2, 0x09), 0x09))
            {
                \_PR.CPU1.APPT ()
            }

            If (And (PDC2, 0x18))
            {
                \_PR.CPU1.APCT ()
            }

            Store (PDC2, PDC0)
            Return (Zero)
        }
    }

    Scope (\_PR.CPU3)
    {
        Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
        {
            Store (\_PR.CPU0.CPDC (Arg0), Local0)
            GCAP (Local0)
        }

        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.ACST ())
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (\_PR.CPU0._PPC ())
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (\_PR.CPU0._PCT ())
        }

        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.APSS)
        }

        Method (_PSD, 0, NotSerialized)  // _PSD: Power State Dependencies
        {
            Return (\_PR.CPU0._PSD ())
        }

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Store (\_PR.CPU0.COSC (Arg0, Arg1, Arg2, Arg3), Local0)
            GCAP (Local0)
            Return (Local0)
        }

        Method (GCAP, 1, NotSerialized)
        {
            CreateDWordField (Arg0, Zero, STS3)
            CreateDWordField (Arg0, 0x04, CAP3)
            If (LOr (LEqual (STS3, 0x06), LEqual (STS3, 0x0A)))
            {
                Return (Zero)
            }

            If (And (STS3, One))
            {
                And (CAP3, 0x0BFF, CAP3)
                Return (Zero)
            }

            Or (And (PDC3, 0x7FFFFFFF), CAP3, PDC3)
            If (LEqual (And (PDC3, 0x09), 0x09))
            {
                \_PR.CPU1.APPT ()
            }

            If (And (PDC3, 0x18))
            {
                \_PR.CPU1.APCT ()
            }

            Store (PDC3, PDC0)
            Return (Zero)
        }
    }
}

