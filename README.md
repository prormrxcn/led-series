# 💡 LED Pattern Scroller on Basys 3 FPGA

This project implements a simple LED pattern animation using Verilog on the **Basys 3 FPGA board**. It sequentially lights up the 9 on-board LEDs one at a time in a loop. The LED pattern updates once per second, providing a clear and visually pleasing effect.

---

## 🎯 Features

- ✅ Sequential LED activation from right to left
- ✅ One LED lights up at a time
- ✅ Updates every second (1Hz LED frequency)
- ✅ 9-bit wide output for all Basys 3 user LEDs
- ✅ Clean reset functionality
- ✅ Fully synthesizable Verilog code

---

## 🧠 Description

This design uses a 32-bit counter to create a 1Hz blinking effect from the 100MHz system clock. A `case` statement selects the appropriate LED output from 10 predefined patterns.

---

## 🔧 Parameters

| Parameter      | Value          | Description                      |
|----------------|----------------|----------------------------------|
| `CLK_FREQ`     | `100_000_000`  | System clock frequency (100MHz) |
| `LED_FREQ`     | `1`            | Desired LED update rate (1Hz)   |
| `COUNTER_LIMIT`| `CLK_FREQ / LED_FREQ - 1` | Clock cycle count for 1Hz |

---

## 🚦 LED Patterns

Each LED is turned on one at a time in this sequence:

```
[LED 0] → [LED 1] → [LED 2] → ... → [LED 8] → [All Off] → Repeat
```

Bitmask values:
```verilog
led0 = 9'b000000000; // All OFF
led1 = 9'b000000001;
led2 = 9'b000000010;
led3 = 9'b000000100;
led4 = 9'b000001000;
led5 = 9'b000010000;
led6 = 9'b000100000;
led7 = 9'b001000000;
led8 = 9'b010000000;
led9 = 9'b100000000; // Optional - not used in this sequence
```

---

## 📁 File Structure

```
led_pattern_scroller/
├── may_twenty_two.v    # Main Verilog module for LED scrolling
├── constraints.xdc     # Pin assignments for Basys 3 (user must define)
├── README.md           # Project documentation
```

---

## 🖥️ Usage

### Requirements
- Digilent **Basys 3** FPGA board
- Xilinx **Vivado** Design Suite

### Instructions
1. Open the project in Vivado
2. Assign the 9 LED output bits (`leds[8:0]`) in your `.xdc` file:
   ```xdc
   set_property PACKAGE_PIN U16 [get_ports {leds[0]}] # Replace with your actual LED pins
   ...
   ```
3. Synthesize and program the FPGA
4. Observe the LEDs lighting up one at a time, repeating every second

---

## 🔄 Reset Behavior

- When the `rst` signal is high:
  - All LEDs are turned off
  - Counter and state machine are reset to initial state

---

## 🧪 Simulation

You can simulate the design using Vivado's behavioral simulation:
- Use a slower `LED_FREQ` (e.g., 10Hz) for faster waveform viewing
- Observe the `leds` output over time

---

## 📜 License

This project is released under the **MIT License**.  
You may freely reuse or modify it.

---

## 🛠️ Customization

| Want to change       | Do this                        |
|----------------------|--------------------------------|
| LED speed            | Adjust `LED_FREQ` parameter    |
| LED sequence         | Modify the `case` statement    |
| LED count            | Change from 9-bit to your need |
| Pattern style        | Use shifting or binary counter |

---

## 🙌 Credits

Created by prormrxn  
Date: **May 22, 2025**

---
