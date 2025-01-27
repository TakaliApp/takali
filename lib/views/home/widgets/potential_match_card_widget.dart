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
  State<PotentialMatchCardWidget> createState() =>
      _PotentialMatchCardWidgetState();
}

class _PotentialMatchCardWidgetState extends State<PotentialMatchCardWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.photoUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: widget.photoUrls[index],
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, size: 40),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.photoUrls.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                        ),
                      ),
                      Text(
                        "${widget.age}",
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        widget.location,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Relation souhaitée :",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.desiredRelation,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onDislike?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.red,
                  ),
                  child: const Icon(Icons.close, size: 40, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onLike?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.green
                  ),
                  child:
                      const Icon(Icons.favorite, size: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
