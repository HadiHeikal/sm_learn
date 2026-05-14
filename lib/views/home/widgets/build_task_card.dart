import 'package:counter_app/views/task/add_task_view.dart';
import 'package:flutter/material.dart';
class BuildTaskCard extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final Function()? onTap;
  final Function()? onRemoveTap;
  final Function()? onEditTap;
  const BuildTaskCard({super.key, required this.title, required this.isCompleted, this.onRemoveTap, this.onTap, this.onEditTap});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF233031),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF47B29A).withValues(alpha: 0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF47B29A).withValues(alpha: 0.15),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            children: [
              Icon(
                isCompleted ? Icons.check_circle : Icons.circle_outlined,
                color: const Color(0xFF47B29A),
                size: 28,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? Colors.white54 : Colors.white,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: const Color(0xFF47B29A),
                        decorationThickness: 2.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isCompleted ? " Completed" : "Pending",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF47B29A),
                      ),
                    ),
                  ],
                ),
              ),
              Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF47B29A)),
                  color: const Color(0xFF334040),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(
                      value: 'Edit',
                      onTap: onEditTap,
                      child: Row(
                        children: const [
                          Icon(Icons.edit, color: Colors.teal, size: 20),
                          SizedBox(width: 12),
                          Text('Edit', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),

                    PopupMenuItem(
                      value: 'delete',
                      onTap: onRemoveTap,
                      child: Row(
                        children: const [
                          Icon(Icons.delete, color: Colors.redAccent, size: 20),
                          SizedBox(width: 12),
                          Text('Delete', style: TextStyle(color: Colors.white)),
                        ],
                      ),
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
