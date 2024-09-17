import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Toko Billiard Aduhaii'),
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
  int _selectedIndex = 1; // Start at 'Home' tab by default
  int _counter = 0;

  // Function to handle tap on the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Functions to navigate to each specific page
  void _navigateToMejaPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MejaPage()),
    );
  }

  void _navigateToStikPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StikPage()),
    );
  }

  void _navigateToAksesorisPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AksesorisPage()),
    );
  }

  void _navigateToProfileDetail(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileDetailPage(name: name)),
    );
  }

  // Function to return different widgets based on selected tab
  Widget _buildContent() {
    if (_selectedIndex == 0) {
      // Kategori tab selected, show list on the top right
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap:
                true, // Ensures the list doesn't take full screen height
            children: [
              ListTile(
                title: const Text('Meja', style: TextStyle(fontSize: 24)),
                onTap: () =>
                    _navigateToMejaPage(context), // Navigate to Meja page
              ),
              ListTile(
                title: const Text('Stik', style: TextStyle(fontSize: 24)),
                onTap: () =>
                    _navigateToStikPage(context), // Navigate to Stik page
              ),
              ListTile(
                title: const Text('Aksesoris', style: TextStyle(fontSize: 24)),
                onTap: () => _navigateToAksesorisPage(
                    context), // Navigate to Aksesoris page
              ),
            ],
          ),
        ),
      );
    } else if (_selectedIndex == 1) {
      // Home tab selected
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      );
    } else if (_selectedIndex == 2) {
      // Profile tab selected
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('Muhammad Khairrudin',
                    style: TextStyle(fontSize: 24)),
                onTap: () =>
                    _navigateToProfileDetail(context, 'Muhammad Khairrudin'),
              ),
              ListTile(
                title:
                    const Text('Fahturrahman', style: TextStyle(fontSize: 24)),
                onTap: () => _navigateToProfileDetail(context, 'Fahturrahman'),
              ),
            ],
          ),
        ),
      );
    } else {
      // Shop tab selected
      return const Center(
        child: Text('Welcome to the Shop!', style: TextStyle(fontSize: 24)),
      );
    }
  }

  // Function to increment counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

// New MejaPage class to show Meja content
class MejaPage extends StatelessWidget {
  const MejaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meja'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Meja', style: TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey[300],
              width: 300,
              height: 200,
              child: const Center(
                child: Text('Gambar meja akan muncul di sini',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New StikPage class to show Stik content
class StikPage extends StatelessWidget {
  const StikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stik'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Stik', style: TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey[300],
              width: 300,
              height: 200,
              child: const Center(
                child: Text('Gambar stik akan muncul di sini',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New AksesorisPage class to show Aksesoris content
class AksesorisPage extends StatelessWidget {
  const AksesorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aksesoris'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Aksesoris', style: TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey[300],
              width: 300,
              height: 200,
              child: const Center(
                child: Text('Gambar aksesoris akan muncul di sini',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ProfileDetailPage class to show profile details
class ProfileDetailPage extends StatelessWidget {
  final String name;

  const ProfileDetailPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    String nim = '';
    String ttl = '';
    String imageUrl = '';

    // Assigning values based on the selected profile
    if (name == 'Muhammad Khairrudin') {
      nim = '2209106128';
      ttl = 'Samarinda, 02, 12, 2004';
      imageUrl = 'https://i.imgur.com/QblsvLg.jpeg'; // Use direct image URL
    } else if (name == 'Fahturrahman') {
      nim = '2209106129';
      ttl = 'Samarinda, 05, 08, 2004';
      imageUrl = 'https://i.imgur.com/9ytjiKE.jpeg'; // Use direct image URL
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying the profile picture in a circular shape
            ClipOval(
              child: Image.network(
                imageUrl,
                width: 100.0, // Width of the circular image
                height: 100.0, // Height of the circular image
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Text('NIM: $nim', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('TTL: $ttl', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
