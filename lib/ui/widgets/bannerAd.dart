import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../constants/app_constants.dart';


class bannerAd extends StatefulWidget {
  const bannerAd({super.key});

  @override
  State<bannerAd> createState() => _bannerAdState();
}

class _bannerAdState extends State<bannerAd> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    _loadBannerAd(); // Chama o carregamento do anúncio ao iniciar a tela
    super.initState();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdConfig.adUnitId,
      request: const AdRequest(),
      size: AdSize
          .leaderboard, // Escolha o tamanho do banner (e.g., banner, largeBanner, fullBanner)
      listener: BannerAdListener(
        // Chamado quando um anúncio é carregado com sucesso.
        onAdLoaded: (ad) {
          // Garante que o widget seja reconstruído com o novo estado
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
            });
          }
        },
        // Chamado quando ocorre uma falha no carregamento.
        onAdFailedToLoad: (ad, error) {
          ad.dispose(); // Descarte o anúncio se ele falhar
          debugPrint('BannerAd failed to load: $error');
        },
        // Outros callbacks como onAdOpened, onAdClosed, etc.
      ),
    )..load(); // O método .load() inicia o processo de carregament'o.
  }

  @override
  void dispose() {
    _bannerAd
        ?.dispose(); // MUITO IMPORTANTE: Descarta o anúncio quando o widget for removido
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bannerHeight = _bannerAd?.size.height.toDouble() ?? 0.0;
    // Use a largura real do banner (para centralizar se for menor que a tela)
    final double bannerWidth = _bannerAd?.size.width.toDouble() ?? 0.0;

    return _isAdLoaded
        ? Container(
            alignment: Alignment.center,
            width: bannerWidth,
            height: bannerHeight,
            // O AdWidget é o widget que exibe o anúncio carregado
            child: AdWidget(ad: _bannerAd!),
          )
        : const SizedBox.shrink(); // Retorna um widget vazio se o anúncio não estiver carregado
  }
}
