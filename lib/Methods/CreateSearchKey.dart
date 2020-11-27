class SearchKey {
  int temp = 0;
  List<String> searchKey = List<String>();

  createSearchKey(String text) {
    text = text.toLowerCase();
    for (var textIndex = 0; textIndex <= text.length; textIndex++) {
      for (var i = 0; temp <= text.length; i++) {
        temp = i + textIndex;
        if (temp > text.length) {
          break;
        } else {
          if (!searchKey.contains(text.substring(i, temp)) && text.substring(i, temp) != "") {
            searchKey.add(text.substring(i, temp));
          }
        }
      }
      temp = 0;
    }

    return searchKey;
  }
}