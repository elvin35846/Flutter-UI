import 'package:flutter/material.dart';
import 'package:quiz_app_user/utils/themes/theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var data = 0;
  List imageList = [
    {
      'img': 'https://english-lang.ru/wp-content/uploads/2021/03/19333428.jpg',
      'answer': ['A', 'B', 'C', 'D'],
      'trueAnswer': 'B',
    },
    {
      'img': 'https://english-lang.ru/wp-content/uploads/2021/03/19333428.jpg',
      'answer': ['A', 'B', 'C'],
      'trueAnswer': 'C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1-ci fəsil'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Themes.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Themes.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.thumb_up,
                        size: 20,
                        color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.thumb_down,
                        size: 20,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '5',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Yenile'),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Themes.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              '${index + 1}-ci Sual',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Image.network(imageList[index]['img']),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  itemCount: imageList[index]['answer'].length,
                                  itemBuilder: (context, val) {
                                    return AnsverOutlineButton(
                                      data: imageList[index]['answer'][val],
                                      trueAswer: imageList[index]['trueAnswer'],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text('Suallarin cemi ${imageList.length}-e beraberdi'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AnsverOutlineButton extends StatefulWidget {
  const AnsverOutlineButton({
    Key? key,
    required this.data,
    required this.trueAswer,
  }) : super(key: key);

  final String data;
  final String trueAswer;

  @override
  State<AnsverOutlineButton> createState() => _AnsverOutlineButtonState();
}

class _AnsverOutlineButtonState extends State<AnsverOutlineButton> {
  bool _answerStatus = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (widget.data == widget.trueAswer) {
          setState(() {
            _answerStatus = true;
          });
        } else {
          setState(() {
            _answerStatus = false;
          });
        }
      },
      child: Text(
        widget.data,
        style: TextStyle(
          fontSize: 20,
          color: _answerStatus != true ? Themes.primaryColor : Colors.white,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: _answerStatus != true ? Colors.white : Colors.green,
      ),
    );
  }
}
