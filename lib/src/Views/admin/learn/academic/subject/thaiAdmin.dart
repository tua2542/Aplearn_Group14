import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ThaiForAdmin extends StatefulWidget {
  @override
  _ThaiForAdminState createState() => _ThaiForAdminState();
}

class _ThaiForAdminState extends State<ThaiForAdmin> {
  List<String> _videos = <String>[];

  bool _imagePickerActive = false;
  final ImagePicker _picker = ImagePicker();

  Future _takeVideo() async {
    if(_imagePickerActive) return;

  _imagePickerActive = true;
  final PickedFile videoFile = await _picker.getVideo(source: ImageSource.gallery);
  _imagePickerActive = false;

  if(videoFile == null) return;

  setState(() {
    _videos.add(videoFile.path);
  });

  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Thai'),
            ),
      body : Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _videos.length,
          itemBuilder: (BuildContext context,int index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Center(child: Text(_videos[index])),
              )
            );
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takeVideo,
        tooltip: 'Take Video',
        child: Icon(Icons.add),
      ),
    );
  }
}