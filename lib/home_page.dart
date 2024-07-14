import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshopai/home_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    "assets/pattern-wp.jpg",
                    repeat: ImageRepeat.repeat,
                  )),
              Positioned(
                top: 60,
                left: 16,
                right: 16,
                bottom: 80,
                child: ListView(
                  reverse: true,
                  children: value.list
                      .map((e) => Column(
                    crossAxisAlignment: e.posisi == "kiri"
                    ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 240,

                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                    color: e.posisi == "kiri"
                                    ? Colors.white
                                    : Colors.purple,
                                    borderRadius: BorderRadius.circular(16),),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      e.chat,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      e.createdDate,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 8,),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ))
                      .toList(),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    color: Colors.deepPurple[200],
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(360),
                            child: Image.asset(
                              "assets/profile.jpg",
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 16,
                        ),
                        Text("nita"),
                        Spacer(),
                        Icon(
                          Icons.videocam,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.call,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    // height: 60,
                    padding: EdgeInsets.all(5),
                    color: Colors.deepPurple[200],

                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.add),
                        Expanded(
                            child: TextField(
                          controller: value.chat,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: () => value.submit(),
                                  child: Icon(Icons.send)),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  borderSide: BorderSide.none)),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.camera_alt),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.mic),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
