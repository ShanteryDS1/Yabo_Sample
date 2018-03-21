`define LATTICE_FAMILY "XP2"
`define LATTICE_FAMILY_XP2
`define LATTICE_DEVICE "LAXP2-5E"
`ifndef SYSTEM_CONF
`define SYSTEM_CONF
`timescale 1ns / 100 ps
`ifndef SIMULATION
   `define CharIODevice
`endif
`ifndef SIMULATION
   `define DEBUG_ROM
`endif
`ifndef SIMULATION
   `define CFG_DEBUG_ENABLED
`endif
`define CFG_EBA_RESET 32'h0
`define CFG_DEBA_RESET 32'h0
`define CFG_DISTRAM_POSEDGE_REGISTER_FILE
`define MULT_ENABLE
`define CFG_PL_MULTIPLY_ENABLED
`define SHIFT_ENABLE
`define CFG_PL_BARREL_SHIFT_ENABLED
`define CFG_SIGN_EXTEND_ENABLED
`ifndef SIMULATION
   `define CFG_WATCHPOINTS 32'h4
`endif
`ifndef SIMULATION
   `define CFG_JTAG_ENABLED
`endif
`ifndef SIMULATION
   `define CFG_JTAG_UART_ENABLED
`endif
`define INCLUDE_LM32
`define CFG_IROM_ENABLED
`define CFG_IROM_BASE_ADDRESS 32'h4000
`define CFG_IROM_LIMIT 32'h47ff
`define CFG_IROM_INIT_FILE_FORMAT "hex"
`define CFG_IROM_INIT_FILE "none"
`define CFG_DRAM_ENABLED
`define CFG_DRAM_BASE_ADDRESS 32'h8000
`define CFG_DRAM_LIMIT 32'h87ff
`define CFG_DRAM_INIT_FILE_FORMAT "hex"
`define CFG_DRAM_INIT_FILE "none"
`define LM32_I_PC_WIDTH 16
`define uartUART_WB_DAT_WIDTH 8
`define uartUART_WB_ADR_WIDTH 4
`define uartCLK_IN_MHZ 0
`define uartBAUD_RATE 115200
`define IB_SIZE 32'h4
`define OB_SIZE 32'h4
`define BLOCK_WRITE
`define BLOCK_READ
`define INTERRUPT_DRIVEN
`define CharIODevice
`define uartLCR_DATA_BITS 8
`define uartLCR_STOP_BITS 1
`define gpioGPIO_WB_DAT_WIDTH 32
`define gpioGPIO_WB_ADR_WIDTH 4
`define gpioOUTPUT_PORTS_ONLY
`define gpioDATA_WIDTH 32'h2
`define spiMASTER
`define spiSLAVE_NUMBER 32'h1
`define spiCLOCK_SEL 7
`define spiCLKCNT_WIDTH 16
`define DELAY_TIME 3
`define spiINTERVAL_LENGTH 2
`define spiDATA_LENGTH 24
`define spiSHIFT_DIRECTION 1
`define spiCLOCK_PHASE 1
`define spiCLOCK_POLARITY 1
`endif // SYSTEM_CONF
