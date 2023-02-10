import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/features/create_trip/provider/create_trip_controller.dart';

class CreateTripView extends ConsumerWidget {
  final void Function()? closeOnPressed;
  final void Function()? saveOnPressed;

  const CreateTripView({
    required this.closeOnPressed,
    required this.saveOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(createTripControllerProvider);

    return SafeArea(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                onPressed: closeOnPressed,
                icon: const Icon(Icons.close),
              ),
              title: Text(
                'Create a new trip',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
              ),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: controller.value?.isFinished ?? false ? saveOnPressed : null,
                  child: const Text('Create'),
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Trip title',
                      ),
                      onChanged: (value) => ref.read(createTripControllerProvider.notifier).setTripTitle(value),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text('From'),
                              const SizedBox(
                                height: 8,
                              ),
                              FilledButton.tonalIcon(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_month_outlined),
                                label: const Text('Pick start date'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text('To'),
                              const SizedBox(
                                height: 8,
                              ),
                              FilledButton.tonalIcon(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_month_outlined),
                                label: const Text('Pick end date'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
