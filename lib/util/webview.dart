import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter/material.dart';

class WebView extends StatefulWidget {


  final title;
  final url;
  WebView({this.url,this.title});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {



  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type){
        case WebViewState.shouldStart:
        //准备加载
          break;
        case WebViewState.startLoad:
        //开始加载
          break;
        case WebViewState.finishLoad:
        //加载完成
          break;
        case WebViewState.abortLoad:
          break;

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
//      appBar: widget.title == null ?  : AppBar(
//        title: widget.title,
//      ),

      withJavascript: true,
      withZoom: true,
      withLocalStorage: true,
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}
