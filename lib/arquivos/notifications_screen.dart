import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final Color primaryDarkGreen = const Color(0xFF2E7D32);
  final Color primaryLightGreen = const Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                color: primaryDarkGreen,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10),
                      child: Text(
                        "Notificações",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(), // Empurra a TabBar para baixo

                    // TabBar
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: 4),
                      indicator: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: primaryLightGreen,
                      ),
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.7),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),

                      tabs: const [
                        Tab(text: "Não lidas"),
                        Tab(text: "Lidas"),
                      ],
                    ),
                  ],
                ),
              ),

              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    // 1. Não lidas
                    _NotificationListView(
                      isRead: false,
                      primaryColor: primaryDarkGreen,
                    ),

                    // 2. Lidas
                    _NotificationListView(
                      isRead: true,
                      primaryColor: primaryDarkGreen,
                    ),
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

// --- Widget para a Lista de Notificações ---

class _NotificationListView extends StatelessWidget {
  final bool isRead;
  final Color primaryColor;

  const _NotificationListView({required this.isRead, required this.primaryColor});


  final List<String> notifications = const [
    "hoje é terça",
    "Amãnha é quarta",
    "pão com manteiga",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _NotificationItem(
          message: notifications[index],
          isRead: isRead,
          primaryColor: primaryColor,
        );
      },
    );
  }
}

// --- Widget para um Item de Notificação ---

class _NotificationItem extends StatelessWidget {
  final String message;
  final bool isRead;
  final Color primaryColor;

  const _NotificationItem({
    required this.message,
    required this.isRead,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // Sombra suave para dar destaque (igual ao design)
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],

        border: !isRead
            ? Border(left: BorderSide(color: primaryColor, width: 4))
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ícone
          Icon(
            Icons.description,
            color: isRead ? Colors.grey : primaryColor, // Cor do ícone
          ),
          const SizedBox(width: 12),
          // Texto da notificação
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 15,
                color: isRead ? Colors.grey.shade600 : Colors.black87,

                fontWeight: isRead ? FontWeight.normal : FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}