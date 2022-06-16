part of details_view;

class DetailsViewFooter extends StatefulWidget {
  Book book;
  DetailsViewFooter({Key? key , required this.book}) : super(key: key);

  @override
  State<DetailsViewFooter> createState() => _DetailsViewFooterState();
}

class _DetailsViewFooterState extends State<DetailsViewFooter> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeProvider>(
      builder: (context, provider,child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Description", style: headerStyle.copyWith(color: provider.currentTheme == "dark" ? white : black)),
            Text("${widget.book.description}", style: authorstyle.copyWith(color: provider.currentTheme == "dark" ? white : black)),
          ],
        );
      }
    );
  }
}
