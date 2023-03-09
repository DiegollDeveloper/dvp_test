import 'package:dvp_test/features/register/data/models/address_model.dart';

class CommonFunctions {
  static String formartDateOfBirth(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static List<String> getAddressesListString(List<AddressModel> addresses) {
    List<String> addressesListString = [];
    for (AddressModel address in addresses) {
      addressesListString.add(address.addressController.text);
    }
    return addressesListString;
  }
}
