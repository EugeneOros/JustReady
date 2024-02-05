import 'package:injectable/injectable.dart';
import 'package:just_ready/domain/main_stream/model/main_event.dart';
import 'package:just_ready/domain/main_stream/service/main_stream_service.dart';
import 'package:just_ready/extensions/refresh_stream_mixin.dart';

@LazySingleton(as: MainStreamService)
class MainStreamServiceImpl extends MainStreamService with RefreshStreamMixin<MainStreamEvent> {}
