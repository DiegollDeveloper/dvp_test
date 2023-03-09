class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() => _instance;

  late String names;
  late String lastNames;
  late String dateOfBirth;
  late List<String> addresses;

  UserData._internal() {
    names = "";
    lastNames = "";
    dateOfBirth = "";
    addresses = [];
  }

  void clearData() {
    names = "";
    lastNames = "";
    dateOfBirth = "";
    addresses = [];
  }

  UserData copyWith({
    String? names,
    String? lastNames,
    String? dateOfBirth,
    List<String>? addresses,
  }) {
    _instance.names = names ?? this.names;
    _instance.lastNames = lastNames ?? this.lastNames;
    _instance.dateOfBirth = dateOfBirth ?? this.dateOfBirth;
    _instance.addresses = addresses ?? this.addresses;
    return _instance;
  }
}
