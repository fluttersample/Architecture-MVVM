

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status,this.message,this.data);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.init() : status =Status.INIT;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status =Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}


enum Status {LOADING, COMPLETED, ERROR ,INIT}
