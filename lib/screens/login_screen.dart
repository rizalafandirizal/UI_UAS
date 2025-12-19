import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header with image and diagonal curve
          ClipPath(
            clipper: DiagonalClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/kampus.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Logo in center of header
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.5 - 40,
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromARGB(255, 0, 8, 122),
              child: Image(
                image: AssetImage('lib/assets/LogoTel-U 1.png'),
                fit: BoxFit.contain,
                width: 60,
                height: 60,
              ),
            ),
          ),
          // Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 8, 122)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 8, 122)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 8, 122)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 8, 122)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 8, 122),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  ),
                  child: const Text('Log In'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Color.fromARGB(255, 0, 8, 122)),
                  ),
                ),
              ],
            ),
          ),
          // Footer wave
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 0, 8, 122),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}