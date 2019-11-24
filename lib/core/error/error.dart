class AppError {
  AppError({this.code = 'app_error', this.message = 'No details given.'});
  final String code, message;
}

class AppErrorNoNetwork extends AppError {
  AppErrorNoNetwork({code = 'app_error_no_network', message = 'No details given.'}) : super(code: code, message: message);
}

class AppErrorApi extends AppError {
  AppErrorApi({code = 'app_error_api', message = 'No details given.'}) : super(code: code, message: message);
}

class AppErrorNoData extends AppError {
  AppErrorNoData({code = 'app_error_no_data', message = 'No details given.'}) : super(code: code, message: message);
}

class AppErrorInternal extends AppError {
  AppErrorInternal({code = 'app_error_internal', message = 'No details given.'}) : super(code: code, message: message);
} 