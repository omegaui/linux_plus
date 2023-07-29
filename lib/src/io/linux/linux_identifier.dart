// Import the necessary Dart libraries
import 'dart:io';

// Import the 'linux_plus' library to use the 'toJsonKey' function
import 'package:linux_plus/src/io/utils.dart';

/// A class that helps identify information about the Linux distribution
/// by reading data from the '/etc/os-release' file.
class LinuxIdentifier {
  final Map<String, String> _data = {};

  /// A read only property for [_data] for accessing additional keys
  Map<String, String> get linuxInfo => _data;

  /// Constructs a [LinuxIdentifier] object and reads the '/etc/os-release' file
  /// to populate the [_data] map with the distribution information.
  LinuxIdentifier() {
    // Will only read release data if the current platform is linux
    if (Platform.isLinux) {
      // Create a File object representing the '/etc/os-release' file
      var releaseFile = File('/etc/os-release');

      // Read the file line by line and process the data
      releaseFile.readAsLinesSync().forEach((line) {
        // Trim the line to remove leading and trailing spaces
        line = line.trim();

        // If the line is not empty after trimming, proceed
        if (line.isNotEmpty) {
          // Find the index of the first '=' character
          int index = line.indexOf('=');

          // Extract the key and value parts from the line
          String key = line.substring(0, index);
          String value = line.substring(index + 1);

          // Convert the key to a JSON-style key using 'toJsonKey' function
          // and add it to the [_data] map with the corresponding value
          _data.putIfAbsent(toJsonKey(key), () => value);
        }
      });
    }
  }

  /// Private method to query the [_data] map for a given key.
  /// If the key is not found, it returns the provided [fallback] value.
  String _query(String key, {String fallback = ""}) {
    return _data[key] ?? fallback;
  }

  /// Gets the distribution name from the '/etc/os-release' file.
  String getDistroName() {
    return _query('id', fallback: "unknown");
  }

  /// Gets the distribution name in a more user-friendly format
  /// from the '/etc/os-release' file.
  String getFullDistroName() {
    return _query('pretty-name', fallback: "unavailable");
  }

  /// Gets the version ID of the Linux distribution from the '/etc/os-release' file.
  String getVersionID() {
    return _query('version-id');
  }

  /// Gets the codename of the Linux distribution version from the '/etc/os-release' file.
  String getVersionCodename() {
    return _query('version-codename', fallback: "no-codename");
  }

  /// Gets the codename of the Linux distribution from the '/etc/os-release' file.
  /// This is extracted from the 'version' field if available.
  String getDistroCodename() {
    var version = _query('version');
    if (version.contains('(')) {
      return version.substring(version.indexOf('(') + 1, version.indexOf(')'));
    }
    return "no-distro-codename";
  }

  /// Gets the name of the parent Linux distribution from the '/etc/os-release' file.
  String getParentDistro() {
    return _query('id-like', fallback: "no-parent-distro");
  }

  /// Checks if the current distribution is either Ubuntu or Debian.
  bool isUbuntuOrDebian() {
    return ["ubuntu", "debian"].contains(getDistroName());
  }

  /// Checks if the current distribution is Ubuntu.
  bool isUbuntu() {
    return getDistroName() == 'ubuntu';
  }

  /// Checks if the current distribution is Debian.
  bool isDebian() {
    return getDistroName() == 'debian';
  }

  /// Checks if the current distribution is Fedora.
  bool isFedora() {
    return getDistroName() == 'fedora';
  }

  /// Checks if the current distribution is Arch Linux.
  bool isArch() {
    return getDistroName() == 'arch';
  }
}
