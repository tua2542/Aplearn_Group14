import 'package:aplearn_group14/src/Views/vote/vote_widget/vote_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VoteApp extends StatefulWidget {
  @override
  @override
  _VoteAppState createState() => _VoteAppState();
}

// _buildBody(context),
class _VoteAppState extends State<VoteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Voting Panel')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('voteCourseTitle')
                  .document('title')
                  .snapshots(),
              builder: (context, snapshot) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Center(
                    child: RichText(
                      text: new TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: snapshot.data['question'] + '\n',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Flexible(
            child: VoteWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('voteCourses').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => record.reference.updateData({'votes': record.votes + 1}),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['courseName'] != null),
        assert(map['votes'] != null),
        name = map['courseName'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
