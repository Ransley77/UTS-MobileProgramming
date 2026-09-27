import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isInitiallyFavorite;
  final ValueChanged<bool>? onFavoriteChanged;

  const FavoriteButton({
    super.key,
    this.isInitiallyFavorite = false,
    this.onFavoriteChanged,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isInitiallyFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });

        if (widget.onFavoriteChanged != null) {
          widget.onFavoriteChanged!(_isFavorite);
        }
      },
    );
  }
}
