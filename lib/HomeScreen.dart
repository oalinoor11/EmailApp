import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController subjectTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();

  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Email App")),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),

              const SizedBox(height: 10.0,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    const SizedBox(height: 5.0,),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            const BorderSide(color: Colors.green, width: 1)),
                        labelText: "To",
                        labelStyle:
                        const TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),

                    const SizedBox(height: 15.0,),
                    TextField(
                      controller: subjectTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            const BorderSide(color: Colors.green, width: 1)),
                        labelText: "Subject",
                        labelStyle:
                        const TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),

                    SizedBox(height: 15.0,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "   Message Body :",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    TextField(
                      minLines: 5,
                      maxLines: 10,
                      controller: messageTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            const BorderSide(color: Colors.green, width: 1)),
                        labelStyle:
                        const TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      height: 50,
                      child: loader
                          ? const Center(
                           child: CircularProgressIndicator(),
                      )
                          : RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: const Center(
                            child: Text(
                              "Send Email",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "bolt-semibold",
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        onPressed: () async
                        {
                          if(emailTextEditingController.text.isNotEmpty &&
                              subjectTextEditingController.text.isNotEmpty &&
                              messageTextEditingController.text.isNotEmpty)
                          {
                            setState(() {
                              loader = true;
                            });
                            const serviceId = 'service_6gk0cxg';
                            const templateId = 'template_43noyxj';
                            const userId = '2EJWOhZLIDqfTnL-H';
                            final url = Uri.parse(
                                'https://api.emailjs.com/api/v1.0/email/send-form');
                            final response = await http.post(url, body: {
                              'service_id': serviceId,
                              'template_id': templateId,
                              'user_id': userId,
                              'accessToken': 'A8TCePEyRI9GIfeTuE8cj',
                              'receiver': emailTextEditingController.text,
                              'subject': subjectTextEditingController.text,
                              'message': messageTextEditingController.text,

                            });
                            print(response.body);
                            Get.snackbar(
                              "Success!",
                              "Email sent successfully.",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );

                            emailTextEditingController.clear();
                            subjectTextEditingController.clear();
                            messageTextEditingController.clear();

                            setState(() {
                              loader = false;
                            });
                          }
                          else{
                            Get.snackbar(
                              "Failed!",
                              "Fill up all the fields",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
