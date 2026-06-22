import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "95817857d6cce14d17563fef46cf2d4da7a56b9076cebe171ddcb2f284d98ccc";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await [Permission.microphone].request();
    final engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(appId: appId));
    await engine.enableAudio();
    await engine.joinChannel(token: null, channelId: "test", uid: 0, options: const ChannelMediaOptions());
  }

  @override
  Widget build(BuildContext context) {
    return
