String totalCount(int total) {
  int length = total.toString().length;
  String totalCount = "";
  String reversedDisplay = "";
  
  if (length <= 3) { 
    totalCount = total.toString();
  } else if (length > 3 && length < 6) {
    int count = 0;
    for (int i = 0; i < length; i++) {
      if (count == 3) {
        reversedDisplay += ",";
      }
      if (count == 3) {
        count = 0;
      }
      reversedDisplay += total.toString()[(length - 1) - i];
      count++;
    }
    for (int i = 0; i < reversedDisplay.length; i++) {
      totalCount += reversedDisplay[(reversedDisplay.length - 1) - i];
    }
  } else {
    if (length == 6) {
      // thousands
      totalCount = total.toString().substring(0, 3) + "K+";
    } else if (length == 7 && total < 1099999) {
      // millions without hundred thousands
      totalCount = total.toString().substring(0, 1) + "M+";
    } else if (length == 7 && total > 1099999) {
      // millions with hundred thousands
      totalCount = total.toString().substring(0, 1) +
          "." +
          total.toString().substring(1, 2) +
          "M+";
    } else if (length == 8 && total < 10099999) {
      // greater than 9 millions without hundred thousands
      totalCount = total.toString().substring(0, 2) + "M+";
    } else if (length == 8 && total > 10099999) {
      // greater than 9 millions with hundred thousands
      totalCount = total.toString().substring(0, 2) +
          "." +
          total.toString().substring(2, 3) +
          "M+";
    } else if (length == 9 && total < 999999999) {
      // greater than 99 millions with hundred thousands
      totalCount = total.toString().substring(0, 3) + "M+";
    } else {
      //greater than 999 millions with hundred thousands
      totalCount = "NaN";
    }
  }

  return totalCount;
}

String numberDecimalComma(int number) {
  int length = number.toString().length;
  String numberDecimalComma = "";
  String reversedDisplay = "";

  int count = 0;
  for (int i = 0; i < length; i++) {
    if (count == 3) {
      reversedDisplay += ",";
    }
    if (count == 3) {
      count = 0;
    }
    reversedDisplay += number.toString()[(length - 1) - i];
    count++;
  }
  for (int i = 0; i < reversedDisplay.length; i++) {
    numberDecimalComma += reversedDisplay[(reversedDisplay.length - 1) - i];
  }

  return numberDecimalComma + ".00";
}
