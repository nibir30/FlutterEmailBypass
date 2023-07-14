import 'dart:math';

class DataFormatter {
  static List shuffle(List items) {
    var random = Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}

class WKey {
  static String get regDataKey => "registration_data";
  static String get resetUserNameKey => "reset_username";
  static String get uploadProfilePictureKey => "profile_picture_key";
  static String get loginAuthorizationKey => "authorization_key";
  static String get loginBirthDteKey => "date_birth_key";
  static String get loginMemberIdentifierKey => "member_id_key";
  static String get loginRefreshKey => "refresh_key";
  static String get uploadFeedVideoKey => "feed_video_key";
  static String get uploadVoiceRecordingKey => "voice_record_key";
  static String get symbolsKey => "symbol_list";
  static String get userNameKey => "user_name";
  static String get nameKey => "name";
  static String get profileUrlKey => "profile_url";
  static String get feelingDateKey => "feelings_popup";
  static String get greetingYearKey => "birthday_greeting_year";
  static String get guardianLoggedInStatus => "is_guardian_logged_in";
  static String get libraryMbbsFolderNameKey => "mbbs_library_folders";
  static String get darkThemeStatus => "is_dark_theme";
}
