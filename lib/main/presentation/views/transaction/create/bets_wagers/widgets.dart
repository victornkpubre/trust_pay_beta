// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/inputs/app_secondary_dropdown.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/selected_site_tile.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/intents/user_search_view.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bets_wagers/website_search_section.dart';
import 'package:video_player/video_player.dart';



class TransactionDetailsForm extends StatefulWidget {
  final DateTime? date;
  final User? binding;
  final TextEditingController titleController;
  final TextEditingController assertionController;
  final TextEditingController amountController;
  final String currency;
  final Function(DateTime) onDateSelected;
  final Function(User) onUserSelected;
  final Function(String) onCurrencySelected;
  TransactionDetailsForm({super.key, required this.titleController, required this.amountController, this.date, required this.onDateSelected, this.binding, required this.assertionController, required this.onUserSelected, required this.currency, required this.onCurrencySelected});

  @override
  State<TransactionDetailsForm> createState() => _TransactionDetailsFormState();
}

class _TransactionDetailsFormState extends State<TransactionDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AppTextInput(
            title: 'Transaction Title',
            type: TextInputType.text,
            hint: 'Bet with classmate',
            controller: widget.titleController),
        const SizedBox(height: AppSize.s16),
        AppTextInput(
            title: 'Assertion',
            type: TextInputType.text,
            hint: 'Barcelona Fc wil beat Man UTD',
            controller: widget.assertionController),
        const SizedBox(height: AppSize.s16),
        AppDateInput(
          title: 'Expiration Date',
          firstDate: earliestExpiryDate(),
          onDateSelected: (date) {
            if(date != null) {
              widget.onDateSelected(date);
            }
          }
        ),
        const SizedBox(height: AppSize.s16),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Currency", style: appTextPrimary16Bold),
        ),
        const SizedBox(height: 6),
        AppSecondaryDropDownInput(
          width: double.infinity,
          items: const ['🇳🇬 NGN', '🇬🇧 GBP'],
          onSelect: (index) {
            widget.onCurrencySelected(index == 1 ? 'GBP' : 'NGN');
          },
        ),
        const SizedBox(height: AppSize.s16),
        AppTextInput(
            title: 'Bet Amount',
            type: TextInputType.number,
            hint: '0',
            currencySymbol: currencySymbolFor(widget.currency),
            controller: widget.amountController),
        const SizedBox(height: AppSize.s16),
        AppSelectInput(
          width: double.infinity,
          title: "Add Bettor",
          hint: widget.binding == null? "Select User": "${widget.binding?.firstName} ${widget.binding?.lastName}",
          onSelect: (selection) async {
            User? result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSearchView()));
            if(result!=null){
              widget.onUserSelected(result);
            }
          },
        ),
      ],
    );
  }
}

enum SourceType { image, video, website }
class Source {
  final String url;
  final String name;
  final SourceType type;
  File? data;
  String? image;
  Source({
    required this.type,
    required this.url,
    required this.name,
    this.data,
    this.image,
  });
}


class SourceOfTruthWidget extends StatefulWidget {
  final Function(Source?) onSelection;
  const SourceOfTruthWidget({
    super.key, required this.onSelection
  });

  @override
  State<SourceOfTruthWidget> createState() => _SourceOfTruthWidgetState();
}

class _SourceOfTruthWidgetState extends State<SourceOfTruthWidget> {
  SourceType type = SourceType.image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text("Select Source of Truth", style: appTextGray16),
          const SizedBox(height: 16),

          AppSecondaryDropDownInput(
            width: double.infinity,
            items: const [
              "Image",
              "Video",
              "Website",
            ],
            onSelect: (selected) {
              setState(() {
                type = SourceType.values[selected];
              });
            },
          ),
          const SizedBox(height: 16),

          type == SourceType.image?
          UploadMediaWidget(
            mediaType: MediaType.image,
            onSelect: (image) {
              if(image == null) {
                widget.onSelection(null);
              }
              else {
                Source source = Source(
                  name: getName(image.path),
                  url: image.path,
                  type: SourceType.image,
                  data: image
                );
                widget.onSelection(source);
              }
            },
          ): Container(),

          type == SourceType.video?
          UploadMediaWidget(
            mediaType: MediaType.video,
            onSelect: (video) {
              if(video == null) {
                widget.onSelection(null);
              }
              else {
                Source source = Source(
                  name: getName(video.path),
                  url: video.path,
                  type: SourceType.video,
                  data: video
                );
                widget.onSelection(source);
              }
            },
          ): Container(),

          type == SourceType.website?
          WebViewScreen(
            onSaveWebsite: (website) {
              Source source = Source(
                name: extractWebsiteName(website),
                url: website,
                type: SourceType.website,
              );
              widget.onSelection(source);
            },
          ):
          Container()
        ],
      ),
    );
  }
}

String extractWebsiteName(String url) {
  try {
    // Parse URL
    Uri uri = Uri.parse(url);

    // Get domain (host)
    String domain = uri.host;

    // Remove "www." if present
    if (domain.startsWith("www.")) {
      domain = domain.substring(4);
    }

    // Remove TLD (.com, .net, .org, etc.)
    List<String> parts = domain.split(".");
    if (parts.length > 1) {
      return parts[0]; // Extract main website name
    }

    return domain; // Fallback to the full domain if splitting fails
  } catch (e) {
    return "Invalid URL"; // Handle errors
  }
}

