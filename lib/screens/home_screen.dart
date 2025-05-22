import 'package:flutter/material.dart';
import 'screen_ids.dart';

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, ScreenIds.settings),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ResponsiveDashboard(),
      ),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final orientation = MediaQuery.of(context).orientation;
        final width = constraints.maxWidth;
        const itemCount = 4;

        Widget buildItem(int index, double padding) {
          return InkWell(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  ScreenIds.details,
                  arguments: index,
                ),
            child: DashboardItem(index: index, padding: padding),
          );
        }

        Widget content;
        if (orientation == Orientation.portrait) {
          content = ListView.separated(
            itemCount: itemCount,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder:
                (context, index) =>
                    buildItem(index, constraints.maxWidth * 0.04),
          );
        } else if (width < 800) {
          content = SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                itemCount,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.02,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth * 0.6,
                    child: buildItem(index, constraints.maxWidth * 0.04),
                  ),
                ),
              ),
            ),
          );
        } else {
          final columns = width > 1200 ? 4 : 2;
          content = GridView.count(
            crossAxisCount: columns,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: List.generate(
              itemCount,
              (index) => buildItem(index, constraints.maxWidth * 0.02),
            ),
          );
        }

        return Column(children: [Expanded(child: content)]);
      },
    );
  }
}

class DashboardItem extends StatelessWidget {
  final int index;
  final double padding;

  const DashboardItem({super.key, required this.index, this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            Icon(
              Icons.task_alt,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task ${index + 1}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Details for task ${index + 1}',
                    style: Theme.of(context).textTheme.bodyMedium,
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
