import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state_management/screens/auto_dispode_demo/first_screen.dart';

final nameProvider = Provider<String>((ref) {
  return 'Hello kiran';
});
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      //home: const HomePage(),
    routerConfig: _router,
      
    );
  }
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state)=> const FirstPage(),
  
  ),
  GoRoute(path: 'second', builder:(context, state)=> const  )

]);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}

// using Consumer  for reading the provider in statelessWidget.
class HomePageDemo extends StatelessWidget {
  const HomePageDemo({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Center(child: Consumer(builder: (context, ref, child) {
        final name = ref.watch(nameProvider);
        return Text(name);
      })),
    );
  }
}

//reading provider using statefulwidget.
class MyHomeDemo extends ConsumerStatefulWidget {
  const MyHomeDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomeDemoState();
}

class _MyHomeDemoState extends ConsumerState<MyHomeDemo> {
  @override
  void initState() {
    super.initState();
    final name = ref.read(nameProvider); //reading provider in initSate
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}

class CounterTest extends ConsumerStatefulWidget {
  const CounterTest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterTestState();
}

class _CounterTestState extends ConsumerState<CounterTest> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
//listening the provider.
    ref.listen(counterProvider, (previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    });
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
                //ref.refresh(counterProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state++);
          //ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
