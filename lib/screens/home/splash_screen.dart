import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import 'package:my_portfolio/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double progressValue = 0.0;
  double opacity = 0.0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
    _updateProgress();
    _fadeInContent();
  }

  void _fadeInContent() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          opacity = 1.0;
        });
      }
    });
  }

  void _updateProgress() {
    Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      if (mounted) {
        setState(() {
          if (progressValue < 1) {
            progressValue += 0.01;
          } else {
            timer.cancel();
            _goToNextPage();
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _goToNextPage() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionDuration: const Duration(milliseconds: 800),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bgColor,
              darkColor,
              bgColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withValues(alpha: 0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          Assets.icons.coffeeCup.path,
                          height: 80,
                          width: 80,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    Text(
                      "Muktar Zakari Junior",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: primaryColor.withValues(alpha: 0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Flutter Full-Stack Developer",
                      style: TextStyle(
                        color: bodyTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withValues(alpha: 0.3),
                        primaryColor.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: darkColor,
                      color: primaryColor,
                      minHeight: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 1200),
                child: Text(
                  "${(progressValue * 100).toInt()}%",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
