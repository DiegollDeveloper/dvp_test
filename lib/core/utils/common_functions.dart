import 'package:flutter/widgets.dart';
import 'package:crypto_simple/crypto_simple.dart';
import 'package:dvp_test/features/register/data/models/address_model.dart';

class CommonFunctions {
  static String formartDateOfBirth(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static List<String> getAddressesStringsList(List<AddressModel> addresses) {
    List<String> addressesListString = [];
    for (AddressModel address in addresses) {
      addressesListString.add(address.addressController.text);
    }
    return addressesListString;
  }

  static List<String> formatAddressesStringList(List dynamicStringList) {
    List<String> addressesStringList = [];
    for (dynamic element in dynamicStringList) {
      addressesStringList.add(element.toString());
    }
    return addressesStringList;
  }

  static String encrypText(String text) {
    return CryptoSimple.instance.encrypt(inputText: text);
  }

  static String decryptedText(String encryptedText) {
    return CryptoSimple.instance.decrypt(encryptedText: encryptedText);
  }

  static void unfocusAllFields(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
