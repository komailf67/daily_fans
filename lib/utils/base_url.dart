enum MicroServiceEnum { AAA, Rest, Socket }

class BaseUrl {
  static const _domain = "dev.share.ava.aadevs.com";
  static const _subdomains = <String>["aaa", "rest", "socket"];
  static const _urlSchema = "http";

  static String get(MicroServiceEnum baseUrlEnum) {
    return "$_urlSchema://${_subdomains[baseUrlEnum.index]}.$_domain";
  }
}
