import 'package:flutter/material.dart';
import '../../../../store/example_list_bloc.dart';
import '../../../../data/models/example_model.dart';

import 'example_item.dart';
class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    exampleListBloc.fetchExampleList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: exampleListBloc.getExampleList,
      builder: (context, AsyncSnapshot<List<ExampleModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return _contentNull();
          }
          return _content(snapshot.data);
        } else if (snapshot.hasError) {
          return _contentError(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _content(List<ExampleModel> data){
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ExampleItem(exampleModel: data[index],);
      },
    );
  }

  Widget _contentNull() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("آکهی وجود ندارد.!"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: InkWell(
              child: Icon(
                Icons.refresh,
                color: Theme.of(context).accentColor,
                size: 48,
              ),
              onTap: () {
                exampleListBloc.fetchExampleList();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentError(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(error + "\n" + "دوباره سعی کنید"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: InkWell(
              child: Icon(
                Icons.refresh,
                color: Theme.of(context).accentColor,
                size: 48,
              ),
              onTap: () {
                exampleListBloc.fetchExampleList();
              },
            ),
          ),
        ],
      ),
    );
  }

}
