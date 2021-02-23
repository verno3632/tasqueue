import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasqueue/app/widget/task_list.dart';
import 'package:tasqueue/domain/blocs/list_bloc.dart';
import 'package:tasqueue/domain/blocs/list_state.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListState();
  }
}

class _ListState extends State<ListPage> {
  ListBloc _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = BlocProvider.of<ListBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(builder: (context, state) {
      if (state is ListSuccess) {
        return TaskList(state.tasks);
      } else {
        return Text(state.toString());
      }
    });
  }
}
