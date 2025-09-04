import 'package:flutter/material.dart';
import '../../models/dog_data.dart';
import '../../models/dog_model.dart';
import '../widgets/customWidgetDog.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({super.key});

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  DogModel? _dog;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadNew();
  }

  Future<void> _loadNew() async {
    setState(() => _loading = true);
    try {
      final dog = await getData();
      setState(() => _dog = dog);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _dog?.image;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Random Dog 🐶'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: _loading && imageUrl == null
                      ? const CircularProgressIndicator()
                      : imageUrl == null
                      ? const Text('Tap the button to load a dog 🐾')
                      : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: DogImageView(
                      key: ValueKey(imageUrl),
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _loading ? null : _loadNew,
                  icon: const Icon(Icons.refresh, size: 20),
                  label: Text(
                    _loading ? 'Loading...' : 'Show another dog',
                    style: const TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
