import 'package:flutter/material.dart';
import 'package:fluxstore/feature/common/presentation/widgets/brand_image.dart';
import 'package:fluxstore/feature/common/presentation/widgets/category_row.dart';
import 'package:fluxstore/feature/common/presentation/widgets/feature_product.dart';
import 'package:fluxstore/feature/common/presentation/widgets/hangout.dart';
import 'package:fluxstore/feature/common/presentation/widgets/recommended.dart';
import 'package:fluxstore/feature/common/presentation/widgets/top_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Category
            CategoryRow(),
            //Brand image
            BrandImage(),
            //Feature Product
            FeatureProduct(),
            //Hangout image
            Hangout(),
            //recommended
            Recommended(),
            //top collections
            TopCollection(),
          ],
        ),
      ),
    );
  }
}
