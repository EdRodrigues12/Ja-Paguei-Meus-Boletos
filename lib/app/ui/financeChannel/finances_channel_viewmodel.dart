import 'package:ja_paguei_meus_boletos/app/model/youtube_channels.dart';
import 'package:ja_paguei_meus_boletos/app/repository/youtube_channel_repository.dart';
import 'package:mobx/mobx.dart';
part 'finances_channel_viewmodel.g.dart';

class FinancesChannelViewModel = _FinancesChannelViewModelBase
    with _$FinancesChannelViewModel;

abstract class _FinancesChannelViewModelBase with Store {
  NewsContainerRepository repository = NewsContainerRepository();

  @action
  Future<List<YoutubeChannel>> getData() async {
    final response = await repository.getChannels();
    return response;
  }
}