import 'package:ja_paguei_meus_boletos/app/model/youtube_channels.dart';
import 'package:ja_paguei_meus_boletos/app/repository/youtube_channel_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
part 'finances_channel_viewmodel.g.dart';

class FinancesChannelViewModel = _FinancesChannelViewModelBase
    with _$FinancesChannelViewModel;

abstract class _FinancesChannelViewModelBase with Store {
  FinancesChannelRepository repository = FinancesChannelRepository();

  @action
  Future<List<YoutubeChannel>> getData() async {
    final response = await repository.getChannels();
    return response;
  }

  @action
  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}