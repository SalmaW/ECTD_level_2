void main() {
  var l1 = ["flower", "flow", "flight"];
  var l2 = ["dog", "racecar", "car"];
  print(longestCommonPrefix(l1));
  print(longestCommonPrefix(l2));
}

// Function to find the longest common prefix among a list of strings
String longestCommonPrefix(List<String> strs) {
  if (strs.isEmpty) {
    return "";
  }

  String prefix = strs[0];

  for (int i = 1; i < strs.length; i++) {
    while (strs[i].indexOf(prefix) != 0) {
      prefix = prefix.substring(0, prefix.length - 1);
      if (prefix.isEmpty) {
        return "";
      }
    }
  }

  return prefix;
}
