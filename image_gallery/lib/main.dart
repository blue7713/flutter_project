import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
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

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController(
    viewportFraction: 0.8,
  );
  int _currentPage = 0;

  @override // 처음 실행시 가장 먼저 한 번만 실행
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
       _currentPage = _controller.page!.round();
      });
    });
  }

  @override // 리소스 관리를 위해 필요
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'inspirational Moments',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
            ]),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer,
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
        ),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                _buildPage(
                    imageUrl: 'assets/images/dog.jpg',
                    userName: 'Dave Lee',
                    avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
                ),
                _buildPage(
                  imageUrl: 'assets/images/path.jpg',
                  userName: 'Jane Smith',
                  avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
                ),
                _buildPage(
                  imageUrl: 'assets/images/tree.jpg',
                  userName: 'Alex Johnson',
                  avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
                ),
              ],
            ),
            Positioned(
              bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    List.generate(3, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primaryContainer,
                        ),
                      );
                    }),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String imageUrl,
    required String userName,
    required String avatarUrl,
  }) {
    return Stack(
      children: [
        Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
        ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}




