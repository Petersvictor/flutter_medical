import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/models/message.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:flutter_medical/screens/call_screen/pickup/pickup_layout.dart';
import 'package:flutter_medical/screens/chat_screen/widgets/cached_image.dart';
import 'package:flutter_medical/services/auth_service.dart';
import 'package:flutter_medical/services/database.dart';
import 'package:flutter_medical/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_medical/utils/call_utilities.dart';
import 'package:flutter_medical/utils/enum/view_state.dart';
import 'package:flutter_medical/utils/permissions.dart';
import 'file:///C:/Users/Peters/AndroidStudioProjects/flutter_medical/lib/provider/image_upload_provider.dart';
import 'package:flutter_medical/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:emoji_picker/emoji_picker.dart';


class ChatScreen extends StatefulWidget {

  final Users receiver;
  ChatScreen({this.receiver});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  TextEditingController chatController = TextEditingController();
  bool isTyping = false;
  bool showEmojiPicker = false;
  Authentication _authentication = Authentication();
  Database _database = Database();
  Users sender;
  String _currentUserId;
  ScrollController _listScrollController= ScrollController();
  FocusNode textFieldFocus = FocusNode();
  ImageUploadProvider _imageUploadProvider;

  @override
  void initState() {
    super.initState();
    _authentication.getCurrentUser().then((User user) {
      _currentUserId = user.uid;

      _authentication.fetchCurrentUserDetails(user).then((Users users) {
        setState(() {
          sender = users;
        });
      });
    });
    emojiContainer();
  }

  showKeyboard() => textFieldFocus.requestFocus();
  hideKeyboard() => textFieldFocus.unfocus();

  hideEmojiContainer() {
    setState(() {
      showEmojiPicker= false;
    });
  }

