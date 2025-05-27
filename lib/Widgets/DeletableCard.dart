import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/weatherWidgets/weatherWidgetsBarrel.dart';

import 'dart:math';

class DeletableCard extends StatefulWidget {
  final double height;
  final VoidCallback onDelete;
  final Widget? child;
  final bool isDimmed;
  final bool isSelected;
  final VoidCallback? onTap;

  const DeletableCard({
    super.key,
    required this.onDelete,
    this.child,
    this.height = 200,
    this.isDimmed = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  State<DeletableCard> createState() => _DeletableCardState();
}

class _DeletableCardState extends State<DeletableCard>
    with SingleTickerProviderStateMixin {
  bool _showDelete = false;
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
      if (mounted) setState(() {});
    });

    _shakeAnimation = Tween<double>(begin: 0, end: 8 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.stop();
  }

  void _toggleDeleteMode() {
    setState(() {
      _showDelete = !_showDelete;
      if (_showDelete) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _shakeOffset => sin(_shakeAnimation.value) * 1;

  @override
  Widget build(BuildContext context) {
    final isRestoreMode = widget.onTap != null;

    return GestureDetector(
      onDoubleTap: isRestoreMode ? widget.onTap : _toggleDeleteMode,
      onTap: isRestoreMode ? widget.onTap : null,
      child: Transform.translate(
        offset: _showDelete ? Offset(_shakeOffset, 0) : Offset.zero,
        child: Stack(
          children: [
            Opacity(
              opacity: widget.isDimmed && !widget.isSelected ? 0.4 : 1.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: widget.height,
                  child: Center(child: widget.child),
                ),
              ),
            ),
            if (_showDelete && !isRestoreMode)
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: widget.onDelete,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
