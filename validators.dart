class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter email';
    }

    if (!value.contains('@')) {
      return 'Enter valid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter password';
    }

    if (value.length < 6) {
      return 'Password must be 6 characters';
    }

    return null;
  }
}