import 'package:firstapp/models/get_student_model.dart';
//import 'package:firstapp/models/user_model.dart';
import 'package:firstapp/service/user_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GetStudentModel>>(
        future: UserService.getStudents(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<GetStudentModel>? userData = snapshot.data;
            return _getList(userData);
          } else if (snapshot.hasError) {
            return Text('${snapshot.data} error ${snapshot.hasError}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _getList(userData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userData[index].firstName),
                subtitle: Text(userData[index].lastName),
                leading: const Icon(Icons.info),
              );
            }),
      ),
    );
  }
}
