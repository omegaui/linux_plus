String toJsonKey(String key) {
  String jsonKey = "";
  jsonKey = key.codeUnits
      .map((e) {
        var x = String.fromCharCode(e).toLowerCase();
        return x == "_" ? "-" : x;
      })
      .toList()
      .join();
  return jsonKey;
}
