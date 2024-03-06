import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'Music Info App',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(text: 'Artists',),
            Tab(text: 'Albums',),
            Tab(text: 'Songs',),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TabBarView(
          controller: _controller,
          children: [
            TabContent(
              title: 'Artist',
              items: [
                ContentItem(
                  name: 'Coldplay1',
                  icon: Icons.group,
                  description: 'Coldplay is a British rock band that was formed in London in 1996.'
                ),
                ContentItem(
                    name: 'Coldplay1',
                    icon: Icons.group,
                    description: 'Coldplay is a British rock band that was formed in London in 1996.'
                ),
              ],
            ),
            TabContent(
              title: 'Album',
              items: [
                ContentItem(
                    name: 'Parachutes',
                    icon: Icons.album,
                    description: 'Parachutes is the debut studio album by British rock band ColdPlay'
                ),
                ContentItem(
                    name: 'Parachutes',
                    icon: Icons.album,
                    description: 'Parachutes is the debut studio album by British rock band ColdPlay'
                ),
              ],
            ),
            TabContent(
              title: 'Song',
              items: [
                ContentItem(
                    name: 'Parachutes',
                    icon: Icons.music_note,
                    description: 'Yellow is a song by British rock band ColdPlay'
                ),
                ContentItem(
                    name: 'Parachutes',
                    icon: Icons.music_note,
                    description: 'Yellow is a song by British rock band ColdPlay'
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String title;
  final List<ContentItem> items;
  const TabContent({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                leading: Icon(
                  items[index].icon,
                  size: 25,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  items[index].name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      items[index].icon,
                                      size: 30,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      items[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  items[index].description,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          );
        },);
  }
}

class ContentItem {
  final String name;
  final IconData icon;
  final String description;

  ContentItem({required this.name, required this.icon, required this.description});
}