String getName(String url) {
  String name = basename(url);
  return name.split('.')[0];
}

class SelectedWebsite {
  String url;
  String title;
  String? image;
  SelectedWebsite({
    required this.url,
    required this.title,
    this.image,
  });
}

class SearchWebsiteWidget extends StatefulWidget {
  final Function(SelectedWebsite) onWebsiteSelected;
  const SearchWebsiteWidget({
    super.key, required this.onWebsiteSelected,
  });

  @override
  State<SearchWebsiteWidget> createState() => _SearchWebsiteWidgetState();
}

class _SearchWebsiteWidgetState extends State<SearchWebsiteWidget> {
  final TextEditingController searchController = TextEditingController();
  int currentPage = 1;
  WebsiteInput? selection;
  List results = [];
  List<String> savedWebsites = [];

  // Fetch search results using DuckDuckGo API
  Future<void> search(String query) async {
    final url = "https://api.duckduckgo.com/?q=$query&format=json";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        results = data["RelatedTopics"] ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSearchInput(
            borderColor: AppColor.secondary,
            hint: 'Search...',
            controller: searchController,
            onChange: (value) => search(value),
          ),
          const SizedBox(height: 16),

          selection != null?
          InkWell(
            onTap: () {
              setState(() {
                selection = null;
              });
            },
            child: SelectedWebsiteTile(
              url: selection!.url,
              title: selection!.title,
              selected: true
            ),
          ):
          Expanded(
            child: SingleChildScrollView(
              child: results.isEmpty?
              Center(
                child: Text('Search for a website', style: appTextBlack18Bold),
              ):
              Column(
                children: results.map((result) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          SelectedWebsite site = SelectedWebsite(
                            url: result.url,
                            title: result.title,
                          );

                          widget.onWebsiteSelected(
                            site
                          );

                          setState(() {
                            selection = result;
                          });
                        },
                        child: SelectedWebsiteTile(
                          url: result.url,
                          title: result.title,
                          selected: false
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  );
                }).toList()
              ),
            ),
          ),

          selection == null?
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Prev", style: appTextPrimary16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Text("${currentPage-1}", style: appTextPrimary12)
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.primary, width: 1.3)
                      ),
                      child: Text("${currentPage}", style: appTextPrimary12)
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Text("${currentPage+1}", style: appTextPrimary12)
                    ),
                  ],
                ),
                Text("Next", style: appTextPrimary16),
              ],
            ),
          ): Container(),
          const SizedBox(height: 64),

        ],
      ),
    );
  }
}

enum MediaType {image, video}
class UploadMediaWidget extends StatefulWidget {
  final MediaType mediaType;
  final Function(File?) onSelect;
  const UploadMediaWidget({
    super.key, required this.onSelect, required this.mediaType,
  });

  @override
  State<UploadMediaWidget> createState() => _UploadMediaWidgetState();
}

class _UploadMediaWidgetState extends State<UploadMediaWidget> {
  final picker = ImagePicker();
  VideoPlayerController? _controller;
  bool selected = false;
  String? path;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      color: AppColor.borderGray,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      dashPattern: const [5, 5],
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: selected? const EdgeInsets.all(10): EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                        selected?
                          AppColor.lightGreen:
                          AppColor.secondary,
                        shape: BoxShape.circle
                      ),
                      child:
                      selected?
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.green,
                            shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.check,
                            color: AppColor.white,
                            size: 12
                          ),
                        ):
                        Icon(
                          color: AppColor.primary,
                          Icons.cloud_upload_outlined,
                          size: 24,
                        )
                    ),
                  ),
                  const SizedBox(width: 10),

                  Flexible(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selected?
                          "Upload Successful":
                          "Tap to Upload",
                          style: appTextBlack16Bold
                        ),
                        Text(
                          widget.mediaType == MediaType.image?
                          basename(path??"image.png"):
                          basename(path??"video.mp4"),
                          style: appTextGray14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              flex: 2,
              child:
              selected?
              InkWell(
                onTap: () {
                  setState(() {
                    path = null;
                    selected = false;
                  });
                  widget.onSelect(null);
                },
                child: Icon(
                  FontAwesomeIcons.trashCan,
                  color: AppColor.red,
                ),
              ):
              PrimaryButton(
                title: "Upload",
                onTap: () async {
                  try {
                    final pickedFile = widget.mediaType == MediaType.image?
                      await picker.pickImage(source: ImageSource.gallery):
                    await picker.pickVideo(source: ImageSource.gallery);

                    if(pickedFile != null) {
                      //Check video length and image size
                      bool videoToLong = false;
                      // if(widget.mediaType == MediaType.video) {
                      //   final videoLength = await videoSize(pickedFile);
                      //   videoToLong = videoLength.inMinutes > AppConstants.maxVideoLengthInMinutes;
                      // }

                      if(videoToLong) {
                        showSnackBar(context: context, message: 'Video too long');
                      }
                      else {
                        setState(() {
                          path = pickedFile.path;
                          selected = true;
                        });
                        widget.onSelect(File(pickedFile.path));
                      }
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }

}

