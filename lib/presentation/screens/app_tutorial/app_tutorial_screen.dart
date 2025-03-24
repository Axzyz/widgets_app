import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlidesInfo>[
  SlidesInfo(
    title: 'Busca la comida',
    caption: 'Dolor aliquip laboris amet ad aute aliqua reprehenderit.',
    imageUrl: 'assets/images/1.png',
  ),
  SlidesInfo(
    title: 'Entrega rápida',
    caption:
        'Id eiusmod mollit incididunt ad aliquip nisi qui sunt eiusmod eiusmod sit dolore ea est.',
    imageUrl: 'assets/images/2.png',
  ),
  SlidesInfo(
    title: 'Disfruta la comida',
    caption:
        'In sit aliquip non mollit aliquip laboris magna qui sunt et adipisicing ullamco.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),
          Positioned(
            right: 20.0,
            top: 50.0,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),

          endReached
              ? Positioned(
                bottom: 40.0,
                right: 30.0,
                child: FadeInRight(
                  from: 15.0,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Comenzar'),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20.0),
            Text(title, style: titleStyle),
            const SizedBox(height: 20.0),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
