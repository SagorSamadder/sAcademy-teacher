// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth_screen/login_page.dart';

class buildHomeSection extends StatefulWidget {
  const buildHomeSection({super.key});

  @override
  State<buildHomeSection> createState() => _buildHomeSectionState();
}

class _buildHomeSectionState extends State<buildHomeSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //let's add the navigation menu for this project
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      //let's trigger the navigation expansion
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    radius: 26.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Now let's start with the dashboard main rapports
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.article,
                                  size: 26.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Questions",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "350 Questions",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.comment,
                                  size: 26.0,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Users",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "2k+ users",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Subscribers",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "200 Subscribers",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.monetization_on_outlined,
                                  size: 26.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Revenue",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "800.300 \$",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Now let's set the article section
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        "200 Questions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "5 new Questions",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 300.0,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type Question Subject",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),

              //let's set the filter section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple.shade400,
                    ),
                    label: Text(
                      "2023, November 10, November 11, November 12",
                      style: TextStyle(
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      DropdownButton(
                          hint: const Text("Filter by"),
                          items: const [
                            DropdownMenuItem(
                              value: "Date",
                              child: Text("Date"),
                            ),
                            DropdownMenuItem(
                              value: "Question",
                              child: Text("Question"),
                            ),
                            DropdownMenuItem(
                              value: "Latest",
                              child: Text("Latest"),
                            ),
                          ],
                          onChanged: (value) {}),
                      const SizedBox(
                        width: 20.0,
                      ),
                      DropdownButton(
                          hint: const Text("Order by"),
                          items: const [
                            DropdownMenuItem(
                              value: "Date",
                              child: Text("Date"),
                            ),
                            DropdownMenuItem(
                              value: "Time",
                              child: Text("Time"),
                            ),
                            DropdownMenuItem(
                              value: "alphabetical",
                              child: Text("alphabetical"),
                            ),
                          ],
                          onChanged: (value) {}),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              //Now let's add the Table
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                      headingRowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.shade200),
                      columns: const [
                        DataColumn(label: Text("ID")),
                        DataColumn(label: Text("Question Title")),
                        DataColumn(label: Text("Creation Date")),
                        DataColumn(label: Text("Total Exam")),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text("0")),
                          const DataCell(Text("Capital of Bangladesh")),
                          DataCell(Text("${DateTime.now()}")),
                          const DataCell(Text("20")),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("1")),
                          const DataCell(
                              Text("What is the currency Name of BD")),
                          DataCell(Text("${DateTime.now()}")),
                          const DataCell(Text("16")),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("2")),
                          const DataCell(Text("How many Country in asia")),
                          DataCell(Text("${DateTime.now()}")),
                          const DataCell(Text("11")),
                        ]),
                      ]),
                  //Now let's set the pagination
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "1",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "2",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "3",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF134668)),
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Get.offAll(() => const LoginPage());
                              },
                              child: "Log Out".text.white.make()))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
