class CallResult {
  final int status;
  final String statusMsg;
  final dynamic data;
  final String error;
  final bool isSuccess;

  CallResult(
      {required this.status,
      required this.statusMsg,
      required this.data,
      required this.isSuccess,
      required this.error});
}
