import 'package:citelis/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final growableList =
        List<int>.generate(3, (int index) => index * index, growable: true);
    // print(growableList);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => Get.find<AuthController>().signOut(),
                icon: const Icon(Icons.logout),
              )
            ],
            bottom: const TabBar(
              indicatorColor: Color.fromARGB(255, 12, 14, 134),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              labelStyle: TextStyle(
                color: Colors.amber,
              ),
              tabs: [
                Tab(
                  text: "DASHBOARD",
                ),
                Tab(
                  text: "AGENDA",
                ),
              ],
            ),
            title: const Center(child: Text('APP LOGO')),
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    child: Card(
                      elevation: 10.0,
                      child: InkWell(
                        onTap: () => Get.toNamed('validar'),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Verificar indentidad",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 29, 65, 163),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text(
                                ">",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 29, 65, 163),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    child: Card(
                      elevation: 10.0,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Validacion indentidad",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 29, 65, 163),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    ">",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 29, 65, 163),
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "3",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 29, 65, 163),
                                      fontSize: 120.0,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "Pendientes",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 63, 138, 189),
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            growableList[index].toString(),
                          ),
                          subtitle: Text(
                            "No validado",
                            style: TextStyle(
                              background: Paint()
                                ..color = Colors.red
                                ..strokeWidth = 18
                                ..strokeJoin = StrokeJoin.round
                                ..strokeCap = StrokeCap.round
                                ..style = PaintingStyle.stroke,
                              color: Colors.white,
                            ),
                          ),
                          trailing: const Icon(Icons.phone),
                        );
                      },
                      itemCount: growableList.length,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
