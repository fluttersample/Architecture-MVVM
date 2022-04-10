
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/data/remote/response/ApiResponse.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/view/widgets/LoadingWidget.dart';
import 'package:test_mvvm/view_model/detail/DetailViewModel.dart';

class DetailSc extends StatelessWidget {
  static const id ='/Detail_screen';
  final PhotoModel? photoData;
  const DetailSc({Key? key,this.photoData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final  viewModel = Provider.of<DetailViewModel>(context,
    listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15
        ),
        child: Column(
          children: [
            Hero(
              tag: photoData!.id!,
              child: Image.network(photoData!.url??'',
              width: 200,
              height: 200,),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: viewModel.controllerTitle,
              decoration: InputDecoration(
                  hintText: 'Enter Title'
              ),
            ),
            const SizedBox(height: 15,),

            TextField(
              controller: viewModel.controllerBody,
              decoration: InputDecoration(
                hintText: 'Enter Body'
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer<DetailViewModel>(
              builder: (context, value, child) {
                if(value.postModel.status == Status.LOADING)
                  {
                    return LoadingWidget();
                  }
                return ElevatedButton(
                    onPressed: () {
                      viewModel.sendData();
                    },
                    child: Text('Send Data'));
              },

            )
          ],
        ),
      ),

    );
  }
}
