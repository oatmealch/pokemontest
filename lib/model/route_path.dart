class RoutePath {
  final int id;
  final bool isUnknown;

  RoutePath.home()
      : id = null,
        isUnknown = false;

  //문제 페이지는 별도 url 라우팅 없이 곧바로 홈페이지에서 띄워서 보여줄 것! 문항별로 주소로 라우팅하게 놔두면 꼬인다
  RoutePath.results(this.id) : isUnknown = false;

  RoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null || id > 8 || id == 0;
  bool get isResultPage => id == null;
}
