import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onNotificationPressed,
    required this.notificationNumber,
    required this.title,
    this.title2,
    required this.notifyIcon,
  });

  final VoidCallback onNotificationPressed;
  final int notificationNumber;
  final String title;
  final String? title2;
  final IconData notifyIcon;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);

    return AppBar(
      backgroundColor:
          theme.hiveColorsExtensions.primary,
      centerTitle: false,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu_sharp,
            color: theme.hiveColorsExtensions.onBackground,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.title,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.hiveColorsExtensions.onBackground, // Set HIVE text color to black
              ),
            ),
            TextSpan(
              text: widget.title2,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: Colors.red, // Set BLOG text color to red
              ),
            ),
          ],
        ),
      ),
      // actions: <Widget>[
      //   Padding(
      //     padding: padding.symmetric(
      //       horizontal: Dimensions.small,
      //     ),
      //     child: NotificationIcon(
      //       notifyIcon: widget.notifyIcon,
      //       onNotificationPressed: widget.onNotificationPressed,
      //       notificationNumber: widget.notificationNumber,
      //     ),
      //   ),
      // ],
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.onNotificationPressed,
    required this.notificationNumber,
    required this.notifyIcon,
  });

  final VoidCallback onNotificationPressed;
  final int notificationNumber;
  final IconData notifyIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);

    return Stack(
      children: [
        IconButton(
          icon: Icon(
            notifyIcon,
            color: theme.hiveColorsExtensions.background,
          ),
          onPressed: onNotificationPressed,
        ),
        notificationNumber > 0
            ? _notificationBadge(padding, theme)
            : const SizedBox.shrink(),
      ],
    );
  }

  Positioned _notificationBadge(EdgeInsetsOf padding, ThemeData theme) {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: padding.all(DimensionToken.smallest).copyWith(
              left: 1,
              top: 1,
              bottom: 1,
              right: 1,
            ),
        decoration: BoxDecoration(
          color: theme.colorScheme.error,
          borderRadius: BorderRadius.circular(kRoundRadius),
        ),
        constraints: const BoxConstraints(
          minWidth: 14,
          minHeight: 14,
        ),
        child: Text(
          '$notificationNumber',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.background,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
