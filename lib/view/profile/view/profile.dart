import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
             const Padding(
                padding:  EdgeInsets.all(16.0),
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      ),
                    ]),
                child: ListTile(
                  onTap: () {
                    // linkShare();
                  },
                  leading: IconButton(
                    onPressed: (() {
                      // linkShare();
                    }),
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'Share',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      ),
                    ]),
                child: ListTile(
                  onTap: () {
                    // GetSettings.feedBack();
                  },
                  leading: IconButton(
                    onPressed: (() {
                      // GetSettings.feedBack();
                    }),
                    icon: const Icon(
                      Icons.list_alt_rounded,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'Feedback',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      ),
                    ]),
                child: ListTile(
                  onTap: () {},
                  leading: IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.star_border_rounded,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'Rate App',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      ),
                    ]),
                child: ListTile(
                  onTap: () {
                    // GetSettings.about();
                  },
                  leading: IconButton(
                    onPressed: (() {
                      // GetSettings.about();
                    }),
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'About Developer',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                height10,
                                const Text(
                                  'Are You Sure to Logout',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Cancel"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          homePageController.logOut(context);
                                        },
                                        child: const Text("Logout"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.grey,
                        ),
                      ]),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "SignOut",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: height / 2.5,
              // ),
              const Center(
                child: Text(
                  'v 1.0.0',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
