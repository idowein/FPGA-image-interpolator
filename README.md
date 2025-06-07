# OV7670 Camera VGA Display with Zoom Functionality

## Overview
This project implements a video capture and display system using the OV7670 camera and a VGA display. The design incorporates real-time image processing, zoom functionality, and efficient memory management through a block-based design.

![Image](https://github.com/user-attachments/assets/7216f4db-9091-4da8-ad7c-558805dc4947)

## User interface

![image](https://github.com/user-attachments/assets/ef6c0856-6ae5-4617-9497-106af98cee17)

---

## Features
- **Camera Integration**:
  - Supports the OV7670 camera for capturing video frames.
  - Includes configuration control for the camera through the `ov7670_controller` block.

- **VGA Display**:
  - Renders captured frames on a VGA display.
  - Provides synchronization signals (`VGA_H_sync` and `VGA_V_sync`) for proper timing.

- **Zoom Functionality**:
  - Enables 2x zoom, replicating pixels for a magnified display.
  - Address calculations adjust memory access for zoomed-in views.

https://github.com/user-attachments/assets/899b8e11-4e64-41e1-86a6-1afc5af63212

- **Block Memory Management**:
  - Utilizes a Block Memory Generator for efficient frame storage.
  - Dual-port memory allows simultaneous read and write operations.

- **Clocking and Reset**:
  - Includes a Clocking Wizard for generating synchronized clock signals for various modules.
  - Centralized reset control for system initialization.

---

## Block Design Overview
The system design is modular, as shown in the block diagram:

### 1. **`ov7670_capture`**:
   - Interfaces with the OV7670 camera.
   - Captures pixel data (`din[7:0]`) and processes synchronization signals (`camera_v_sync`, `camera_h_ref`).
   - Produces formatted pixel data and addresses for memory storage.

### 2. **`ov7670_controller`**:
   - Configures the OV7670 camera settings (e.g., resolution, frame rate).
   - Manages control signals such as `sioc`, `siod`, `reset`, and `pwdn`.

### 3. **`blk_mem_gen`**:
   - Acts as a frame buffer.
   - `BRAM_PORTA` handles write operations from the capture module.
   - `BRAM_PORTB` handles read operations for the VGA module.

### 4. **`vga`**:
   - Generates VGA output signals (`VGA_H_sync`, `VGA_V_sync`).
   - Reads pixel data from the memory and outputs formatted RGB signals (`vga_red`, `vga_blue`, `vga_green`).
   - Includes zoom functionality, adjusting the frame address for magnified views.

### 5. **Clocking Wizard**:
   - Generates multiple clock signals (`clk_in1`, `clk_vga`, `clk_reg`) for different modules.
   - Ensures proper synchronization between camera capture and display.

### 6. **Reset and Control Block (`cntl_v1_0`)**:
   - Manages reset operations and zoom input control (`zoom`).

---

## Workflow
1. **Camera Capture**:
   - The `ov7670_capture` module processes video frames from the OV7670 camera.
   - Captured frames are stored in the block memory.

2. **Frame Buffer**:
   - The block memory generator stores and retrieves pixel data for display.

3. **VGA Output**:
   - The `vga` module reads frame data and generates VGA signals.
   - Zoom functionality adjusts the memory address for pixel replication in zoom mode.

---

## Design Highlights
- **Efficient Memory Management**:
  - Dual-port BRAM enables seamless read/write operations between capture and display modules.
- **Scalable Design**:
  - Modular architecture allows for future enhancements (e.g., higher resolutions, advanced zoom levels).
- **Real-Time Processing**:
  - Synchronization between camera input and VGA output ensures real-time video display.

---

## Future Improvements
- Extend zoom functionality to support 4x zoom (4x4 replication).
- Increase resolution support (e.g., 1920x1080).
- Add advanced image processing (e.g., brightness, contrast adjustments, ni-linear interpolation).

---

## Developers
- **Ido Weinstock** (<ido.weinstock@gmail.com>)
- **Dvir Hershkovitz** (<dvirhersh@gmail.com>)
