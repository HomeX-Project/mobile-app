// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// // import 'package:image/image.dart' as img;
//
// class CustomMjpegStream extends StatefulWidget {
//   final String streamUrl;
//
//   CustomMjpegStream({required this.streamUrl});
//
//   @override
//   _CustomMjpegStreamState createState() => _CustomMjpegStreamState();
// }
//
// class _CustomMjpegStreamState extends State<CustomMjpegStream> {
//   StreamController<Uint8List>? _streamController;
//   late StreamSubscription _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _streamController = StreamController<Uint8List>();
//     _startStream();
//   }
//
//   Future<void> _startStream() async {
//     try {
//       final response = await http.Client().send(http.Request('GET', Uri.parse(widget.streamUrl)));
//       _subscription = response.stream.listen((chunk) {
//         final Uint8List uint8listChunk = Uint8List.fromList(chunk);
//         final image = img.decodeJpg(uint8listChunk);
//         if (image != null) {
//           _streamController?.add(Uint8List.fromList(img.encodeJpg(image)));
//         }
//       });
//     } catch (e) {
//       print('Error streaming MJPEG: $e');
//       _streamController?.addError('Error streaming MJPEG: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _subscription.cancel();
//     _streamController?.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Uint8List>(
//       stream: _streamController?.stream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData) {
//           return Center(child: Text('No MJPEG stream available'));
//         } else {
//           return Image.memory(snapshot.data!);
//         }
//       },
//     );
//   }
// }
