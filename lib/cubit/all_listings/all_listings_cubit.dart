import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ircf/cubit/all_listings/all_listings_state.dart';
import 'package:ircf/cubit/course_listing/course_listing_state.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_listing_response.dart';
import 'package:ircf/service/repo/ircf_repository.dart';


class AllListingCubit extends  Cubit<AllListingState>{

  final IrcfRepository  _repository;

  AllListingCubit(this._repository) : super(AllListingInitial());


  Future<void> allListing() async {
    try {


      AllListingResponse allListingResponse = await _repository.allCourse();

      emit(AllListingSuccess(allListingResponse));

      //     print(AllListingResponse);
    }catch(e){
      emit(AllListingError(e.toString()));
    }
  }

}