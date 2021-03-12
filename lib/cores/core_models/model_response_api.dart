enum Status { LOADING, COMPLETED, ERROR }

///this class is a standard model from all return of API
///
class ModelResponseApi<T> {
  ModelResponseApi();
  Status? status;
  T? data;
  String? message;

  ModelResponseApi.loading(this.message) : status = Status.LOADING;
  ModelResponseApi.completed(this.data) : status = Status.COMPLETED;
  ModelResponseApi.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
