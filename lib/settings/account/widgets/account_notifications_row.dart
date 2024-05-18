import 'package:flutter/material.dart';
import 'package:sala_negra/settings/account/widgets/notifications_switch.dart';
import 'package:sala_negra/utilities/app_fonts.dart';

class AccountNotificationsRow extends StatelessWidget{
  
  const AccountNotificationsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: const Row(
        children: [
          Expanded(
              child: Text(
                'Notificaciones',
                style: AppFonts.largeFont,
              ),
            ),
          NotificationsSwitch()
        ],
      ),
    );
  }

}