import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'colors.dart';
import 'model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories= Category.values;

  const CategoryMenuPage ({
    Key key,
    @required this.currentCategory,
    @required this.onCategoryTap,
  })  : assert(currentCategory != null),
        assert(onCategoryTap != null);
  
  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString = category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory ? Column(
        children: <Widget>[
          SizedBox(height: 16,),
          Text(
            categoryString,
            style: theme.textTheme.body2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14,),
          Container(
            width: 70,
            height: 2,
            color: cShrineSurfaceWhite,
          )
        ],
      )
      : Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          categoryString,
          style: theme.textTheme.body2.copyWith(
            color: cShrineBrown900.withAlpha(153)
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40),
        color: cShrinePink100,
        child: ListView(
          children: _categories.map((Category c) => _buildCategory(c, context)).toList(),
        ),
      ),
    );
  }
}