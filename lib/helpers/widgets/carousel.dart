import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';

class CarouselParallax extends StatelessWidget {
  const CarouselParallax({
    Key? key,
    required this.child,
    this.curve = Curves.ease,
    required this.height,
    required this.index,
    this.minScale = 0.64,
    required this.page,
    this.parallaxEffect = false,
  }) : super(key: key);

  final Widget child;
  final Curve curve;
  final double height;
  final int index;
  final double minScale;
  final double? page;
  final bool parallaxEffect;

  @override
  Widget build(BuildContext context) {
    final double itemOffset = (page ?? 0.0) - index;

    final double distortionValue = curve.transform(
      (1 - (itemOffset.abs() * (1 - minScale))).clamp(0.0, 1.0).toDouble(),
    );

    final Widget sizedBox = SizedBox(
      height: distortionValue * height,
      child: child,
    );

    return Transform.scale(
      scale: distortionValue,
      child: parallaxEffect
          ? Align(
              alignment: Alignment(distortionValue, 0.0),
              child: sizedBox,
            )
          : sizedBox,
    );
  }
}

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({
    Key? key,
    required this.carousel,
    this.aspectRatio,
    this.height,
    this.padding,
  }) : super(key: key);

  final Widget Function(double viewportFraction) carousel;
  final double? aspectRatio;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final BuildMedia media = context.media;
    final double width = media.width;
    final double viewportFraction =
        (width - (padding?.horizontal ?? 0)) / width;

    return SizedBox(
      width: width,
      height: height ??
          (aspectRatio != null
              ? ((width / aspectRatio!) * viewportFraction)
              : null),
      child: OverflowBox(
        maxWidth: width,
        child: carousel(viewportFraction),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  Carousel({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    CarouselController? controller,
    this.minScale = 0.64,
    this.onPageChanged,
    this.isInfinite = false,
    this.parallaxEffect = false,
    this.curve = Curves.ease,
    this.viewportFraction = 1.0,
    this.scrollDirection = Axis.horizontal,
    this.physics = const BouncingScrollPhysics(),
    this.reverse = false,
    this.pageSnapping = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.none,
    this.scrollBehavior,
    this.initialPage = 0,
  })  : controller = controller ?? CarouselController(),
        super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Controls whether the widget's pages will respond to
  /// [RenderObject.showOnScreen], which will allow for implicit accessibility
  /// scrolling.
  ///
  /// With this flag set to false, when accessibility focus reaches the end of
  /// the current page and the user attempts to move it to the next element, the
  /// focus will traverse to the next widget outside of the page view.
  ///
  /// With this flag set to true, when accessibility focus reaches the end of
  /// the current page and user attempts to move it to the next element, focus
  /// will traverse to the next page in the page view.
  final bool allowImplicitScrolling;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  final CarouselController controller;

  final Curve curve;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  final bool isInfinite;
  final int itemCount;
  final double minScale;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  /// Set to false to disable page snapping, useful for custom scroll behavior.
  final bool pageSnapping;

  final bool parallaxEffect;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// If an explicit [ScrollBehavior] is provided to [scrollBehavior], the
  /// [ScrollPhysics] provided by that behavior will take precedence after
  /// [physics].
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String? restorationId;

  /// Whether the page view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the page view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the page view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// {@macro flutter.widgets.shadow.scrollBehavior}
  ///
  /// [ScrollBehavior]s also provide [ScrollPhysics]. If an explicit
  /// [ScrollPhysics] is provided in [physics], it will take precedence,
  /// followed by [scrollBehavior], and then the inherited ancestor
  /// [ScrollBehavior].
  ///
  /// The [ScrollBehavior] of the inherited [ScrollConfiguration] will be
  /// modified by default to not apply a [Scrollbar].
  final ScrollBehavior? scrollBehavior;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  final double viewportFraction;

  final int initialPage;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _itemCount = 0;
  late PageController _pageController;

  @override
  void didUpdateWidget(covariant Carousel oldWidget) {
    if (oldWidget.viewportFraction != widget.viewportFraction ||
        oldWidget.itemCount != widget.itemCount) {
      _setController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    widget.controller._addState(this);
    _setController();
    super.initState();
  }

  void _setController() {
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.initialPage,
    );
    _itemCount = widget.itemCount;
  }

  void _onPageChanged(int index) {
    widget.onPageChanged?.call(index % widget.itemCount);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final Size size = constraints.biggest;
      final double height = size.height;

      return PageView.builder(
        onPageChanged: _onPageChanged,
        controller: _pageController,
        clipBehavior: widget.clipBehavior,
        physics: widget.physics,
        allowImplicitScrolling: widget.allowImplicitScrolling,
        scrollBehavior: widget.scrollBehavior,
        pageSnapping: widget.pageSnapping,
        restorationId: widget.restorationId,
        reverse: widget.reverse,
        dragStartBehavior: widget.dragStartBehavior,
        scrollDirection: widget.scrollDirection,
        itemCount: widget.isInfinite ? null : widget.itemCount,
        itemBuilder: (_, int index) {
          final int realIndex = index % widget.itemCount;
          return AnimatedBuilder(
            animation: _pageController,
            builder: (_, Widget? child) {
              late double? page;
              try {
                page = _pageController.page;
              } catch (_) {
                page = 0.0;
              }
              return CarouselParallax(
                height: height,
                index: index,
                page: page,
                minScale: widget.minScale,
                curve: widget.curve,
                parallaxEffect: widget.parallaxEffect,
                child: child!,
              );
            },
            child: widget.itemBuilder(_, realIndex),
          );
        },
      );
    });
  }
}

class CarouselController {
  _CarouselState? _carouselState;

  // ignore: use_setters_to_change_properties
  void _addState(_CarouselState state) => _carouselState = state;

  _CarouselState get _state {
    assert(isAttached);
    return _carouselState!;
  }

  int get itemCount => _state._itemCount;

  bool get isAttached => _carouselState != null;

  int _toRelativePage(int page) => page % itemCount;

  PageController get pageController {
    assert(isAttached);
    return _state._pageController;
  }

  double get page {
    return pageController.page! % itemCount;
  }

  /// Animates the controlled [PageView] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> animateToPage(
    int page, {
    required Duration duration,
    required Curve curve,
  }) {
    return pageController.animateToPage(
      _toRelativePage(page),
      duration: duration,
      curve: curve,
    );
  }

  /// Jumps the scroll position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  ///
  /// Any active animation is canceled. If the user is currently scrolling, that
  /// action is canceled.
  ///
  /// If this method changes the scroll position, a sequence of start/update/end
  /// scroll notifications will be dispatched. No overscroll notifications can
  /// be generated by this method.
  ///
  /// Immediately after the jump, a ballistic activity is started, in case the
  /// value was out of range.
  void jumpTo(double offset) {
    pageController.jumpTo(offset);
  }

  /// Changes which page is displayed in the controlled [PageView].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int page) {
    pageController.jumpToPage(_toRelativePage(page));
  }

  /// Animates the controlled [PageView] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> nextPage({
    required Duration duration,
    required Curve curve,
  }) {
    return pageController.nextPage(duration: duration, curve: curve);
  }

  /// Animates the controlled [PageView] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> previousPage({
    required Duration duration,
    required Curve curve,
  }) {
    return pageController.previousPage(duration: duration, curve: curve);
  }
}
