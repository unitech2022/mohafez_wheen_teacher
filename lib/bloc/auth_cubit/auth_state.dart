part of 'auth_cubit.dart';

class AuthState extends Equatable {
// register
  final RequestState? registerUserState;
  final ResponseRegister? responseRegister;

//login
  final UserResponse? userResponseModel;
  final RequestState? loginUserState;

// other state
 final RequestState? selectDropState;
  const AuthState(
      {this.registerUserState,
      this.responseRegister,
  
      this.userResponseModel,
       this.selectDropState,

      this.loginUserState});

  AuthState copyWith(
      {final registerUserState,
      final responseRegister,
      final userResponseModel,
        final  currentCountry,
    final currentGender,
     final RequestState? selectDropState,
      final loginUserState}) {
    return AuthState(

        registerUserState: registerUserState ?? this.registerUserState,
        responseRegister: responseRegister ?? this.responseRegister,
        userResponseModel: userResponseModel ?? this.userResponseModel,
         selectDropState: selectDropState ?? this.selectDropState,
        loginUserState: loginUserState ?? this.loginUserState);
  }

  @override
  List<Object?> get props =>
      [registerUserState, responseRegister, userResponseModel, loginUserState,selectDropState];
}
