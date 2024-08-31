validate(String type, String input) {
  if (input.isEmpty) {
    return "Can't be empty";
  }
  if (type == 'title') {
    if (input.length > 30) {
      return "Can't be more than 30";
    }
  } else {
    if (input.length > 255) {
      return "Can't be more than 255";
    }
  }
  return null;
}
