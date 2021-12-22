# Brother DCP-1510 CUPS Wrapper

Install Brother DCP-1510 printer into your CUPS subsystem on Linux.

<img src="screenshot.png">

## Installation

```
mkdir build
cd build
cmake ..
make
sudo make install
```

## Usage

The printer will be installed with `lpadmin` upon the CMake installation above. You should start seeing your printer in the list of printers managed by CUPS at `http://localhost:631` as shown on the screenshot.

