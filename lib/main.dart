import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:smart_house/widgets/splineAreaCart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart House',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SecondRowDevices extends StatefulWidget {
  const SecondRowDevices({super.key});

  @override
  State<SecondRowDevices> createState() => _SecondRowDevicesState();
}

class _SecondRowDevicesState extends State<SecondRowDevices> {
  List<List> firstRow = [
    // device_name, active hours, Icon, switchState
    ["Air Humidifier", 8, Icons.air, false],
    ["Router", 4, Icons.router, true],
    ["Heater", 2, Icons.blur_on_outlined, false]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 120,
      // color: Colors.purple,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: firstRow.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // height: 170
              width: 190,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              // color: Colors.deepOrange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(firstRow[index][2],
                          color: firstRow[index][3] == true
                              ? Colors.amberAccent
                              : Colors.white),
                      CupertinoSwitch(
                          value: firstRow[index][3],
                          activeColor: Colors.amberAccent,
                          thumbColor: const Color.fromARGB(255, 11, 12, 11),
                          onChanged: (value) {
                            setState(() {
                              firstRow[index][3] = value;
                            });
                          })
                    ],
                  ),
                  Text(firstRow[index][0],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("Active for ${firstRow[index][1]} hours",
                      style: const TextStyle(color: Colors.grey))
                ],
              ),
            );
          }),
    );
  }
}

class FirstRowDevices extends StatefulWidget {
  const FirstRowDevices({super.key});

  @override
  State<FirstRowDevices> createState() => _FirstRowDevicesState();
}

class _FirstRowDevicesState extends State<FirstRowDevices> {
  List<List> firstRow = [
    // device_name, active hours, Icon, switchState
    ["Smart Lamp", 8, Icons.lightbulb, true],
    ["Samrt Tv", 4, Icons.tv, false],
    ["Speaker", 2, Icons.speaker, true]
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 120,
      // color: Colors.purple,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: firstRow.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // height: 170
              width: 190,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              // color: Colors.deepOrange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(firstRow[index][2],
                          color: firstRow[index][3] == true
                              ? Colors.amberAccent
                              : Colors.white),
                      CupertinoSwitch(
                          activeColor: Colors.amberAccent,
                          thumbColor: const Color.fromARGB(255, 11, 12, 11),
                          value: firstRow[index][3],
                          onChanged: (value) {
                            setState(() {
                              firstRow[index][3] = value;
                            });
                          })
                    ],
                  ),
                  Text(firstRow[index][0],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("Active for ${firstRow[index][1]} hours",
                      style: const TextStyle(color: Colors.grey))
                ],
              ),
            );
          }),
    );
  }
}

class DevicesList extends StatefulWidget {
  const DevicesList({super.key});

  @override
  State<DevicesList> createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList> {
  final List<List> eleDeviceL = [
    // device_name, number of nuits, energy consumption(Kw), Icon
    ['Air Condition', 2, 42, Icons.heat_pump_rounded],
    ['Smart Lamp', 8, 12, Icons.lightbulb],
    ['Smart Tv', 2, 32, Icons.tv],
    ['Speaker', 1, 4, Icons.speaker],
    ['Router', 1, 2, Icons.router_rounded]
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      // color: Colors.pinkAccent,
      child: ListView.builder(
          itemCount: eleDeviceL.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(eleDeviceL[index][3]),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eleDeviceL[index][0]),
                          const SizedBox(height: 2),
                          Text("${eleDeviceL[index][1]} units",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(width: 100),
                  Text(
                    "${eleDeviceL[index][2]}Kw",
                    style: const TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class RoomSelector extends StatefulWidget {
  const RoomSelector({super.key});

  @override
  State<RoomSelector> createState() => _RoomSelectorState();
}

class _RoomSelectorState extends State<RoomSelector> {
  int selectedRoom = 0;
  final List<String> rooms = [
    "Living Room",
    "Master Bedroom",
    "Bedroom",
    "Kitchen Room",
    "Dining Room",
    "Family Room"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: rooms.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedRoom = index;
                });
              },
              child: Container(
                // color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            color: index == selectedRoom
                                ? Colors.amberAccent
                                : Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2))),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        rooms[index],
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1.1,
                          color: index == selectedRoom
                              ? Colors.amberAccent
                              : Colors.grey,
                        ),
                      )
                    ]),
              ),
            );
          }),
    );
  }
}

