
# linux_plus
Utility package to provide additional details about the linux platform.

## Features

- Linux Specific Features
    - Get Current Distro Name
    - Get Parent Distro Name
    - Get Full Distro Name
    - Get Distro Version
    - Utility functions to check if
        - The current distro is **Based** on Debian or Ubuntu
        - The current distro is on Debian, Ubuntu, Fedora or Arch.

## Usage

```dart
import 'dart:io';
import 'package:linux_plus/linux_plus.dart';

void main() {
  /// its optional to check for [Platform.isLinux] first
  /// on other platforms the distro functions will simply return `unknown`/`false`
  /// respectively.
  if(Platform.isLinux) {
    print(LinuxPlus.distro);
    print(LinuxPlus.fullDistroName);
    print(LinuxPlus.distroVersion);
    print(LinuxPlus.distroVersionCodename);
    print(LinuxPlus.distroCodename);
    print(LinuxPlus.parentDistro);
    print(LinuxPlus.isUbuntu);
    print(LinuxPlus.isDebian);
    print(LinuxPlus.isFedora);
    print(LinuxPlus.isArch);
    print(LinuxPlus.isUbuntuOrDebian);
    print(LinuxPlus.isUbuntuBased);
    print(LinuxPlus.isDebianBased);
  }
}

```

## Upcoming Features

- Support for processor info for linux
