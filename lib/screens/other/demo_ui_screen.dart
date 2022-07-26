import 'package:flutter/rendering.dart';
import 'package:flutter_todo_app/custom_imports.dart';
import '../../controllers/other/demo_ui_screen_controller.dart';
import 'components/demo_ui_components.dart';

class DemoUiScreen extends StatefulWidget {
  const DemoUiScreen({Key? key}) : super(key: key);

  @override
  State<DemoUiScreen> createState() => _DemoUiScreenState();
}

class _DemoUiScreenState extends State<DemoUiScreen> {
  /// GetX Controller
  final DemoUIScreenController _demoUIScreenController =
      Get.find<DemoUIScreenController>();

  /// Scroll controller for hiding balance widget
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /// add scroll listener in to hide balance widget
    /// listen when account grid view is scrolled down or up
    addScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              /// Top container with header and balance widget
              buildTopHeaderAndBalanceContainer(context),

              /// Account header and grid view
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      buildAccountHeaderRow(context),
                      verticalSpace(context, 0.03),
                      buildCryptoAccountGridView()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTopHeaderAndBalanceContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          buildTopFixedHeader(context),
          Obx(
            () => buildHidableAccBalanceWidget(
                context, _demoUIScreenController.showAppBar.value),
          ),
        ],
      ),
    );
  }

  Expanded buildCryptoAccountGridView() {
    return Expanded(
      child: ScrollConfiguration(
        behavior: RemoveScrollingGlowEffect(),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: cryptoCurrencyAccountData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: sizeWidth(8),
            mainAxisSpacing: sizeWidth(8),
          ),
          itemBuilder: (context, index) {
            return buildCryptoCurrencyAccountItem(
              context,
              cryptoCurrencyAccountData[index],
              onExpandButtonTapped: () {
                showInfoToast(context, 'Show more details');
              },
            );
          },
        ),
      ),
    );
  }

  void addScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_demoUIScreenController.isScrollingDown.value) {
          _demoUIScreenController.isScrollingDown.value = true;
          _demoUIScreenController.showAppBar.value = false;
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_demoUIScreenController.isScrollingDown.value) {
          _demoUIScreenController.isScrollingDown.value = false;
          _demoUIScreenController.showAppBar.value = true;
        }
      }
    });
  }
}
