import 'package:just_ready/domain/main_stream/model/main_event.dart';

abstract class MainStreamService {
  Stream<MainStreamEvent> getRefreshStream();

  void notifyRefreshStream(MainStreamEvent event);
}
