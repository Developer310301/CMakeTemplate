# CMakeTemplate

CMakeTemplate is a starter project designed to help developers quickly set up a C/C++ project using the CMake build system. It provides a structured layout for building libraries and binaries, along with a framework for unit testing.

## Features

- **CMake Build System**: Utilizes CMake for cross-platform project configuration and build management.
- **Source and Test Separation**: Organizes code into `src` and `test` directories for better modularity.
- **Build Scripts**: Includes `build_debug.sh` and `build_release.sh` scripts for streamlined build processes.

## Getting Started

### Prerequisites

Ensure the following tools are installed on your system:

- **CMake**: Version 3.10 or higher.
- **GNU Make**: Or another build tool supported by CMake.
- **C/C++ Compiler**: Such as GCC or Clang.
- **Ninja**: for faster compilation

### Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/Developer310301/CMakeTemplate.git
   cd CMakeTemplate
   ```

2. **Build the Project**:

   - For a debug build:

     ```bash
     ./build_debug.sh
     ```

   - For a release build:

     ```bash
     ./build_release.sh
     ```

## Project Structure

The repository is organized as follows:

```
CMakeTemplate/
├── cmake/                 # CMake modules and configurations
├── src/                   # Source code files
├── build_debug.sh         # Script to build the project in debug mode
├── build_release.sh       # Script to build the project in release mode
├── CMakeLists.txt         # Main CMake configuration file
└── LICENSE                # License information
```

## Usage

After building the project, the resulting binaries will be located in the `build/` directory. You can execute them directly from there. For example:

```bash
./build/[Debug \ Release]/output/bin/my_executable
```

## Contributing

Contributions are welcome! Please fork the repository and create a new branch for any feature or bug fix. Submit a pull request for review.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

This template is inspired by best practices in CMake project organization and aims to provide a solid foundation for C/C++ development.
