import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'PEXELS_KEY', obfuscate: true)
  static final pexelsApiKey = _Env.pexelsApiKey;
}
