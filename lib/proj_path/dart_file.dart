import 'dart:io';

import 'package.dart';

typedef DartString = String;

final ProjectDart rootDart = ProjectDart(rootProj);

final ProjectDart mainDart = ProjectDart(mainProj);

///获取单项目依赖的所有Dart文件，此处会给出三个过滤器：
///- [Package]过滤器[acceptPack]
///为获取项目中的Dart文件，我们会先对[Package]进行搜索，
///此过滤器用于排除我们不希望进一步查询的[Package]
///
///- [DartFile]过滤器[acceptDartFile]
///当从[Package]中取得一系列[DartFile]文件后，
///此过滤器根据文件的名称对文件进行过滤
///
///- [DartString]过滤器[acceptDartString]
///获取到[DartFile]对应的[String]文件内容后,
///此过滤器根据文件内容进行过滤
///
/// ```dart
///     ProjectDartFile(PackageConfig.fromProj(""))
///       ..acceptPack = (pack) {
///         return true;
///       }
///       ..acceptDartFile = (file) {
///         return true;
///       }
///       ..acceptDartString = (fileString) {
///         return true;
///       };
/// ```
class ProjectDart {
  final PackageConfig config;

  final List<Package> filteredPacks = [];

  final List<DartFile> filteredDartFiles = [];

  final List<DartFile> filteredDartString = [];

  final List<Package> packages = [];

  final List<DartFile> files = [];

  ProjectDart(this.config);

  bool Function(Package)? acceptPack;

  bool Function(DartFile)? acceptDartFile;

  bool Function(DartString)? acceptDartString;

  ///重新过滤，得到目标[DartFile]
  ///该方法会返回一份[files]列表的拷贝
  List<DartFile> flush() {
    _clear();
    for (var pack in config.packages) {
      bool result = _addPackage(pack);
      if (!result) continue;
      Directory dir = Directory(pack.path);
      if (!dir.existsSync()) continue;
      List<FileSystemEntity> items = dir.listSync(recursive: true);
      for (var item in items) {
        if (item is File && item.isDartFile) {
          _addDartFile(DartFile(pack, item.path));
        }
      }
    }
    return files.toList();
  }

  bool _addPackage(Package package) {
    if (acceptPack?.call(package) == false) {
      filteredPacks.add(package);
      return false;
    } else {
      packages.add(package);
      return true;
    }
  }

  void _addDartFile(DartFile file) {
    if (acceptDartFile?.call(file) == false) {
      filteredDartFiles.add(file);
    } else if (acceptDartString?.call(file.fileString) == false) {
      filteredDartString.add(file);
    } else {
      files.add(file);
    }
  }

  void _clear() {
    filteredPacks.clear();
    filteredDartFiles.clear();
    filteredDartString.clear();
    packages.clear();
    files.clear();
  }
}

///定义一个Dart文件
class DartFile {
  final Package package;
  final String filePath;

  DartFile(this.package, this.filePath);

  ///文件全名
  String get fullName => Uri.parse(filePath).pathSegments.last;

  ///文件名（无后缀）
  String get fileName => fullName.split('.').first;

  ///文件后缀
  String get fileFix => fullName.split('.').last;

  ///lib库名称
  String get libName => filePath
      .replaceAll(package.path, 'lib/')
      .replaceAll(Platform.pathSeparator, '/');

  ///在项目中引用该文件的引用名称
  String get importName =>
      'package:${filePath.replaceAll(package.path, package.name + Platform.pathSeparator).replaceAll(Platform.pathSeparator, '/')}';

  ///获取dart文件代码
  String get fileString {
    try {
      return File(filePath).readAsStringSync();
    } catch (e) {
      return "";
    }
  }
}

extension on File {
  bool get isDartFile => uri.pathSegments.last.split('.').last == 'dart';
}
