part of home_view;

class HomeViewHeader extends StatefulWidget {
  const HomeViewHeader({Key? key}) : super(key: key);

  @override
  State<HomeViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        key: Key(Theme.of(context).brightness.toString()),
        child: Consumer<ThemeProvider>(
          builder: (context, provider,child) {
            return DropdownButton<String>(
              value: provider.currentTheme,
              dropdownColor: Theme.of(context).textTheme.bodyText2?.color,
              items: [
                  DropdownMenuItem<String>(
                    value: "light",
                      child: Text("Light" , style: TextStyle(color: Theme.of(context).highlightColor))
                  ),
                  DropdownMenuItem<String>(
                    value: "dark",
                      child: Text("Dark" , style: TextStyle(color: Theme.of(context).highlightColor))
                  ),
                ],
                onChanged: (String? value){
                provider.changeTheme(value ?? 'light');
                },
            );
          }
        ),
      ),
    );
  }
}
