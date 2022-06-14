import 'package:flutter/material.dart';

class TaskColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const TaskColumn({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
      padding: const EdgeInsets.only(right: 30.0, left: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0.0, 4.0), blurRadius: 2.0)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // const SizedBox(height: 20.0),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: null,
                child: const Icon(
                  Icons.edit,
                  size: 25.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 15.0),
              GestureDetector(
                onTap: null,
                child: const Icon(
                  Icons.delete,
                  size: 25.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
