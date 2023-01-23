import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antrenman/video_info_gogus.dart';
import 'package:flutter_antrenman/video_info_kalca.dart';
import 'package:flutter_antrenman/video_info_karin.dart';
import 'package:flutter_antrenman/video_info_kol.dart';
import 'package:flutter_antrenman/video_info_sirt.dart';
import 'package:get/get.dart';
import 'colors.dart' as renk;
import 'video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/bilgi.json").then((
        value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: renk.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
        Row(
        children: [
        Text(
        "Pleksus",
          style: TextStyle(
            fontSize: 30,
            color: renk.AppColor.homePageTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: renk.AppColor.homePageIcons,
        ),

      SizedBox(
        width: 10,
      ),
      Icon(
        Icons.calendar_today_outlined,
        size: 20,
        color: renk.AppColor.homePageIcons,
      ),
      SizedBox(
        width: 15,
      ),
      Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: renk.AppColor.homePageIcons,
      ),
      ],
    ),
    SizedBox(
    height: 30,
    ),
    Row(
    children: [
    Text(
    "Senin Programın",
    style: TextStyle(
    fontSize: 20,
    color: renk.AppColor.homePageSubTitle,
    fontWeight: FontWeight.w700,
    ),
    ),
    Expanded(
    child: Container(),
    ),
    Text(
    "Ayrıntılar",
    style: TextStyle(
    fontSize: 20,
    color: renk.AppColor.homePageDetail,
    ),
    ),
    SizedBox(
    width: 5,
    ),
    InkWell(
    onTap: (){
    Get.to(()=>VideoInfo());
    },
    child:Icon(
    Icons.arrow_forward,
    size: 20,
    color: renk.AppColor.homePageIcons,
    ),
    ),
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Container(
    width: MediaQuery.of(context).size.width,
    height: 220,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    renk.AppColor.gradientFirst.withOpacity(0.8),
    renk.AppColor.gradientSecond.withOpacity(0.9),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.centerRight,
    ),
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    topRight: Radius.circular(80),
    ),
    boxShadow: [
    BoxShadow(
    offset: Offset(5, 10),
    blurRadius: 20,
    color: renk.AppColor.gradientSecond.withOpacity(0.2),
    ),
    ],
    ),
    child: Container(
    padding: EdgeInsets.only(
    left: 20,
    top: 25,
    right: 20,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Sıradaki Çalışma",
    style: TextStyle(
    fontSize: 16,
    color: renk.AppColor.homePageContainerTextSmall,
    ),
    ),
    SizedBox(
    height: 5,
    ),
    Text(
    "Bacak Bölgesi",
    style: TextStyle(
    fontSize: 25,
    color: renk.AppColor.homePageContainerTextSmall,
    ),
    ),
    SizedBox(
    height: 5,
    ),
    Text(
    "Kalça Egzersizi",
    style: TextStyle(
    fontSize: 25,
    color: renk.AppColor.homePageContainerTextSmall,
    ),
    ),
    SizedBox(
    height: 25,
    ),
    Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Row(
    children: [
    Icon(
    Icons.timer,
    size: 28,
    color: renk.AppColor.homePageContainerTextSmall,
    ),
    SizedBox(
    width: 10,
    ),
    Text(
    "1 Saat",
    style: TextStyle(
    fontSize: 13,
    color: renk.AppColor.homePageContainerTextSmall,
    ),
    ),
    ],
    ),
    Expanded(
    child: Container(),
    ),
    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(60),
    boxShadow: [
    BoxShadow(
    color: renk.AppColor.gradientFirst,
    blurRadius: 10,
    offset: Offset(4, 8),
    ),
    ],
    ),
    child: InkWell(
      onTap: (){
        Get.to(()=>VideoInfo());
      },
      child: Icon(
      Icons.play_circle_fill,
      color: Colors.white,
      size: 60,
      ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    SizedBox(
    height: 5,
    ),
    Container(
    height: 180,
    width: MediaQuery.of(context).size.width,
    child: Stack(
    children: [
    Container(
    width: MediaQuery.of(context).size.width,
    height: 120,
    margin: EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    image: DecorationImage(
    fit: BoxFit.fitWidth,
    image: AssetImage(
    "card.jpg",
    ),
    ),
    boxShadow: [
    BoxShadow(
    blurRadius: 40,
    offset: Offset(8, 10),
    color: renk.AppColor.gradientSecond.withOpacity(0.3),
    ),
    BoxShadow(
    blurRadius: 10,
    offset: Offset(-1, -5),
    color: renk.AppColor.gradientSecond.withOpacity(0.3),
    ),
    ],
    ),
    ),
    Container(
    width: double.maxFinite,
    height: 180,
    margin: EdgeInsets.only(left: 25, top: 55),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Harika Gidiyorsun!",
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.amber,
    ),
    ),
    SizedBox(
    height: 10,
    ),
    RichText(
    text: TextSpan(
    text: "Aynen devam et :)\n",
    style: TextStyle(
    color: Colors.grey,
    fontSize: 14,
    ),
    children: [
    TextSpan(
    text: "Plana Bağlı Kal",
    ),
    ]),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    Row(
    children: [
    Text(
    "Odak Bölgesi",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: renk.AppColor.homePageSubTitle,
    ),
    ),
    ],
    ),
    SizedBox(height: 10,),
    Expanded(
    child: OverflowBox(
    maxWidth: MediaQuery.of(context).size.width,
    child: MediaQuery.removePadding(
    removeTop: true,
    context: context,
    child: ListView.builder(
    itemCount: (info.length.toDouble() / 2).toInt(),
    itemBuilder: (_, i) {
    int a = 2 * i; // 0,2,4
    int b = 2 * i + 1; // 1,3,5
    return Row(
    children: [
    Container(
    margin: EdgeInsets.only(left: 30,bottom: 15,right: 30,top: 15),
    padding: EdgeInsets.only(bottom: 5),
    height: 140,
    width: (MediaQuery.of(context).size.width-90)/2,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    image: DecorationImage(
    image: AssetImage(
    info[a]['img'],
    ),
    ),
    boxShadow: [
    BoxShadow(
    blurRadius: 3,
    offset: Offset(5, 5),
    color:
    renk.AppColor.gradientSecond.withOpacity(0.1),
    ),
    BoxShadow(
    blurRadius: 3,
    offset: Offset(-5, -5),
    color:
    renk.AppColor.gradientSecond.withOpacity(0.1),
    ),
    ],
    ),

    child: InkWell(
      onTap: (){
        if(info[a]['title'] == "Kalça")
          {
            Get.to(()=>VideoInfoKalca());
          };
        if(info[a]['title'] == "Bacak")
        {
          Get.to(()=>VideoInfo());
        };
        if(info[a]['title'] == "Göğüs")
        {
          Get.to(()=>VideoInfoGogus());
        };
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Center(
      child: Text(
        info[a]['title'],
        style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        ),
        ),
      ),

      ],
      ),
    ),
    ),
    Container(
    margin: EdgeInsets.only(right: 30,bottom: 15,top: 15),
    padding: EdgeInsets.only(bottom: 5),
    height: 140,
    width: (MediaQuery.of(context).size.width-90)/2,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    image: DecorationImage(
    image: AssetImage(
    info[b]['img'],
    ),
    ),
    boxShadow: [
    BoxShadow(
    blurRadius: 3,
    offset: Offset(5, 5),
    color:
    renk.AppColor.gradientSecond.withOpacity(0.1),
    ),
    BoxShadow(
    blurRadius: 3,
    offset: Offset(-5, -5),
    color:
    renk.AppColor.gradientSecond.withOpacity(0.1),
    ),
    ],
    ),

    child: InkWell(
      onTap: (){
        if(info[b]['title'] == "Karın")
        {
          Get.to(()=>VideoInfoKarin());
        };
        if(info[b]['title'] == "Kol")
        {
          Get.to(()=>VideoInfoKol());
        };
        if(info[b]['title'] == "Sırt")
        {
          Get.to(()=>VideoInfoSirt());
        };
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Center(
      child: Text(
      info[b]['title'],
      style: TextStyle(
      fontSize: 20,
      color: Colors.black,
      ),
      ),
      ),
      ],
      ),
    ),
    ),
    ],
    );
    },
    ),
    ),
    ),
    ),
    ],
    )
    ,
    )
    ,
    );
  }
}
