import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MatchCardWidget extends StatefulWidget {
  final String name;
  final int age;
  final String photoUrl;
  final Function() onProfileTap;
  final Function()? onLike;
  final Function()? onDislike;

  const MatchCardWidget({
    super.key,
    required this.name,
    required this.age,
    required this.photoUrl,
    required this.onProfileTap,
    this.onLike,
    this.onDislike,
  });

  @override
  State<MatchCardWidget> createState() => _MatchCardWidgetState();
}

class _MatchCardWidgetState extends State<MatchCardWidget> {
  bool isLikeHovered = false;
  bool isDislikeHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onProfileTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: CachedNetworkImage(
                  imageUrl: widget.photoUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 40,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
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
              Positioned(
                bottom: 20,
                left: 10,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}, ",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.age}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Dislike Button
                        MouseRegion(
                          onEnter: (_) => setState(() => isDislikeHovered = true),
                          onExit: (_) => setState(() => isDislikeHovered = false),
                          child: GestureDetector(
                            onTap: widget.onDislike,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isDislikeHovered
                                    ? Colors.red.withOpacity(0.8)
                                    : Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.close,
                                color: isDislikeHovered
                                    ? Colors.white
                                    : Colors.red,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        // Like Button
                        MouseRegion(
                          onEnter: (_) => setState(() => isLikeHovered = true),
                          onExit: (_) => setState(() => isLikeHovered = false),
                          child: GestureDetector(
                            onTap: widget.onProfileTap,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isLikeHovered
                                    ? Colors.green.withOpacity(0.8)
                                    : Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: isLikeHovered
                                    ? Colors.white
                                    : Colors.green,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
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