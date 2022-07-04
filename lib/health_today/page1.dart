import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:graduation_project/health_today/page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

    void bottomSheetHappened() {
      scaffoldState.currentState?.showBottomSheet(
          (context) => Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 5, left: 5, bottom: 5),
                child: Container(
                  height: 370,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            // top: 17.0,
                            left: 10,
                            right: 10,
                            bottom: 5),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Event'),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            // top: 17.0,
                            left: 10,
                            right: 10,
                            bottom: 5),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Event'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'ADD',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          backgroundColor: Colors.white.withOpacity(0.1));
    }

    return Scaffold(
      key: scaffoldState,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/Hospi.jpeg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.apps,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/244909774_4389031107886389_1824828592963628060_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEtXGF80TCgikzoyfKUspfyQ1HCvaG0g_tDUcK9obSD-wXSL5rJ1I8Og6rEz8KxGCHgqeWUrJ1D1MOH6pDZIHKm&_nc_ohc=euX03UqimygAX867A6F&tn=nZNs94L0GfYgGC3a&_nc_ht=scontent.faly1-2.fna&oh=00_AT-3btLQnlO_9akexVPR2yIgUdYN_WFfj7Tq3OTd71PL3A&oe=623A839D'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                """   How is your
   health Today?""",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Container(
                  width: double.infinity,
                  height: 553,
                  decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: Column(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CalendarDatePicker(
                                firstDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 100000)),
                                onDateChanged: (val) => bottomSheetHappened(),
                              ))),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Row(
                            children: [],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
