
import 'package:shared_preferences/shared_preferences.dart';

Future<String> readD() async{
  final prefs = await SharedPreferences.getInstance();
  final key = 'n';
  final value = prefs.getString(key) ?? 0;
  return value;
}
saveD(now_value) async{
  final prefs = await SharedPreferences.getInstance();
        final key = 'n';
        final value = now_value;
        prefs.setString(key, value);      
}

