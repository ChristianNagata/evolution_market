import 'package:equatable/equatable.dart';
import 'failures.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  static ErrorObject mapFailureToErrorObject({required FailureEntity failure}) {
    return failure.when(
        serverFailure: () => const ErrorObject(
              title: 'Error Code: INTERNAL_SERVER_FAILURE',
              message:
                  'It seems that the server is not reachable at the moment, try '
                  'again later.',
            ),
        dataParsingFailure: () => const ErrorObject(
              title: 'Error Code: JSON_PARSING_FAILURE',
              message:
                  'It seems that the app needs to be updated to reflect the, '
                  'changed server data structure.',
            ),
        noConnectionFailure: () => const ErrorObject(
              title: 'Error Code: NO_CONNECTIVITY',
              message:
                  'Please check your internet connectivity or try again later.',
            ),
        notFoundFailure: () => const ErrorObject(
              title: 'Error Code: NOT_FOUND_FAILURE',
              message: 'No items found, please try something different.',
            ),
        somethingWentWrongFailure: () => const ErrorObject(
              title: 'Error Code: SOMETHING_WENT_WRONG_FAILURE',
              message:
                  'Oops, something went wrong, please check your internet connectivity or try again later.',
            ));
  }
}
