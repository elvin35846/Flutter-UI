import 'package:flutter/material.dart';
import 'package:kroon_oil/models/Product.dart';

class DetailScreen extends StatelessWidget {
  final Product productDetail;
  const DetailScreen({Key? key, required this.productDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/images/kroon_logo.png'),
          height: 60,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            )),
      ),
      body: DetailScreenBody(product: productDetail),
    );
  }
}

class DetailScreenBody extends StatefulWidget {
  final Product product;
  const DetailScreenBody({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreenBody> createState() => _DetailScreenBodyState();
}

class _DetailScreenBodyState extends State<DetailScreenBody>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 400,
            child: TabBarView(
              controller: _controller,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        widget.product.image_1.toString(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${widget.product.price_1} AZN',
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        widget.product.image_4.toString(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${widget.product.price_4} AZN',
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        widget.product.image_5.toString(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${widget.product.price_5} AZN',
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TabBar(
              labelPadding: const EdgeInsets.all(8),
              controller: _controller,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.yellow)),
              tabs: const [
                Text(
                  '1 L',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  '4 L',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  '5 L',
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            widget.product.title.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.specifications.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                const SizedBox(height: 10),
                Text(
                  widget.product.description.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                const SizedBox(height: 10),
                Text(
                  widget.product.application.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
