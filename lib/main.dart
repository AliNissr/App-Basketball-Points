import 'package:basketballpoints/cubit/counter_cubit.dart';
import 'package:basketballpoints/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BasketBall_Points());
}

class BasketBall_Points extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /*
    * من خلال ال (BlocProvider) استطيع خلق او انشاء cubit راح توفره الي حتى استخدمة في ال Homepage .
    * لان استطيع الوصول في الهوم بيج الى كل ماا يحتويه ال CounterCubit*/
    return BlocProvider(create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int teamAA = 0;

  int teamBB = 0;

  @override
  Widget build(BuildContext context) {
    // ال BlocCounter راح يتعامل مع ال الكيوبت لي طيته اله وهوه CounterCubit ورح يصغي اي يسمع اللى ال CounterState (ملاحضة مهمه جدا)
    return BlocConsumer<CounterCubit , CounterState>(
      /*
      *الفرق بين (builder and listener )
      * ال listener عندما لا يكون التغير في ال (UI) استخدم ال listener
      * اما اذا كان التغير في كل الويجد اي ان ال Ui سوف يتغير استخدم ال builder*/
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            "Points Counter",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), //منحني الاطراف (ِAppBar) جعل شكل ال
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Team A",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${BlocProvider.of<CounterCubit>(context).teamApoint}",
                        style:
                        const TextStyle(fontSize: 140, color: Colors.black),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            // fixedSize: Size(width, height) // هذا تجعل حجم البتن ثابت
                            //maximumSize: Size(140, 50) , //هذا معنا الحجم اكبر شي القيم لي تخليه بيه
                            minimumSize: const Size(100,
                                50), //هذا معنا الحجم اقل شي القيم لي تخليه بيه
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).teamIncrement('A', 1);
                          },
                          child: const Text("Add 1 Point",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(100, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).teamIncrement('A', 2);
                          },
                          child: const Text("Add 2 Point",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(100, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).teamIncrement('A', 3);
                          },
                          child: const Text("Add 3 Point",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ],
                  ),
                ),
                Container(
                    height: 500,
                    child: const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                      width: 2,
                      endIndent: 40,
                      indent: 40,
                    )),
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Team B",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${BlocProvider.of<CounterCubit>(context).teamBpoint}",
                        style:
                        const TextStyle(fontSize: 140, color: Colors.black),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(100, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).teamIncrement('B', 1);
                          },
                          child: const Text("Add 1 Point",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(100, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).teamIncrement('B', 2);
                          },
                          child: const Text("Add 2 Point",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(100, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).teamIncrement('B', 3);
                          },
                          child: const Text("Add 3 Point",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(100, 50),
                ),
                onPressed: () {
                  setState(() {
                    zeroandnum(context);
                  });
                },
                child: const Text("Reset",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)))
          ],
        ),
      ),
      listener: ( context,  state) {
        if (state is CounterAIncrementState){
          teamAA = BlocProvider.of<CounterCubit>(context).teamApoint;
        }else {
          teamBB = BlocProvider.of<CounterCubit>(context).teamBpoint;
        }
      },
    );
  }

  void zeroandnum(BuildContext context) {
     BlocProvider.of<CounterCubit>(context).teamApoint = 0;
    BlocProvider.of<CounterCubit>(context).teamBpoint = 0;
  }
}
