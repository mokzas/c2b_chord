import 'package:c2b/repository/device_info_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_id_provider.g.dart';

@riverpod
class DeviceId extends _$DeviceId {
  @override
  FutureOr<String> build() async {
    return DeviceInfoRepository.deviceId();
  }
}
