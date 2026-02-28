# Zavisoft Shop

> 📺 **Demo Video:** [Watch here](https://www.loom.com/share/b582e131d101461a81f4463eeef7059b)

## Getting Started (Local Setup)

**Requirements:** Flutter SDK `^3.10.7`, Dart SDK `^3.0`

```bash
git clone https://github.com/sardaarNiamotullah/zavisoft.git
cd zavisoft
flutter pub get
flutter run
```

Dependencies used: `get: ^4.7.3`, `http: ^1.6.0`

## Scroll Architecture Overview

```
NestedScrollView (single vertical scroll owner)
├── SliverAppBar (collapsible header + pinned TabBar)
│   ├── FlexibleSpaceBar → CollapsibleAppBar
│   └── PreferredSize bottom → StickyTabBar
└── TabBarView (horizontal axis only)
    ├── MensTab   → CustomScrollView (SliverOverlapInjector + SliverList)
    ├── WomensTab → CustomScrollView (SliverOverlapInjector + SliverList)
    └── OthersTab → CustomScrollView (SliverOverlapInjector + SliverList)
```

## 1. How Horizontal Swipe Was Implemented

Horizontal tab switching is handled entirely by Flutter's built-in `TabBarView` + `DefaultTabController`. The `TabBarView` uses a `PageView` internally, which owns the **horizontal** gesture axis. The enclosing `NestedScrollView` owns the **vertical** axis. Flutter's gesture arena resolves conflicts between the two: a gesture that starts more horizontal is claimed by `TabBarView`; one that starts more vertical is claimed by `NestedScrollView`. No custom gesture detectors or `GestureRecognizer` overrides were needed — the axis separation is handled by the framework.

## 2. Who Owns the Vertical Scroll and Why

**`NestedScrollView` is the single vertical scroll owner.**

Each tab's `CustomScrollView` does not independently scroll. Instead, it acts as a _scroll sink_ that reports its content to the parent `NestedScrollView` via the `SliverOverlapInjector` / `SliverOverlapAbsorber` pair. This pair "donates" the header's overlap region to each tab so content is never hidden under the pinned `SliverAppBar`.

Because there is only one vertical `ScrollController` (owned by `NestedScrollView`), switching tabs does not reset scroll position — the position is stored at the `NestedScrollView` level, not inside each tab. Pull-to-refresh (`RefreshIndicator`) works from any tab because it hooks into the same single scroll stream.

## 3. Trade-offs and Limitations

**Trade-off:** `NestedScrollView` is idiomatic and avoids `ScrollController` hacks, but header collapse state is shared across all tabs — collapsing on one collapses all.

**Limitations:**
Per-tab independent header state is not possible without dropping `NestedScrollView`
