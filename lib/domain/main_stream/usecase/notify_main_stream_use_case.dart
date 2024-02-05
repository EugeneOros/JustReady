import 'package:injectable/injectable.dart';
import 'package:just_ready/domain/main_stream/model/main_event.dart';
import 'package:just_ready/domain/main_stream/service/main_stream_service.dart';

@injectable
class NotifyMainStreamUseCase {
  final MainStreamService _service;

  const NotifyMainStreamUseCase(this._service);

  void call(MainStreamEvent event) => _service.notifyRefreshStream(event);
}
