class Failure implements Exception {
  Failure({this.message});
  final Object? message;

}

class EmptyResult extends Failure {}

class NoConnection extends Failure {}
