import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasqueue/app/widget/task_add_widget.dart';
import 'package:tasqueue/domain/blocs/add_bloc.dart';
import 'package:tasqueue/domain/blocs/add_event.dart';
import 'package:tasqueue/domain/blocs/add_state.dart';
import 'package:tasqueue/repository_cache/local_tasqueue_repository.dart';

class AddPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AddPage());
  }

  @override
  State<StatefulWidget> createState() {
    return _AddState();
  }
}

class _AddState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AddBloc(LocalTasqueueRepository())..add(TaskFetch()),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
                appBar: AppBar(
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text("Add"),
                ),
                body: Center(
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
                    child: BlocBuilder<AddBloc, AddState>(
                        builder: (context, state) {
                  if (state is TaskFetched) {
                    return Center(
                      child: TaskAddWidget(),
                    );
                  } else {
                    return Text(state.toString());
                  }
                })))));
  }
}
