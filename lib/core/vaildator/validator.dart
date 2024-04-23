class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Please enter correct name";
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Field is required';
    } else if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value)) {
      return 'Please enter correct number ';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter correct email";
    } else {
      return null;
    }
  }

  static String? validateAnotherField(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else {
      return null;
    }
  }

  static bool passwordValidate(String pass) {
    String password = pass.trim();
    // trim():used to remove whitespace (spaces, tabs, and newlines) from both the beginning and the end of a string
    // bool hasMatch Checks whether this regular expression has a match in the input . var string = 'Dash is a bird'; var regExp ...

    if (RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)").hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Field is required';
    } else {
      bool result = passwordValidate(value);
      if (result) {
        return null;
      } else {
        return "Your password should contain capital, small, special characters";
      }
    }
  }
}
