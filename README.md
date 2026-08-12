# Vending Machine

A digital **Vending Machine Controller** designed using **Verilog HDL** and verified through simulation.

##  Project Overview

This project implements a simple digital vending machine controller that accepts user inputs for product selection and coin insertion. The controller processes the inputs and provides the selected product when the required amount is reached.

The design was developed using **Verilog HDL** and its functionality was verified using a simulation testbench.

##  Working

The vending machine operates using a **Finite State Machine (FSM)** to control the transaction.

* The user selects a product.
* Coins are inserted through the input signals.
* The FSM keeps track of the inserted amount.
* When the required amount is reached, the selected product is dispensed.
* If excess money is inserted, the controller can provide the corresponding change.
* Reset returns the vending machine to its initial state.

## Tools & Technologies

* Verilog HDL
* ModelSim / Vivado Simulator
* Finite State Machine (FSM)
* RTL Design
* Sequential Logic

##  Project Files

* vending_machine.v – Main Verilog design
* vending_machine_tb.v – Verilog testbench
* vending_machine_simulation.png-Simulation waveform

##  Simulation

The design was simulated using a Verilog simulation environment to verify:

* Product selection
* Coin insertion
* FSM state transitions
* Product dispensing
* Change handling
* Reset operation

##  Expected Output

During simulation, the vending machine processes the inserted amount and changes its state according to the transaction.

Example flow:

**Product Selection → Coin Insertion → Amount Verification → Product Dispensing → Transaction Complete**

The waveform is used to verify the correct state transitions and output generation.

##  Author

**Voo Upasana**

