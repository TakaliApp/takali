import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PotentialMatchCardWidget extends StatefulWidget {
  final String name;
  final int age;
  final String location;
  final List<String> photoUrls;
  final String desiredRelation;
  final Function()? onLike;
  final Function()? onDislike;

  const PotentialMatchCardWidget({
    super.key,
    required this.name,
    required this.age,
    required this.location,
    required this.photoUrls,
    required this.desiredRelation,
    this.onLike,
    this.onDislike,
  });

  @override
  State<PotentialMatchCardWidget> createState() => _PotentialMatchCardWidgetState();
}

class _PotentialMatchCardWidgetState extends State<PotentialMatchCardWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Images avec PageView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: PageView.builder(
                itemCount: widget.photoUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: widget.photoUrls[index],
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 40,
                    ),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            // Indicateurs de progression (barres)
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.photoUrls.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),

            // Dégradé noir en bas
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Informations utilisateur
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${widget.name}, ",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${widget.age}",
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.location,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Boutons d'action
            Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: widget.onDislike,
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FloatingActionButton(
                    onPressed: widget.onLike,
                    backgroundColor: Color(0xFFEC4899), // Rose de notre design
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ], 
        ),
      ),
    );
  }
}