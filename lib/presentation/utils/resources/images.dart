class Images {
  factory Images() {
    return _instance;
  }
  Images._();

  static final Images _instance = Images._();
  static String iconsRoute = 'assets/icons';
  static String imagesRoute = 'assets/images';
  final account = "$iconsRoute/account.svg";
  final addDevice = "$iconsRoute/add_device.svg";
  final appIcon = "$iconsRoute/app_icon.svg";
  final appIconPNG = "$imagesRoute/app_icon.png";
  final appTextIcon = "$imagesRoute/text_icon_app.png";
  final noConnect = "$iconsRoute/connect_no.svg";
  final yesConnect = "$iconsRoute/connect_yes.svg";
  final devices = "$iconsRoute/devices.svg";
  final humidity = "$iconsRoute/humidity.svg";
  final reports = "$iconsRoute/reports.svg";
  final sad = "$iconsRoute/sad.svg";
  final settings = "$iconsRoute/settings.svg";
  final temperature = "$iconsRoute/temperature.svg";
  final deviceIcon = "$iconsRoute/device_icon.svg";
  final rain = "$iconsRoute/rain.svg";
}
