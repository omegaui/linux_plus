import 'package:linux_plus/src/io/linux/linux_identifier.dart';

var linuxIdentifier = LinuxIdentifier();

/// A class that provides additional methods to retrieve Linux distribution information.
final class LinuxPlus {
  /// Gets the name of the Linux distribution.
  ///
  /// Returns the name of the Linux distribution as obtained from the '/etc/os-release' file.
  String get distro => linuxIdentifier.getDistroName();

  /// Gets the full user-friendly name of the Linux distribution.
  ///
  /// Returns the full user-friendly name of the Linux distribution as obtained from the '/etc/os-release' file.
  String get fullDistroName => linuxIdentifier.getFullDistroName();

  /// Gets the version of the Linux distribution.
  ///
  /// Returns the version of the Linux distribution as obtained from the '/etc/os-release' file.
  String get distroVersion => linuxIdentifier.getVersionID();

  /// Gets the codename of the Linux distribution version.
  ///
  /// Returns the codename of the Linux distribution version as obtained from the '/etc/os-release' file.
  String get distroVersionCodename => linuxIdentifier.getVersionCodename();

  /// Gets the codename of the Linux distribution.
  ///
  /// Returns the codename of the Linux distribution as obtained from the 'version' field in the '/etc/os-release' file.
  String get distroCodename => linuxIdentifier.getDistroCodename();

  /// Gets the name of the parent Linux distribution.
  ///
  /// Returns the name of the parent Linux distribution as obtained from the 'id-like' field in the '/etc/os-release' file.
  String get parentDistro => linuxIdentifier.getParentDistro();

  /// Checks if the current Linux distribution is Ubuntu.
  ///
  /// Returns true if the Linux distribution is Ubuntu, false otherwise.
  bool get isUbuntu => linuxIdentifier.isUbuntu();

  /// Checks if the current Linux distribution is Debian.
  ///
  /// Returns true if the Linux distribution is Debian, false otherwise.
  bool get isDebian => linuxIdentifier.isDebian();

  /// Checks if the current Linux distribution is Fedora.
  ///
  /// Returns true if the Linux distribution is Fedora, false otherwise.
  bool get isFedora => linuxIdentifier.isFedora();

  /// Checks if the current Linux distribution is Arch Linux.
  ///
  /// Returns true if the Linux distribution is Arch Linux, false otherwise.
  bool get isArch => linuxIdentifier.isArch();

  /// Checks if the current Linux distribution is either Ubuntu or Debian.
  ///
  /// Returns true if the Linux distribution is either Ubuntu or Debian, false otherwise.
  bool get isUbuntuOrDebian => linuxIdentifier.isUbuntuOrDebian();

  /// Checks if the current Linux distribution is based on Ubuntu.
  ///
  /// Returns true if the Linux distribution is based on Ubuntu, false otherwise.
  bool get isUbuntuBased => parentDistro == 'ubuntu';

  /// Checks if the current Linux distribution is based on Debian.
  ///
  /// Returns true if the Linux distribution is based on Debian, false otherwise.
  bool get isDebianBased => parentDistro == 'debian';
}
