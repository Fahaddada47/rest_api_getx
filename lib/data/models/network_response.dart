class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<dynamic, dynamic>? responseJson;

  NetworkResponse(this.isSuccess, this.statusCode, this.responseJson);

  get data => null;
}
