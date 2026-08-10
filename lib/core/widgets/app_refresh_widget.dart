import 'package:flutter/material.dart';

class AppRefreshWidget extends StatefulWidget {
  /// Pull to refresh
  final Future<void> Function() onRefresh;

  /// Load more callback
  final Future<void> Function()? onLoadMore;

  /// Whether more data exists
  final bool hasMore;

  /// Loading more state (from Cubit/Bloc)
  final bool isLoadingMore;

  /// Scrollable content (ListView / CustomScrollView)
  final Widget child;

  /// Optional external controller
  final ScrollController? controller;

  /// Distance before bottom to trigger pagination
  final double paginationThreshold;

  const AppRefreshWidget({
    super.key,
    required this.onRefresh,
    required this.child,
    this.onLoadMore,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.controller,
    this.paginationThreshold = 250,
  });

  @override
  State<AppRefreshWidget> createState() => _AppRefreshWidgetState();
}

class _AppRefreshWidgetState extends State<AppRefreshWidget> {
  ScrollController? _localController;
  late ScrollController _effectiveController;

  bool _isFetching = false;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _effectiveController = widget.controller!;
    } else {
      _localController = ScrollController();
      _effectiveController = _localController!;
    }
    _effectiveController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant AppRefreshWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      _effectiveController.removeListener(_onScroll);
      _localController?.dispose();
      _localController = null;

      if (widget.controller != null) {
        _effectiveController = widget.controller!;
      } else {
        _localController = ScrollController();
        _effectiveController = _localController!;
      }

      _effectiveController.addListener(_onScroll);
    }
  }

  void _onScroll() {
    if (!_effectiveController.hasClients) return;

    if (!widget.hasMore) return;

    if (widget.isLoadingMore) return;

    if (_isFetching) return;

    final maxScroll = _effectiveController.position.maxScrollExtent;
    final currentScroll = _effectiveController.position.pixels;

    final triggerPoint = maxScroll - widget.paginationThreshold;

    if (currentScroll >= triggerPoint) {
      _fetchMore();
    }
  }

  Future<void> _fetchMore() async {
    if (widget.onLoadMore == null) return;

    _isFetching = true;

    try {
      await widget.onLoadMore!.call();
    } finally {
      _isFetching = false;
    }
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_onScroll);
    _localController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: Stack(
        children: [
          widget.child,

          /// Bottom loading indicator
          if (widget.isLoadingMore)
            const Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
