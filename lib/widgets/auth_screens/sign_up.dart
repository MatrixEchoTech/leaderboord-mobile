import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/images/auth-bg.png'), // make sure path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Heading
              Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Subheading with link
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'If you don’t have an account register You can ',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  
                  ),
                  children: [
                    TextSpan(
                      text: 'Register here',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white, // link color
                        fontWeight: FontWeight.w600
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to the SignUp screen
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                        },
                    ),
                    TextSpan(text: '!'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
