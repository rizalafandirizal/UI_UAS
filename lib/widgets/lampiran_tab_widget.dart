import 'package:flutter/material.dart';

class LampiranItem {
  final String title;
  final IconData icon;
  final bool isCompleted;

  LampiranItem({
    required this.title,
    required this.icon,
    required this.isCompleted,
  });
}

class LampiranTabWidget extends StatefulWidget {
  const LampiranTabWidget({Key? key, required this.lampiran}) : super(key: key);

  final List<LampiranItem> lampiran;

  @override
  _LampiranTabWidgetState createState() => _LampiranTabWidgetState();
}

class _LampiranTabWidgetState extends State<LampiranTabWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool allCompleted = widget.lampiran.every((item) => item.isCompleted);
    if (allCompleted) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.lampiran.length,
          itemBuilder: (context, index) {
            final item = widget.lampiran[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    size: 24,
                    color: Colors.blue.shade600,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: item.isCompleted ? Colors.green : Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            );
          },
        ),
        if (allCompleted)
          SlideTransition(
            position: _animationController.drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.celebration,
                    color: Colors.green,
                    size: 24,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Selamat! Semua lampiran telah selesai.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}