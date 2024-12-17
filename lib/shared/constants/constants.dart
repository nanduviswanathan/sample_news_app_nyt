//This class contains the constants

class Constants {
  Constants._();

  // Title texts
  static const String newsAppText = 'News App';
  static const String myNewsText = 'MyNews';
  static const String emailText = 'Email';
  static const String passwordText = 'Password';
  static const String loginText = 'Login';


  static const String enterValidEmailText = 'Please enter a valid email';
  static const String enterValidPasswordText = 'Please enter a valid password';
  static const String requiredText = '*Required';
  static const String topHeadLineText = 'Top Headlines';

  static const String countryText = 'country';
  static const String apiKeyText = 'api-key';
  static const String countryCodeKey = "country_code";
  static const String dismissText = 'Dismiss';
  static const String errorMessage = 'Invalid Credentials';

  static const String confirmLogoutText  =  'Confirm Logout';
  static const String logoutMessageText  = 'Are you sure you want to log out?';
  static const String noText = 'No';
  static const String yesText = 'Yes';

  static const String noInternetConnectionText = 'No internet Connection';

  static const String accountCreatedSucessfullyText =
      'Account created successfully!';
  static const collectionName = 'users';
  static const String newsAPiKey = 'NEWS_API_KEY';

  //Regex Texts
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //API  and endpoints
  static const String kApiBaseUrl = 'https://api.nytimes.com/';
  static const String newsEndpoint = 'svc/topstories/v2/world.json';

  // https://api.nytimes.com/svc/topstories/v2/world.json?api-key=zwvtX9nJDKGBWX2K40otJ4o3G74wLsmZ
}