class SideBarSelector extends StatefulWidget {
  const SideBarSelector({super.key});

  @override
  State<SideBarSelector> createState() => _SideBarSelectorState();
}

class _SideBarSelectorState extends State<SideBarSelector> {
  int selectedSideB = 0;
  final List<List> sideBarI = [
    ['Dashboard', Icons.dashboard_outlined],
    ['Rooms', Icons.home_outlined],
    ['Power Analytics', Icons.insert_chart_outlined_rounded],
    ['Notification', Icons.notifications_none_outlined],
    ['Preferences', Icons.settings_outlined]
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blue,
      height: 280,
      child: ListView.builder(
          itemCount: sideBarI.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSideB = index;
                });
              },
              child: Container(
                color: Colors.black12,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(children: [
                  Container(
                    width: 5,
                    height: 30,
                    decoration: BoxDecoration(
                        color: index == selectedSideB
                            ? Colors.amberAccent
                            : Colors.black12,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Icon(
                    sideBarI[index][1],
                    color: index == selectedSideB ? Colors.white : Colors.grey,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    sideBarI[index][0],
                    style: TextStyle(
                      color:
                          index == selectedSideB ? Colors.white : Colors.grey,
                    ),
                  )
                ]),
              ),
            );
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool acValue = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Colors.amber,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: const EdgeInsets.only(top: 15, left: 15, right: 11),
            margin: EdgeInsets.only(right: 15),
            width: 220,
            // color: Colors.black12,
            color: const Color.fromARGB(255, 11, 12, 11),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(),
                      Column(
                        children: const [
                          Text("Leyia Foull"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My House 1",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const SideBarSelector(),
                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 19, right: 11),
                  child: Row(
                    children: const [
                      Icon(Icons.logout, color: Colors.grey),
                      SizedBox(width: 7),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: screenWidth - 275,
                // width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 230,
                          // color: Colors.amber,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 15, 16, 15),
                              // color
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: const [
                              Icon(Icons.search),
                              SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Search something here',
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 7),
                        const Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 7),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17))),
                            child: Row(children: const [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Add Device",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: screenWidth - 275,
                height: screenHeight - 90,
                // color: Colors.pinkAccent,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth - 525,
                      // color: Colors.brown,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RoomSelector(),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 340,
                                height: 320,
                                color: const Color.fromARGB(255, 11, 12, 11),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 17),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.amberAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: const Icon(
                                              Icons.lightbulb_outline_rounded,
                                              color: Colors.black),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Power Usage",
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Usage today",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                letterSpacing: 1.1,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 45),
                                        const Text(
                                          "32Kw",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.amberAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                    // SizedBox(
                                    //   // width: 330,
                                    //   height: 250,
                                    //   child: SplineAreaChart(
                                    //       chartName: "Power usage",
                                    //       primaryColor: Colors.amberAccent,
                                    //       secondaryColor: const Color.fromARGB(
                                    //           255, 14, 15, 14)),
                                    // )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 40),
                              Container(
                                width: 340,
                                height: 320,
                                color: const Color.fromARGB(255, 11, 12, 11),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 17),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.amberAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: const Icon(
                                              Icons.heat_pump_rounded,
                                              color: Colors.black),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Air Conditioner",
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Active for 9h",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                letterSpacing: 1.1,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 45),
                                        CupertinoSwitch(
                                          value: acValue,
                                          activeColor: Colors.amberAccent,
                                          thumbColor: const Color.fromARGB(
                                              255, 11, 12, 11),
                                          // trackColor: Colors.grey,
                                          onChanged: (value) {
                                            setState(() {
                                              acValue = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    const Text(
                                      "24°",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Temperature",
                                        style: TextStyle(color: Colors.grey)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 13),
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 30, 32, 30),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: const Text("Automatic"),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 13),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 30, 32, 30),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Text("Swing"))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          FirstRowDevices(),
                          SecondRowDevices(),
                          // here
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      // color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Power Consumption"),
                              Icon(Icons.arrow_outward_outlined)
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "290 KWh",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: const [
                                  Text("This Month"),
                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          Container(
                            height: 265,
                            // color: Colors.amberAccent,
                          ),
                          const SizedBox(height: 10),
                          const Text("Device Power Consumption"),
                          const SizedBox(height: 10),
                          DevicesList()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
