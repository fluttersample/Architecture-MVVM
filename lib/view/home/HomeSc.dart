
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/data/remote/response/ApiResponse.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/res/AppContextExtension.dart';
import 'package:test_mvvm/view/detail/DetailSc.dart';
import 'package:test_mvvm/view/widgets/ErrorWidget.dart';
import 'package:test_mvvm/view/widgets/LoadingWidget.dart';
import 'package:test_mvvm/view_model/home/HomeViewModel.dart';

class HomeSc extends StatefulWidget {
  static const String id = 'Home_screen';
  const HomeSc({Key? key}) : super(key: key);

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {


  @override
  void initState() {
   final viewModel = Provider.of<HomeViewModel>
     (context,listen: false);

   Future.delayed(Duration.zero,() {
     viewModel.fetchMovies();
   },);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Architecture  MVVM'),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, _) {
          switch (value.photoMain.status)
          {
            case Status.LOADING:
              return const LoadingWidget();
            case Status.COMPLETED:
              return _getPhotoListView(value.photoMain.data);
            case Status.ERROR:
              return MyErrorWidget(
                textError: value.photoMain.message??'',
              );
            default: return const Text("");
          }
        },
      ),

    );
  }

  Widget _getPhotoListView(List<PhotoModel>? data) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 15
      ),
        itemCount: 15,
        itemBuilder: (context, position) {
          final PhotoModel model = data![position];
          return _getPhotoListItem(model);
        },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },);
  }
  Widget _getPhotoListItem(PhotoModel item) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Card(
        child: ListTile(
          leading: Hero(
            tag: item.id!,
            child: ClipRRect(
              child: Image.network(
                item.url ?? "",
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: context.resources.dimension.listImageSize,
                      width: context.resources.dimension.listImageSize,
                      child: const FlutterLogo());
                },
                fit: BoxFit.fill,
                width: context.resources.dimension.listImageSize,
                height: context.resources.dimension.listImageSize,
              ),
              borderRadius: BorderRadius.circular(context.resources.dimension.imageBorderRadius),
            ),
          ),
          title: Text(item.title??'a',style: TextStyle(
            fontSize: context.resources.dimension.mediumText,
            color: context.resources.color.colorPrimary
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis),

          onTap: () {
            _sendDataToPhotoDetailSc(item);
          },
        ),

        elevation:0,
      ),
    );
  }
  void _sendDataToPhotoDetailSc(PhotoModel data)
  {
    Navigator.of(context).pushNamed(DetailSc.id,arguments: data);
  }
}