  showEmojiContainer() {
    setState(() {
      showEmojiPicker= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _imageUploadProvider = Provider.of<ImageUploadProvider>(context);
    return PickupLayout(
      scaffold: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(
                  top: 5,
                  bottom: 5
                ),
                child: Material(
                  child: CircleAvatar(
                    maxRadius: getProportionateScreenWidth(15),
                    backgroundImage: NetworkImage(
                        widget.receiver.url
                    ),
                  ),
                ),
              ),
              SizedBox(width:10),
              Text(
                widget.receiver.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () async {
                await Permissions.cameraAndMicrophonePermissionsGranted() ?
                CallUtilities.dial(
                  from: sender,
                  to: widget.receiver,
                  context: context
                ) : {};
              },
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body:SafeArea(
          child: Column(
            children: [
              Flexible(
                child: messageList(),
              ),
              _imageUploadProvider.getViewState == ViewState.LOADING
                  ? Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 15),
                  child: CircularProgressIndicator())
                  : Container(),
              chatControls(),
              showEmojiPicker ?  Container(child: emojiContainer(),) : Container(),
            ],
          )
        )
      ),
    );
  }

  emojiContainer() {
    return EmojiPicker(
      bgColor: kPrimaryLightColor,
      indicatorColor: kPrimaryColor,
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          isTyping = true;
        });

        chatController.text = chatController.text + emoji.emoji;
      },
      recommendKeywords: ['face', 'happy','sad', 'party', 'cry', 'sick' ],
      numRecommended: 20,
    );
  }

  Widget messageList() {
  return StreamBuilder(
    stream: _database.firestore.collection('messages')
        .doc(_currentUserId)
        .collection(widget.receiver.uid)
        .orderBy('timestamp', descending: true)
        .snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.data == null) {
        return Center(child: CircularProgressIndicator(),);
      }

      // SchedulerBinding.instance.addPostFrameCallBack((_) {
      //   _listScrollController.animateTo(
      //     _listScrollController.position.minScrollExtent,
      //     duration: Duration(milliseconds: 250),
      //     curve: Curves.easeInOut
      //   );
      // });

      return ListView.builder(
        padding: EdgeInsets.all(10),
        reverse: true,
        controller: _listScrollController,
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
          return chatMessageItem(snapshot.data.docs[index]);
        },
      );
    },
  );
  }

  Widget chatMessageItem(DocumentSnapshot snapshot) {

    Message _message = Message.fromMap(snapshot.data());

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15
      ),
      child: Container(
        alignment: _message.senderId == _currentUserId ? Alignment.centerRight : Alignment.centerLeft,
        child: _message.senderId == _currentUserId ? senderLayout(_message) : receiverLayout(_message)
      ),
    );
  }

  Widget senderLayout(Message message) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65
      ),
      decoration: BoxDecoration(
        color: Color(0XFFEEF1FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: getMessage(message)
      ),
    );
  }

  getMessage(Message message) {
    return  message.type != 'image' ?
    Text(
      message.message,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16
      ),
    ) : message.photoUrl != null  ? CachedImage(message.photoUrl, height: 250, width: 250, radius: 10,)
        : Text('Url was null');
  }


  Widget receiverLayout(Message message) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.65
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: getMessage(message)
      ),
    );
  }

  Widget chatControls() {

    setTypingTo(bool val) {
      setState(() {
        isTyping = val;
      });
    }

    void pickImage({@required ImageSource source}) async {
      File _image;
      final selectedImage = await ImagePicker().getImage(source: source);
      setState(() {
        _image = File(selectedImage.path);
      });
      await Utils.pickImage(selectedImage: _image);
      _database.uploadImage(
          image: _image,
          receiverId: widget.receiver.uid,
          senderId: _currentUserId,
        imageUploadProvider: _imageUploadProvider
      );
    }

    addMediaModal(context) {
      showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15
                ),
                child: Row(
                  children: [
                    FlatButton(
                      child: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Content and tools',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  children: [
                    ModalTile(
                      press: () => pickImage(source: ImageSource.camera),
                      icon: Icons.list,
                      title: 'File',
                      subTitle: 'Share Files',
                    ),
                    ModalTile(
                      icon: Icons.list,
                      title: 'File',
                      subTitle: 'Share Files',
                    ),
                    ModalTile(
                      icon: Icons.list,
                      title: 'File',
                      subTitle: 'Share Files',
                    ),
                  ],
                )
              )
            ],
          );
        }
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenWidth(5),
            ),
            width: getProportionateScreenWidth(300),
            // height: 55,
            decoration: BoxDecoration(
              color: Color(0XFFEEF1FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if(!showEmojiPicker) {
                      //Keyboard is Visible
                      hideKeyboard();
                      showEmojiContainer();
                    } else{
                      //keyboard is hidden
                      showKeyboard();
                      hideEmojiContainer();
                    }
                    emojiContainer();
                  },
                  child: Icon(Icons.face_outlined,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: chatController,
                    focusNode: textFieldFocus,
                    onTap: () => hideEmojiContainer(),
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (val) {
                      (val.length > 0 && val.trim() != "") ? setTypingTo(true) : setTypingTo(false);
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(
                        color: kAshColor,
                        fontSize: 16
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pickImage(source: ImageSource.gallery);
                  },
                  child: Icon(Icons.camera_alt,),
                ),
              ],
            ),
          ),
          Container(
            height: getProportionateScreenWidth(55),
            width: getProportionateScreenWidth(55),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0XFFEEF1FF),
              shape: BoxShape.circle,
            ),
            child: isTyping ? IconButton(
              icon: Icon(
                  Icons.send,
              ),
              onPressed: () => sendMessage(),
            ) : GestureDetector(
              onTap: () {
                addMediaModal(context);
              },
              child: Icon(Icons.attach_file_outlined,),
            )
          ),
        ],
      ),
    );
  }
  sendMessage() {
    var text = chatController.text;
    Message _message = Message(
      receiverId: widget.receiver.uid,
      senderId: _currentUserId,
      message: text,
      timestamp: Timestamp.now(),
      type: 'text'
    );
    setState(() {
      isTyping = false;
    });

    chatController.text = "";
    _database.addMessageToDb(_message);
  }
}



class ModalTile extends StatelessWidget {

  ModalTile({
    @required this.title,
    @required this.subTitle,
    @required this.icon, this.press
});
  final String title, subTitle;
  final IconData icon;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: press,
              child: Container(
                height: 40,
                width: 40,
                color: kPrimaryLightColor,
                child: Icon(icon),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                Spacer(),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

