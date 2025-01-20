// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_date_input.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/inputs/app_secondary_dropdown.dart';
import 'package:trust_pay_beta/components/inputs/app_select_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/selected_site_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/presentation/base/user_search_view.dart';

class TransactionDetailsForm extends StatefulWidget {
  final DateTime? date;
  final User? binding;
  final TextEditingController titleController;
  final TextEditingController assertionController;
  final TextEditingController amountController;
  final Function(DateTime) onDateSelected;
  final Function(User) onUserSelected;
  TransactionDetailsForm({super.key, required this.titleController, required this.amountController, this.date, required this.onDateSelected, this.binding, required this.assertionController, required this.onUserSelected});

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
          onDateSelected: (date) {
            if(date != null) {
              widget.onDateSelected(date);
            }
          }
        ),
        const SizedBox(height: AppSize.s16),
        AppTextInput(
            title: 'Bet Amount',
            type: TextInputType.number,
            hint: '0',
            controller: widget.amountController),
        const SizedBox(height: AppSize.s16),
        AppSelectInput(
          width: double.infinity,
          title: "Add Bettor",
          hint: widget.binding == null? "Select User": "${widget.binding?.firstName} ${widget.binding?.lastName}",
          onSelect: (selection) async {
            User result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSearchView()));
            widget.onUserSelected(result);
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
  String? image;  
  Source({
    required this.type, 
    required this.url,
    required this.name,
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
                  name: getName(image),
                  url: image,
                  type: SourceType.image 
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
                  name: getName(video),
                  url: video,
                  type: SourceType.video
                );
                widget.onSelection(source);
              }
            },
          ): Container(),
      
          type == SourceType.website?
          SearchWebsiteWidget(
            onWebsiteSelected: (website) {
              Source source = Source(
                name: website.title,
                url: website.url,
                image: website.image,
                type: SourceType.website
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
              child: Column(
                children: websiteSearchResult.map((result) {
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
  final Function(String?) onSelect;
  const UploadMediaWidget({
    super.key, required this.onSelect, required this.mediaType,
  });

  @override
  State<UploadMediaWidget> createState() => _UploadMediaWidgetState();
}

class _UploadMediaWidgetState extends State<UploadMediaWidget> {
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
                  Container(
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
                  const SizedBox(width: 10),
                  
                  Column(
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
                        style: appTextGray14
                      ),
                    ],
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
                    FilePickerResult? image = await FilePicker.platform.pickFiles(
                      type: widget.mediaType == MediaType.image?
                      FileType.image: 
                      FileType.video
                    );
                    if(image != null) {
                      PlatformFile file = image.files.first;
                      setState(() {
                        path = file.path!;
                        selected = true;
                      });
                      widget.onSelect(file.path!);
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
