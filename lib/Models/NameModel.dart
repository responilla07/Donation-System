class NameModel {
  String
    forename,
    surname,
    fullName;

  NameModel( Map<dynamic, dynamic> data ) {
    this.forename = data["forename"] ?? "";
    this.surname = data["surname"] ?? "";
    this.fullName = data["fullName"] ?? "";
  }

  setName() {
    return {
      "forename" : this.forename,
      "surname" : this.surname,
      "fullName" : this.forename + " " + this.surname,
    };
  }
}