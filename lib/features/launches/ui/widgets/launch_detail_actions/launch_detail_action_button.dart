part of 'launch_detail_actions.dart';

class LaunchDetailActionButton extends StatelessWidget {
  LaunchDetailActionButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final Icon icon;
  final Function onTap;

  final Color _foregroundColor = Colors.black87;
  final Color _backgroundColor = Colors.orange;
  final double _radius = 25;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => onTap(),
    child: CircleAvatar(
      backgroundColor: _backgroundColor,
      foregroundColor: _foregroundColor,
      radius: _radius,
      child: icon,
    ),
  );
}