import 'package:flutter/material.dart';

class Ders10Ev extends StatelessWidget {
  const Ders10Ev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profil.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Cristiano Ronaldo',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Professional Footballer',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(14)),
                      child: const Image(
                        image: AssetImage('icons/be.png'),
                        width: 32,
                        height: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(14)),
                      child: const Image(
                        image: AssetImage('icons/face.png'),
                        width: 32,
                        height: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(14)),
                      child: const Image(
                        image: AssetImage('icons/insta.png'),
                        width: 32,
                        height: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(14)),
                      child: const Image(
                        image: AssetImage('icons/in.png'),
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text(
                          '80',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        Text(
                          'Posts',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '110',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '175',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        child: Text(
                          'Message',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(width: 1, color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        child: Text(
                          'Follow',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/img1.jpg'),
                            fit: BoxFit.cover),
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
