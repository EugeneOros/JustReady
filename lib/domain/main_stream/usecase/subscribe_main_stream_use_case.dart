import 'package:injectable/injectable.dart';
import 'package:just_ready/domain/main_stream/model/main_event.dart';
import 'package:just_ready/domain/main_stream/service/main_stream_service.dart';

@injectable
class SubscribeMainStreamUseCase {
  final MainStreamService _service;

  const SubscribeMainStreamUseCase(this._service);

  Stream<MainStreamEvent> call() => _service.getRefreshStream();
}
