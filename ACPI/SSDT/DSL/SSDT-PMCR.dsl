/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLTO005i.aml, Sun Feb 12 01:51:23 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000A4 (164)
 *     Revision         0x02
 *     Checksum         0xE9
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "PMCR"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "PMCR", 0x00001000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)

    If (CondRefOf (\_SB.PCI0.LPCB))
    {
        Scope (_SB.PCI0.LPCB)
        {
            Device (PMCR)
            {
                Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Memory32Fixed (ReadWrite,
                        0xFE000000,         // Address Base
                        0x00010000,         // Address Length
                        )
                })
            }
        }
    }
}

