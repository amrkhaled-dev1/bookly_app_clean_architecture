import 'package:flutter/material.dart';

class CustomTopSnackBar {
  CustomTopSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    required String title,
    required IconData icon,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);

    late final OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return _TopSnackBarOverlay(
          message: message,
          title: title,
          icon: icon,
          backgroundColor: backgroundColor,
          duration: duration,
          onRemove: () {
            if (overlayEntry.mounted) {
              overlayEntry.remove();
            }
          },
        );
      },
    );

    overlay.insert(overlayEntry);
  }
}

class _TopSnackBarOverlay extends StatefulWidget {
  const _TopSnackBarOverlay({
    required this.message,
    required this.onRemove,
    required this.duration,
    required this.icon,
    required this.backgroundColor,
    this.title,
  });

  final String message;
  final String? title;
  final VoidCallback onRemove;
  final Duration duration;
  final IconData icon;
  final Color backgroundColor;

  @override
  State<_TopSnackBarOverlay> createState() => _TopSnackBarOverlayState();
}

class _TopSnackBarOverlayState extends State<_TopSnackBarOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _hideAfterDuration();
  }

  Future<void> _hideAfterDuration() async {
    await Future.delayed(widget.duration);

    if (!mounted) return;

    await _controller.reverse();

    if (!mounted) return;

    widget.onRemove();
  }

  Future<void> _close() async {
    await _controller.reverse();

    if (!mounted) return;

    widget.onRemove();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Positioned(
      top: topPadding + 12,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(0, 6),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(widget.icon, color: Colors.white, size: 28),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.title != null)
                        Text(
                          widget.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: _close,
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
