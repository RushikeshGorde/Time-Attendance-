import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_atten/Screen/DashboardScreen/dashboardscreen.dart';
import 'package:time_atten/Screen/Main_Designation_Screen/main_designation_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ResponsiveScaffold(child: child); // Pass child correctly
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>  MainDesignationScreen(),
        ),
        GoRoute(
          path: '/designation',
          builder: (context, state) => DashboardScreen(), // Ensure correct screen is used
        ),
      ],
    ),
  ],
);

// Responsive Scaffold with conditional navigation
class ResponsiveScaffold extends StatelessWidget {
  final Widget child;

  const ResponsiveScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Attendance'),
        actions: MediaQuery.of(context).size.width >= 600
            ? _buildHorizontalNavBar(context)
            : null,
      ),
      drawer: MediaQuery.of(context).size.width < 600 ? _buildDrawer(context) : null,
      body: child,
    );
  }

  // Drawer for mobile view
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              'Time Attendance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(context, '/', 'Home', Icons.home),
          _buildDrawerItem(context, '/designation', 'Designation', Icons.badge),
          _buildDrawerItem(context, '/location', 'Location', Icons.location_on),
          _buildDrawerItem(context, '/department', 'Department', Icons.business),
          _buildDrawerItem(context, '/company', 'Company', Icons.corporate_fare),
          _buildDrawerItem(context, '/holiday', 'Holiday', Icons.calendar_month),
          _buildDrawerItem(context, '/login', 'Login', Icons.login),
        ],
      ),
    );
  }

  // Drawer item with navigation
  Widget _buildDrawerItem(BuildContext context, String path, String label, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: GoRouter.of(context).location == path,
      onTap: () {
        // Close the drawer
        Navigator.pop(context);
        // Navigate to the selected route
        context.go(path);
      },
    );
  }

  // Horizontal NavBar for tablet and desktop
  List<Widget> _buildHorizontalNavBar(BuildContext context) {
    return [
      _buildNavItem(context, '/', 'Home'),
      _buildNavItem(context, '/designation', 'Designation'),
      _buildNavItem(context, '/location', 'Location'),
      _buildNavItem(context, '/department', 'Department'),
      _buildNavItem(context, '/company', 'Company'),
      _buildNavItem(context, '/holiday', 'Holiday'),
      _buildNavItem(context, '/login', 'Login'),
    ];
  }

  // Navigation item for horizontal navbar
  Widget _buildNavItem(BuildContext context, String path, String label) {
    return TextButton(
      onPressed: () => context.go(path),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: GoRouter.of(context).location == path
              ? Colors.deepPurple
              : Colors.black,
        ),
      ),
    );
  }
}
