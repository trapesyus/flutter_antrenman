import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as renk;

class VideoInfoGogus extends StatefulWidget {
  const VideoInfoGogus({Key? key}) : super(key: key);

  @override
  _VideoInfoGogusState createState() => _VideoInfoGogusState();
}

class _VideoInfoGogusState extends State<VideoInfoGogus> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/VideoInfoGogus.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea
            ? BoxDecoration(
          gradient: LinearGradient(
            colors: [
              renk.AppColor.gradientFirst.withOpacity(0.8),
              renk.AppColor.gradientSecond.withOpacity(0.9),
            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        )
            : BoxDecoration(
          color: renk.AppColor.gradientSecond,
        ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: renk.AppColor.secondPageIconColor,
                        ),
                      ),
                      Icon(
                        Icons.info_outlined,
                        size: 20,
                        color: renk.AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Bacak Bölgesi",
                    style: TextStyle(
                      fontSize: 25,
                      color: renk.AppColor.secondPageTitleIconColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Kalça Egzersizi",
                    style: TextStyle(
                      fontSize: 25,
                      color: renk.AppColor.secondPageTitleIconColor,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              renk.AppColor
                                  .secondPageContainerGradient1stColor,
                              renk.AppColor
                                  .secondPageContainerGradient2stColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: renk.AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "68 DK",
                              style: TextStyle(
                                fontSize: 16,
                                color: renk.AppColor.secondPageIconColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 250,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              renk.AppColor
                                  .secondPageContainerGradient1stColor,
                              renk.AppColor
                                  .secondPageContainerGradient2stColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: renk.AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Bacak Geliştirme Sayfası",
                              style: TextStyle(
                                fontSize: 16,
                                color: renk.AppColor.secondPageIconColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
                : Container(
              child: Column(
                children: [
                  Container(
                    padding:
                    EdgeInsets.only(top: 50, left: 30, right: 30),
                    height: 100,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: renk.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Icon(
                          Icons.info,
                          size: 20,
                          color: renk.AppColor.secondPageTopIconColor,
                        ),
                      ],
                    ),
                  ),
                  _playView(context),
                  _controlView(context),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Antrenman Aşaması-1: Bacak Bölgesi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: renk.AppColor.circuitsColor,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: renk.AppColor.loopColor,
                            ),
                            Text(
                              "3 Set",
                              style: TextStyle(
                                fontSize: 15,
                                color: renk.AppColor.setsColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(child: _listView()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value)
  {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume??0)>0;
    final duration = _duration?.inSeconds ?? 0; // Eğer saniye 0 ise
    final head = _position?.inSeconds ?? 0;
    final remained = max(0,duration-head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(
      children: [
        SliderTheme(data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.red[700],
          inactiveTrackColor: Colors.red[100],
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 2.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          thumbColor: Colors.redAccent,
          overlayColor: Colors.red.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          activeTickMarkColor: Colors.red[700],
          inactiveTickMarkColor: Colors.red[100],
          valueIndicatorColor: Colors.redAccent,
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorTextStyle: TextStyle(
              color: Colors.white
          ),
        ), child: Slider(
          value: max(0,min(_progress*100,100)),
          min: 0,
          max: 100,
          divisions: 100,
          label: _position?.toString().split(".")[0],
          onChanged: (value)
          {
            setState(() {
              _progress = value * 0.01;
            });
          },
          onChangeStart: (value)
          {
            _controller?.pause();
          },
          onChangeEnd: (value)
          {
            final duration = _controller?.value?.duration;
            if(duration!=null)
            {
              var newValue=max(0,min(value,99))*0.01;
              var millis=(duration.inMilliseconds*newValue).toInt();
              _controller?.seekTo(Duration(milliseconds: millis));
              _controller?.play();
            }
          },
        ),),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 5),
          color: renk.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  if (noMute)
                  {
                    _controller?.setVolume(0);
                  }
                  else
                  {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {

                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      noMute?Icons.volume_up:Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () async {
                    final index = _isPlayingIndex - 1;
                    if (index >= 0 && videoInfo.length >= 0) {
                      _onTapVideo(index);
                    } else {
                      Get.snackbar("Video", "",
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(
                            Icons.face,
                            size: 30,
                            color: Colors.white,
                          ),
                          backgroundColor: renk.AppColor.gradientSecond,
                          colorText: Colors.white,
                          messageText: Text(
                            "İlk Videoda Bulunmaktasınız",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ));
                    }
                  },
                  child: Icon(
                    Icons.fast_rewind,
                    size: 36,
                    color: Colors.white,
                  )),
              FlatButton(
                  onPressed: () async {
                    if (_isPlaying) {
                      setState(() {
                        _isPlaying = false;
                      });
                      _controller?.pause();
                    } else {
                      setState(() {
                        _isPlaying = true;
                      });
                      _controller?.play();
                    }
                  },
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 36,
                    color: Colors.white,
                  )),
              FlatButton(
                  onPressed: () async {
                    final index = _isPlayingIndex + 1;
                    if (index <= videoInfo.length - 1) {
                      _onTapVideo(index);
                    } else {
                      Get.snackbar("Video", "",
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(
                            Icons.face,
                            size: 30,
                            color: Colors.white,
                          ),
                          backgroundColor: renk.AppColor.gradientSecond,
                          colorText: Colors.white,
                          messageText: Text(
                            "Daha fazla video bulunmamaktadır.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ));
                    }
                  },
                  child: Icon(
                    Icons.fast_forward,
                    size: 36,
                    color: Colors.white,
                  )),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0,1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
                "Video Yükleniyor...",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )));
    }
  }

  var _onUpdateControllerTime;
  Duration ? _duration;
  Duration ? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }
    if(_duration == null)
    {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if(duration ==null)
    {
      return ;
    }
    var position = await controller.position;
    _position=position;

    final playing = controller.value.isPlaying;
    if(playing)
    {
      if(_disposed)
      {
        return;
      }
      setState(() {
        _progress = position!.inMicroseconds.ceilToDouble()/duration.inMicroseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _onTapVideo(int index) {
    final controller =
    VideoPlayerController.asset(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});

    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener((_onControllerUpdate));
        _controller!.play();
        setState(() {});
      });
  }

  _listView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      width: 200,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(videoInfo[index]["thumbnail"]),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFEAEEFC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15sn dinlenme",
                    style: TextStyle(
                      color: Color(0xFF839FED),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 80; i++)
                    Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
