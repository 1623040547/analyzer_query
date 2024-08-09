import 'dart:convert';
import 'dart:io';

PackageConfig get rootProj => ProjectCollection.instance.projPackages.first;

PackageConfig get mainProj => ProjectCollection.instance.projPackages.last;

///默认的项目收集管理，通过[Platform.script]获取运行中的项目，并以此路径向上回溯，获取覆盖其上的关联项目。
///若需要获取一个自定义路径的项目的包信息，请使用[PackageConfig.fromProj]
class ProjectCollection {
  ProjectCollection._();

  static ProjectCollection? _instance;

  static ProjectCollection get instance => _instance ??= ProjectCollection._();

  final List<String> _projPaths = [];

  final List<PackageConfig> _projPackages = [];

  List<PackageConfig> get projPackages {
    if (_projPackages.isNotEmpty) {
      return _projPackages;
    }
    for (var projPath in projPaths) {
      _projPackages.add(PackageConfig.fromProj(projPath));
    }
    return _projPackages;
  }

  List<String> get projPaths {
    if (_projPaths.isNotEmpty) {
      return _projPaths;
    }
    List<String> seg = Platform.script.pathSegments;
    for (int i = 1; i <= seg.length; i++) {
      String path = seg.sublist(0, i).join(Platform.pathSeparator);
      path = Platform.script.toFilePath().split(path).first + path;
      if (File(path.packageConfigPath).existsSync()) {
        _projPaths.add(path);
        break;
      }
    }
    assert(_projPaths.isNotEmpty);
    return _projPaths;
  }
}

class PackageConfig {
  final List<Package> packages;

  final String projPath;

  PackageConfig._(
    this.projPath,
    this.packages,
  );

  static PackageConfig fromProj(String projPath) {
    String file = File(projPath.packageConfigPath).readAsStringSync();
    assert(file.isNotEmpty);
    return PackageConfig._(
      projPath,
      (jsonDecode(file)['packages'] as List)
          .map(
            (e) => Package.fromJson(
              projPath: projPath,
              json: jsonEncode(e),
            ),
          )
          .toList(),
    );
  }
}

///定义包信息
///- [isMainProj] 是否为[Platform.script]所在项目
///- [isThirdLib] 在 <b>project/.dart_tool/package_config</b> 文件中是否为绝对路径
///- [isSelf] 包名是否为[analyzer_query]项目
///- [path] 获取一个包的绝对路径
///- [projPath] 该包所在的实际项目路径
///- [name] 该包的包名
class Package {
  final String projPath;
  final String name;
  final String _rootUri;
  final String _packageUri;

  Package({
    required this.projPath,
    required this.name,
    required String rootUri,
    required String packageUri,
  })  : _packageUri = packageUri,
        _rootUri = rootUri;

  ///将根Uri转化为文件路径
  String get _rootFilePath => Uri.parse(_rootUri).toFilePath();

  ///将包Uri转化为文件路径
  String get _packageFilePath => Uri.parse(_packageUri).toFilePath();

  ///当前包是否为绝对路径
  bool get _isAbsolutePath => Uri.parse(_rootUri).isAbsolute;

  ///当前包是否为主工程
  bool get isMainProj => _rootFilePath == '..${Platform.pathSeparator}';

  ///当前包是否为第三方库
  bool get isThirdLib => _isAbsolutePath;

  ///当前包名为当前插件包名
  bool get isSelf => name == "analyzer_query";

  ///获取到一个包的绝对路径
  String get path {
    if (isMainProj) {
      return projPath + Platform.pathSeparator + _packageFilePath;
    }
    if (!_isAbsolutePath) {
      return _rootFilePath.replaceAll('..', projPath) +
          Platform.pathSeparator +
          _packageFilePath;
    }
    return _rootFilePath + Platform.pathSeparator + _packageFilePath;
  }

  static Package fromJson({
    required String projPath,
    required String json,
  }) {
    return Package(
      projPath: projPath,
      name: jsonDecode(json)['name'],
      rootUri: jsonDecode(json)['rootUri'],
      packageUri: jsonDecode(json)['packageUri'],
    );
  }
}

extension on String {
  String get packageConfigPath =>
      '$this${Platform.pathSeparator}.dart_tool${Platform.pathSeparator}package_config.json';
}
