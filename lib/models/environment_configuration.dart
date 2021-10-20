class EnvironmentConfiguration {
  static const BASE_API_URL = String.fromEnvironment('BASE_API_URL',
      defaultValue: 'http://stage.brickbanker.fans:3000');
  static const IS_PRODUCTION =
      bool.fromEnvironment('dart.vm.product', defaultValue: false);
}
