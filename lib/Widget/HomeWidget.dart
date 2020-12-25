import 'package:flutter/material.dart';
import 'package:km_character_count/Utility/Screen.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {

  int _characterCount = 0;
  double opacityLevel = 0.0;
  final _textController = TextEditingController();
  final _scrollController = ScrollController();


  double screenWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    Screen(context);
    if (800 <= Screen.size.width) {
      screenWidth = 800.0;
    } else {
      screenWidth = Screen.size.width;
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textField(),
              _button(),
              _characterCountDisplayWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(bottom: 16),
      constraints: BoxConstraints(maxHeight: 200),
      child: SingleChildScrollView(
        child: TextField(
          controller: _textController,
          scrollController: _scrollController,
          keyboardType: TextInputType.multiline,
          autofocus: true,
          maxLines: null,
          cursorHeight: 1.0,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '文字数をカウントします',
            hintText: 'テキストを入力',
          ),
          onChanged: (text) {
            if (text.isEmpty) {
              setState(() {
                this.opacityLevel = 0.0;
                this._characterCount = text.length;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _button() {
    return Container(
      height: 44,
      width: screenWidth,
      margin: EdgeInsets.only(bottom: 16),
      child: RaisedButton(
        child: Text('カウントする',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: _characterCountButtonTapped,
      ),
    );
  }

  Widget _characterCountDisplayWidget() {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 4,
        children: [
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: Duration(milliseconds: 300),
            child: SelectableText(_characterCount.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 128,
              ),
              strutStyle: StrutStyle(
                forceStrutHeight: true,
                fontSize: 128.0,
                height: 1.5,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: Duration(milliseconds: 300),
            child: Text('文字',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
              ),
            ),
          ),
        ],
      )
    );
  }

  void _characterCountButtonTapped() {
    final text = _textController.text;
    setState(() {
      this._characterCount = text.length;
      this.opacityLevel = opacityLevel == 0 ? 1.0 : 1.0;
    });

  }

}