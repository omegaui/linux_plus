import 'package:linux_plus/src/io/linux/linux_identifier.dart';

var linuxIdentifier = LinuxIdentifier();

/// A class that provides additional methods to retrieve Linux distribution information.
final class LinuxPlus {
  /// Gets the name of the Linux distribution.
  ///
  /// Returns the name of the Linux distribution as obtained from the '/etc/os-release' file.
  static String get distro => linuxIdentifier.getDistroName();

  /// Gets the full user-friendly name of the Linux distribution.
  ///
  /// Returns the full user-friendly name of the Linux distribution as obtained from the '/etc/os-release' file.
  static String get fullDistroName => linuxIdentifier.getFullDistroName();

  /// Gets the version of the Linux distribution.
  ///
  /// Returns the version of the Linux distribution as obtained from the '/etc/os-release' file.
  static String get distroVersion => linuxIdentifier.getVersionID();

  /// Gets the codename of the Linux distribution version.
  ///
  /// Returns the codename of the Linux distribution version as obtained from the '/etc/os-release' file.
  static String get distroVersionCodename =>
      linuxIdentifier.getVersionCodename();

  /// Gets the codename of the Linux distribution.
  ///
  /// Returns the codename of the Linux distribution as obtained from the 'version' field in the '/etc/os-release' file.
  static String get distroCodename => linuxIdentifier.getDistroCodename();

  /// Gets the name of the parent Linux distribution.
  ///
  /// Returns the name of the parent Linux distribution as obtained from the 'id-like' field in the '/etc/os-release' file.
  static String get parentDistro => linuxIdentifier.getParentDistro();

  /// Checks if the current Linux distribution is Ubuntu.
  ///
  /// Returns true if the Linux distribution is Ubuntu, false otherwise.
  static bool get isUbuntu => linuxIdentifier.isUbuntu();

  /// Checks if the current Linux distribution is Debian.
  ///
  /// Returns true if the Linux distribution is Debian, false otherwise.
  static bool get isDebian => linuxIdentifier.isDebian();

  /// Checks if the current Linux distribution is Fedora.
  ///
  /// Returns true if the Linux distribution is Fedora, false otherwise.
  static bool get isFedora => linuxIdentifier.isFedora();

  /// Checks if the current Linux distribution is Arch Linux.
  ///
  /// Returns true if the Linux distribution is Arch Linux, false otherwise.
  static bool get isArch => linuxIdentifier.isArch();

  /// Checks if the current Linux distribution is either Ubuntu or Debian.
  ///
  /// Returns true if the Linux distribution is either Ubuntu or Debian, false otherwise.
  static bool get isUbuntuOrDebian => linuxIdentifier.isUbuntuOrDebian();

  /// Checks if the current Linux distribution is based on Ubuntu.
  ///
  /// Returns true if the Linux distribution is based on Ubuntu, false otherwise.
  static bool get isUbuntuBased => parentDistro == 'ubuntu';

  /// Checks if the current Linux distribution is based on Debian.
  ///
  /// Returns true if the Linux distribution is based on Debian, false otherwise.
  static bool get isDebianBased => parentDistro == 'debian';
}
