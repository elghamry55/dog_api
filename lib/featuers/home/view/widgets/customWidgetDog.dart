import 'package:flutter/material.dart';

class DogImageView extends StatelessWidget {
  final String imageUrl;
  const DogImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: const Text('Failed to load image'),
            );
          },
        ),
      ),
    );
  }
}
