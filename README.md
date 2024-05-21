# Just Ready

A new project for orders managment and displaying orders status dashnbord made with Flutter. 
<br><br>
<img src="assets/gifs/create_order.gif" alt="Description of GIF" width="250">
<br><br>
<img src="assets/gifs/add_meal.gif" alt="Description of GIF" width="250">
<br><br>
<img src="assets/gifs/prepare_order.gif" alt="Description of GIF" width="700">
<br><br>
<img src="assets/gifs/dashboard.gif" alt="Description of GIF" width="700">

## Generating files

Some packages used in the project require the developer to generate files. To do that, run this
command in the project workspace:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

To generate l10n files, run:

```sh
flutter pub global run intl_utils:generate
```

To generate assets and fonts files, run:

```sh
fluttergen -c pubspec.yaml
```
