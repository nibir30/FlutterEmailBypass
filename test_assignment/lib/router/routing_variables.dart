class Navigation {
  static const String startup = '/';
  static const String splashPage = 'splashPage';
  static const String authPage = 'authPage';
  static const String regPage = 'regPage';
  static const String homePage = 'homePage';
}

class NativeMethods {
  static String get infoChannel => "com.wearefriends.common_channel";

  static String get imageChannel => "com.wearefriends.image_channel";

  static String get methodDeviceInfo => "getDeviceInfo";

  static String get methodGenerateQR => "getQRImage";

  static String get methodFileUploader => "uploadFile";

  static String get methodIOSMicPermission => "getMicPermission";

  static String get methodAudioConfig => "recordAudioConfig";

  static String get sharingChannel => "com.wearefriends.sharing_channel";

  static String get sharingMethod => "shareInvitation";
}
