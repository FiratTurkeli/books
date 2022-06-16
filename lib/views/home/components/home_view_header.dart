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
        duration: Duration(milliseconds: 500),
        key: Key(Theme.of(context).brightness.toString()),
        child: Consumer<ThemeProvider>(
          builder: (context, provider,child) {
            return DropdownButton<String>(
              value: provider.currentTheme,
              items: [
                  DropdownMenuItem<String>(
                    value: "light",
                      child: Text("Light" , style: Theme.of(context).textTheme.headline6,)
                  ),
                  DropdownMenuItem<String>(
                    value: "dark",
                      child: Text("Dark" , style: Theme.of(context).textTheme.headline6,)
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
