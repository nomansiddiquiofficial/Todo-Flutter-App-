import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskText;
  final bool complete;
  final Function(bool?)? onChanged;
  final VoidCallback? deleteButton;

  TodoTile({
    Key? key,
    required this.taskText,
    required this.complete,
    required this.onChanged,
    required this.deleteButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext) => deleteButton?.call(),
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 70,
          width: 330,
          decoration: BoxDecoration(
            color: Color(0xFF778da9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: complete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // Text (with Expanded)
              Expanded(
                child: complete
                    ? Text(
                        taskText,
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      )
                    : Text(
                        taskText,
                        style: TextStyle(decoration: TextDecoration.none),
                      ),
              ),
              // SizedBox
              SizedBox(width: 16),
              // Delete Button
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: deleteButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
