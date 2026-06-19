class Authstate {
  final bool isloading;
  final String? error;
  Authstate({this.isloading = false, this.error});
  Authstate copyWith({bool? isLoading, String? error}) {
    return Authstate(isloading: isLoading ?? isloading, error: error);
  }
}
