import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14, left: 16, right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), // Rounded edges
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: Color(0xFF1C212A), // Semi-transparent
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            // Ensures transparency
            elevation: 0,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(size: 30),
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
