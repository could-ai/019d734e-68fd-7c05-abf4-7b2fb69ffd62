import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SlideScreen(),
      },
    );
  }
}

class SlideScreen extends StatelessWidget {
  const SlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using LayoutBuilder to make it responsive (stack vertically on small screens)
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;

            if (isMobile) {
              // Mobile layout: Stack vertically
              return SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _RightIconSection(),
                    const SizedBox(height: 40),
                    const _LeftTextSection(),
                  ],
                ),
              );
            }

            // Slide/Desktop layout: Side-by-side
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // LEFT: Text Content
                  const Expanded(
                    flex: 3,
                    child: _LeftTextSection(),
                  ),
                  const SizedBox(width: 64),
                  // RIGHT: Icon Content
                  const Expanded(
                    flex: 2,
                    child: _RightIconSection(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LeftTextSection extends StatelessWidget {
  const _LeftTextSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // LEFT (big)
        Text(
          '👉 90% of Singapore undergraduates report high stress levels',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.2,
              ),
        ),
        const SizedBox(height: 24),
        // LEFT (small)
        Text(
          'Balancing studies, part-time work, and career preparation',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black54,
                height: 1.4,
              ),
        ),
      ],
    );
  }
}

class _RightIconSection extends StatelessWidget {
  const _RightIconSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Brain icon representing the student/mind
          Icon(
            Icons.psychology,
            size: 160,
            color: Colors.orange.shade400,
          ),
          // Clock icon representing time pressure/balancing
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.schedule,
                size: 64,
                color: Colors.red.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
