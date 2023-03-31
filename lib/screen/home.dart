import 'package:asbeza_1/bloc/home_bloc/home_bloc.dart';
import 'package:asbeza_1/screen/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc/home_event.dart';
import '../bloc/home_bloc/home_state.dart';
import '../model/food.dart';
import 'history.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Asbeza",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const History()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      drawer: Drawer(
        // backgroundColor: Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent.shade100],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.5, 0.9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            minRadius: 60.0,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1614027164847-1b28cfe1df60?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Yeabsera Seyoum',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const History()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
            ),
          ],
        ),
      ),

      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FoodInitiate) {
            BlocProvider.of<HomeBloc>(context).add(GetPressed());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FoodSuccess) {
            return Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text("Recent Entry"),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 17),
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          final category = state.food[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 70,
                                  height: 65,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(category.image),
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Text('')),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 15),
                              //   child: Text(
                              //     category.title,
                              //     style: const TextStyle(fontSize: 15),
                              //   ),
                              // )
                            ],
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Tab(
                      icon: Icon(Icons.food_bank),
                      text: "All",
                    ),
                    Tab(
                      icon: Icon(Icons.food_bank),
                      text: "All",
                    ),
                    Tab(
                      icon: Icon(Icons.food_bank),
                      text: "All",
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: state.food.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) =>
                          ItemCard(category: state.food[index]),
                    ),
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item category;
  const ItemCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(category.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              category.title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "\$${category.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context)
                    .add(HistoryEvent(foods: category));
              },
              icon: const Icon(Icons.shopping_basket))
        ],
      ),
    );
  }
}
