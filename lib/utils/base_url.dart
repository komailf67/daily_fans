enum MicroServiceEnum { AAA, Rest, Socket }

class BaseUrl {
  // static const _domain = "dev.share.ava.aadevs.com";
  static const _domain = "dailyfans.goldenhat.info/Users/authenticate";
  static const _subdomains = <String>["aaa", "rest", "socket"];
  static const _urlSchema = "https";

  static String get(MicroServiceEnum baseUrlEnum) {
    // return "$_urlSchema://${_subdomains[baseUrlEnum.index]}.$_domain";
    return "https://dailyfans.goldenhat.info";
  }
}
