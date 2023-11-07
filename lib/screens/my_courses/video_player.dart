// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
//
// class VideoPlayerScreen extends StatefulWidget {
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController videoPlayerController;
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     videoPlayerController = VideoPlayerController.network(
//         'https://samplelib.com/lib/preview/mp4/sample-10s.mp4'
//     );
//
//   }
//
//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: videoPlayerController.value.size.aspectRatio > 0.0 ? MediaQuery.of(context).size.width / videoPlayerController.value.size.aspectRatio : MediaQuery.of(context).size.width / (16/9),
//         child: Chewie(
//
//           key: const PageStorageKey('https://samplelib.com/lib/preview/mp4/sample-10s.mp4'),
//           controller: ChewieController(
//
//             videoPlayerController: videoPlayerController,
//             fullScreenByDefault: true,
//             aspectRatio:   16/9,
//             showOptions: false,
//             autoInitialize: false,
//             looping: false,
//             autoPlay: false,
//             allowFullScreen: true,
//
//             errorBuilder: (context, errorMessage) {
//               return const Center(
//                 child: Text(
//                   '',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final  title;

  const VideoPlayerScreen({super.key, required this.url, this.title});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse('${AppConstants.VIDEO_URL}${widget.url}'),
    );

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      //fullScreenByDefault: true,
      allowFullScreen: true,
      
      autoInitialize: true
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Center(
            child: Chewie(controller: _chewieController),
          ),
          Positioned(
              top: 40,left: 24,
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          CupertinoIcons.arrow_left,
                          size: 28,
                          color: Colors.white,
                        )),
                    Text(
                      '${widget.title}',
                      style: GoogleFonts.jost(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 21),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
