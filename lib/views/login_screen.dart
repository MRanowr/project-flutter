import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/providers/auth_provider.dart';
import '../controllers/providers/language_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isAr = languageProvider.locale.languageCode == 'ar';
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Colors.black87,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الشعار العلوى
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(color: Colors.amber.shade400, width: 2),
                  ),
                  child: const Icon(
                    Icons.storefront_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isAr ? 'مرحباً بك' : 'Welcome Back',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isAr ? 'سجل الدخول للمتابعة في المتجر' : 'Sign in to continue shopping',
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13),
                ),
                const SizedBox(height: 32),

                // كارت التسجيل مع تحديد ألوان النصوص والأيقونات
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth > 600 ? 400 : screenWidth * 0.85,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // حقل اسم المستخدم
                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87, // لون النص المدخل أسود واضح
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              labelText: isAr ? 'اسم المستخدم / البريد' : 'Email / Username',
                              labelStyle: const TextStyle(fontSize: 13, color: Colors.black54),
                              floatingLabelStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                              prefixIcon: const Icon(Icons.person_outline, size: 20, color: Colors.black54),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.black87, width: 2),
                              ),
                            ),
                            validator: (val) => val == null || val.isEmpty
                                ? (isAr ? 'يرجى إدخال اسم المستخدم' : 'Enter username')
                                : null,
                          ),
                          const SizedBox(height: 16),

                          // حقل كلمة المرور
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87, // لون النص المدخل أسود واضح
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              labelText: isAr ? 'كلمة المرور' : 'Password',
                              labelStyle: const TextStyle(fontSize: 13, color: Colors.black54),
                              floatingLabelStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                              prefixIcon: const Icon(Icons.lock_outline, size: 20, color: Colors.black54),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.black87, width: 2),
                              ),
                            ),
                            validator: (val) => val == null || val.isEmpty
                                ? (isAr ? 'يرجى إدخال كلمة المرور' : 'Enter password')
                                : null,
                          ),
                          const SizedBox(height: 24),

                          // زر تسجيل الدخول
                          Consumer<AuthProvider>(
                            builder: (context, auth, child) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.black87,
                                ),
                                onPressed: auth.isLoading
                                    ? null
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          bool success = await auth.login(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                          if (success && context.mounted) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => const HomeScreen(),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                child: auth.isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                      )
                                    : Text(
                                        isAr ? 'تسجيل الدخول' : 'Sign In',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}