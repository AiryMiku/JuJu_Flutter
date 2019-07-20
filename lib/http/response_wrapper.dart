


class ResponseWrapper<T> {
  Status status;
  T data;
  String msg;

  ResponseWrapper.loading(this.msg): status = Status.LOADING;
  ResponseWrapper.completed(this.data): status = Status.COMPLETED;
  ResponseWrapper.error(this.msg): status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Msg: $msg \n Data: $data";
  }

}


enum Status {LOADING, COMPLETED, ERROR }