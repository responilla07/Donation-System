class PayMongoAPIModel {
  String cardNumber;
  int expMonth;
  int expYear;
  String cvc;
  
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String postalCode;
  String country;

  String fullName;
  String email;
  String phone;

  int amount;
  String paymentOption;
  
  PayMongoAPIModel(Map<String, dynamic> data){
    this.cardNumber = data["card_number"] ?? null;
    this.expMonth = data["exp_month"] ?? null;
    this.expYear = data["exp_year"] ?? null;
    this.cvc = data["cvc"] ?? null;

    this.addressLine1 = data["address_line1"] ?? null;
    this.addressLine2 = data["address_line2"] ?? "";
    this.city = data["city"] ?? null;
    this.state = data["state"] ?? null;
    this.postalCode = data["postal_code"] ?? null;
    this.country = data["country"] ?? "";

    this.fullName = data["full_name"] ?? null;
    this.email = data["email"] ?? null;
    this.phone = data["phone"] ?? null;

    this.amount = data["amount"] ?? null;
    this.phone = data["ref_id"] ?? null;
    this.paymentOption = data["payment_option"] ?? null;
  }

  Map<String, dynamic> createData() {
    return {
      "card_number" : this.cardNumber,
      "exp_month" : this.expMonth,
      "exp_year" : this.expYear,
      "cvc" : this.cvc,

      "address_line1" : this.addressLine1,
      "address_line2" : this.addressLine2,
      "city" : this.city,
      "state" : this.state,
      "postal_code" : this.postalCode,
      "country" : this.country,

      "full_name" : this.fullName,
      "email" : this.email,
      "phone" : this.phone,

      "amount" : this.amount,
      "payment_option" : this.paymentOption,
    };
  }
}