//

import 'package:Doctor/controller/chat_message_controller.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/chat_message_widget.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatwithDoctor extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  ChatwithDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: "Dr. jobatar Ray",
            backgroundColor: Colors.transparent,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.23,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: chatController.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatController.messages[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ChatMessageWidget(
                              message: message.message,
                              timestamp: message.timestamp.toString(),
                              isUserMessage: message.isUserMessage,
                              sW: sW,
                            ),
                          );
                        },
                      )),
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                color: const Color.fromRGBO(187, 187, 238, 1),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(201, 201, 255, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Image.asset(
                          "${iconpath}ic_pin.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: chatController.messageController,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: "Send message",
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            chatController.sendMessage();
                          },
                          child: Image.asset(
                            "${iconpath}ic_send.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// class ChatwithDoctor extends StatelessWidget {
//   const ChatwithDoctor({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double sW = MediaQuery.of(context).size.width;

//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: CAppBar(
//             title: "Dr. jobatar Ray",
//             backgroundColor: Colors.transparent,
//           ),
//         ),
//         body: Column(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(40),
//                           bottomRight: Radius.circular(40))),
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height / 1.23,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       reverse: true,
//                       itemCount: chatMessages.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: ChatMessageWidget(
//                             message: chatMessages[index]['message'],
//                             timestamp: chatMessages[index]['timestamp'],
//                             isUserMessage: chatMessages[index]['isUserMessage'],
//                             sW: sW,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 height: 80,
//                 width: double.infinity,
//                 color: const Color.fromRGBO(187, 187, 238, 1),
//                 alignment: Alignment.bottomCenter,
//                 padding: const EdgeInsets.all(15),
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: const BoxDecoration(
//                       color: Color.fromRGBO(201, 201, 255, 1),
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30))),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Image.asset(
//                           "${iconpath}ic_pin.png",
//                           height: 30,
//                           width: 30,
//                         ),
//                       ),
//                       Expanded(
//                         child: TextFormField(
//                           autofocus: false,
//                           decoration: const InputDecoration(
//                             hintText: "Send message",
//                             hintStyle:
//                                 TextStyle(fontSize: 14, color: Colors.white),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 20),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Image.asset(
//                             "${iconpath}ic_send.png",
//                             height: 30,
//                             width: 30,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
