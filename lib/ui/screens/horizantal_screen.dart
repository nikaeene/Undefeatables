import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:undefeats/business/get_winner_details/parse_winner_details.dart';
import 'package:undefeats/data/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HorizantalScreen extends StatelessWidget {
  final BoxConstraints constrains;
  final Map details;

  const HorizantalScreen(this.constrains, this.details, {Key? key})
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //needed to check if image is SVG and solve showing problem

                    !_getDetails.logo.contains('.svg')
                        ? Image.network(
                            _getDetails.logo.isNotEmpty
                                ? _getDetails.logo
                                : Constants.noImageUrl,
                            height: constrains.maxHeight * 0.45,
                          )
                        : SvgPicture.network(
                            _getDetails.logo,
                            height: constrains.maxHeight * 0.45,
                          ),
                    SizedBox(
                      width: constrains.maxWidth * 0.25,
                      height: constrains.maxHeight * 0.45,
                      child: Text(
                        details.isNotEmpty ? details['name'] : 'Loading...',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            bottom: constrains.maxHeight * 0.02,
                            top: constrains.maxHeight * 0.03),
                        width: constrains.maxWidth * 0.62,
                        child: Text(
                          _getDetails.shortName.isNotEmpty
                              ? 'Short Name: ${_getDetails.shortName}'
                              : 'Loading',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: constrains.maxHeight * 0.02),
                        width: constrains.maxWidth * 0.62,
                        child: Text(
                          _getDetails.clubColors.isNotEmpty
                              ? 'Club Colors: ${_getDetails.clubColors}'
                              : 'Loading',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: constrains.maxHeight * 0.02),
                        width: constrains.maxWidth * 0.62,
                        child: Text(
                          _getDetails.venue.isNotEmpty
                              ? 'Venue: ${_getDetails.venue}'
                              : 'Loading',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: constrains.maxHeight * 0.02),
                        width: constrains.maxWidth * 0.62,
                        child: Text(
                          _getDetails.phone.isNotEmpty
                              ? 'Phone: ${_getDetails.phone}'
                              : 'Loading',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: constrains.maxHeight * 0.02),
                        width: constrains.maxWidth * 0.62,
                        child: Text(
                          _getDetails.address.isNotEmpty
                              ? 'Address: ${_getDetails.address}'
                              : 'Loading',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    GestureDetector(
                      onTap: () async {
                        // ignore: only_throw_errors
                        await canLaunch(_getDetails.website)
                            ? await launch(_getDetails.website)
                            // ignore: only_throw_errors
                            : throw 'Could not launch Url';
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              bottom: constrains.maxHeight * 0.02),
                          width: constrains.maxWidth * 0.62,
                          child: Text(
                            _getDetails.website.isNotEmpty
                                ? 'Website: ${_getDetails.website}'
                                : 'Loading',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.blue),
                          )),
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
