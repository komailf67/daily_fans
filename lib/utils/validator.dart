class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return "email is empty";
    var regEx =
        RegExp(r"^[a-z0-9_\-]+@[a-z0-9]{3,}\.[a-z]{3,}$", caseSensitive: false);
    if (!regEx.hasMatch(email)) return "email not correct!";
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return "password is empty";
    var regEx = RegExp(r"^(?=.*[!@#$&*]+)(?=.*[0-9]+)(?=.*[a-zA-Z]+).{8,}$",
        caseSensitive: true);
    if (!regEx.hasMatch(password)) {
      return "Password should have letters, numbers and at least one symbol!";
    }
  }
}
