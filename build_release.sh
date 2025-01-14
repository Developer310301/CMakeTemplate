#!/bin/bash

# Tools to check and install
TOOLS=("git" "cmake" "ninja-build" "automake" "autoconf")

# Detect the package manager
detect_package_manager() {
    if command -v apt >/dev/null 2>&1; then
        echo "apt" # Debian/Ubuntu
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf" # Fedora
    elif command -v yum >/dev/null 2>&1; then
        echo "yum" # Older Fedora/RHEL
    elif command -v pacman >/dev/null 2>&1; then
        echo "pacman" # Arch
    elif command -v pkg >/dev/null 2>&1; then
        echo "pkg" # FreeBSD
    else
        echo "unsupported"
    fi
}

# Check if a tool is installed
is_installed() {
    command -v "$1" >/dev/null 2>&1
}

# Install tools using the appropriate package manager
install_tools() {
    local pkg_manager=$1
    local missing_tools=()

    # Check which tools are missing
    for tool in "${TOOLS[@]}"; do
        if ! is_installed "$tool"; then
            missing_tools+=("$tool")
        fi
    done

    # If no tools are missing, exit
    if [ ${#missing_tools[@]} -eq 0 ]; then
        echo "All required tools are already installed."
        return 0
    fi

    echo "Missing tools: ${missing_tools[*]}"
    echo "Installing missing tools..."

    # Install using the detected package manager
    case "$pkg_manager" in
        apt)
            sudo apt update
            sudo apt install -y "${missing_tools[@]}"
            ;;
        dnf)
            sudo dnf install -y "${missing_tools[@]}"
            ;;
        yum)
            sudo yum install -y "${missing_tools[@]}"
            ;;
        pacman)
            sudo pacman -Sy --noconfirm "${missing_tools[@]}"
            ;;
        pkg)
            sudo pkg install -y "${missing_tools[@]}"
            ;;
        *)
            echo "Error: Unsupported package manager. Cannot install tools."
            return 1
            ;;
    esac
}

# Main script logic
main() {
    pkg_manager=$(detect_package_manager)
    if [ "$pkg_manager" = "unsupported" ]; then
        echo "Error: Unsupported operating system. Cannot install tools."
        exit 1
    fi

    echo "Detected package manager: $pkg_manager"
    install_tools "$pkg_manager"

    mkdir -p build/Release
    cmake -S . -B build/Release -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build ./build/Release
}

# Run the script
main