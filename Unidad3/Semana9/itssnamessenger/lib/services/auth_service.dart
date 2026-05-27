import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:itssnamessenger/model/user_model.dart';

class AuthService {
  final _supabase = Supabase.instance.client;
  
  String? get currentUserId => _supabase.auth.currentUser?.id;

  User? get currentUser => _supabase.auth.currentUser;
  
  bool get isloggedIn => _supabase.auth.currentUser != null;

  Future<UserModel?> singUp({
    required String email,
    required String password,
    required String userName,
    String? fullName,
  }) async {
    try{
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
            'username': userName,
            'full_name': fullName ?? ''
          },
      );
      final user = response.user;
      if(user != null){
        return UserModel.fromMap(response.user!.userMetadata);
      }
    } catch (e){
      
    }

  }
}