import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:undefeats/business/get_winner_details/parse_winner_details.dart';
import 'package:undefeats/data/constants/constants.dart';
import 'package:undefeats/ui/show_text_widget/show_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class VerticalScreen extends StatelessWidget {
  final BoxConstraints constrains;
  final Map details;

  const VerticalScreen(this.constrains, this.details, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchWinnerDetails _getDetails = FetchWinnerDetails(details);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: constrains.maxHeight * 0.02,
                bottom: constrains.maxHeight * 0.03,
                left: constrains.maxWidth * 0.03,
                right: constrains.maxWidth * 0.02),
            child: Text(
              'And Now Our UNdefeatables is',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: constrains.maxHeight * 0.02,
                bottom: constrains.maxHeight * 0.03,
                left: constrains.maxWidth * 0.03,
                right: constrains.maxWidth * 0.02),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: constrains.maxWidth * 0.42,
                      child: Text(
                        details.isNotEmpty ? details['name'] : 'Loading...',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    //needed to check if image is SVG and solve showing problem
                    !_getDetails.logo.contains('.svg')
                        ? Image.network(
                            _getDetails.logo.isNotEmpty
                                ? _getDetails.logo
                                : Constants.noImageUrl,
                            width: constrains.maxWidth * 0.45,
                          )
                        : SvgPicture.network(
                            _getDetails.logo,
                            width: constrains.maxWidth * 0.45,
                          ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowText(
                        'Short Name: ${_getDetails.shortName}', constrains),
                    ShowText(
                        'Club Colors: ${_getDetails.clubColors}', constrains),
                    ShowText('Venue: ${_getDetails.venue}', constrains),
                    ShowText('Phone: ${_getDetails.phone}', constrains),
                    ShowText('Address: ${_getDetails.address}', constrains),
                    GestureDetector(
                      onTap: () async {
                        // ignore: only_throw_errors
                        await canLaunch(_getDetails.website)
                            ? await launch(_getDetails.website)
                            // ignore: only_throw_errors
                            : throw 'Could not launch Url';
                      },
                      child: ShowText(
                          'Website: ${_getDetails.website}', constrains),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
