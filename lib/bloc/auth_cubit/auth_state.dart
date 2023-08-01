part of 'auth_cubit.dart';

class AuthState extends Equatable {
// register
  final RequestState? registerUserState;
  final ResponseRegister? responseRegister;

//login
  final UserResponse? userResponseModel;
  final RequestState? loginUserState;

// get user
  final RequestState? updateUserState;
  final RequestState? getUserState;
  final User? userResponse;
    final RequestState? imageStet;
  final String? image;

// other state
  final RequestState? selectDropState;

  const AuthState(
      {this.registerUserState,
      this.responseRegister,
      this.userResponseModel,
      this.selectDropState,
      this.updateUserState,
      this.getUserState,
      this.userResponse,
         this.imageStet,
      this.image ,
      this.loginUserState});

  AuthState copyWith(
      {final registerUserState,
      final responseRegister,
      final userResponseModel,
      final currentCountry,
      final currentGender,
      final RequestState? selectDropState,
      final loginUserState,
        final RequestState? updateUserState,
  final RequestState? getUserState,
  final User? userResponse,
  final RequestState? imageStet,
          final String? image,
      
      
      }) {
    return AuthState(
       image: image ?? this.image,
          imageStet: imageStet ?? this.imageStet,
        registerUserState: registerUserState ?? this.registerUserState,
        responseRegister: responseRegister ?? this.responseRegister,
        userResponseModel: userResponseModel ?? this.userResponseModel,
        selectDropState: selectDropState ?? this.selectDropState,
        loginUserState: loginUserState ?? this.loginUserState,
                updateUserState: updateUserState ?? this.updateUserState,
        getUserState: getUserState ?? this.getUserState,
        userResponse: userResponse ?? this.userResponse
        
        );
  }

  @override
  List<Object?> get props => [
        registerUserState,
        responseRegister,
        userResponseModel,
        loginUserState,
        selectDropState,
          updateUserState,
 getUserState,
 userResponse,
   imageStet,
        image,
      ];
}
