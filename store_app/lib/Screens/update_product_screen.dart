import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Services/update_product.dart';
import 'package:store_app/Widgets/custom_main_button.dart';
import 'package:store_app/Widgets/custom_text_form_field.dart';

import '../Helper/show_snack_bar.dart';

// ignore: must_be_immutable
class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName;

  String? productDescription;

  dynamic productPrice;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Update Product',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      productModel.image,
                      width: 300,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Name',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: 'Product Name',
                    onChanged: (data) {
                      productName = data;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: 'Product Description',
                    onChanged: (data) {
                      productDescription = data;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Price',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: 'Product Price',
                    onChanged: (data) {
                      productPrice = data;
                    },
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CustomMainButton(
                      text: 'Update Product',
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await updateProduct(productModel);
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'Product Updated Successfuly');
                        } catch (e) {
                          showSnackBar(context, 'Failed to Update Product');
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
      id: productModel.id,
      title: productName != null ? productName! : productModel.title,
      price: productPrice ?? productModel.price,
      description: productDescription != null
          ? productDescription!
          : productModel.description,
      image: productModel.image,
      category: productModel.category,
    );
  }
}
