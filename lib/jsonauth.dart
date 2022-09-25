import 'package:meta/meta.dart';
import 'dart:convert';
/*
Authrequest authrequestFromJson(String str) =>
    Authrequest.fromJson(json.decode(str));

String authrequestToJson(Authrequest data) => json.encode(data.toJson());

class Authrequest {
  Authrequest({
    @required this.info,
    @required this.item,
    @required this.event,
    @required this.variable,
  });

  final Info info;
  final List<AuthrequestItem> item;
  final List<Event> event;
  final List<Variable> variable;

  factory Authrequest.fromJson(Map<String, dynamic> json) => Authrequest(
        info: Info.fromJson(json["info"]),
        item: List<AuthrequestItem>.from(
            json["item"].map((x) => AuthrequestItem.fromJson(x))),
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
        variable: List<Variable>.from(
            json["variable"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
        "variable": List<dynamic>.from(variable.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    @required this.listen,
    @required this.script,
  });

  final String listen;
  final Script script;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        listen: json["listen"],
        script: Script.fromJson(json["script"]),
      );

  Map<String, dynamic> toJson() => {
        "listen": listen,
        "script": script.toJson(),
      };
}

class Script {
  Script({
    @required this.type,
    @required this.exec,
  });

  final String type;
  final List<String> exec;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        type: json["type"],
        exec: List<String>.from(json["exec"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "exec": List<dynamic>.from(exec.map((x) => x)),
      };
}

class Info {
  Info({
    @required this.postmanId,
    @required this.name,
    @required this.schema,
    @required this.exporterId,
  });

  final String postmanId;
  final String name;
  final String schema;
  final String exporterId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
        exporterId: json["_exporter_id"],
      );

  Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
        "_exporter_id": exporterId,
      };
}

class AuthrequestItem {
  AuthrequestItem({
    @required this.name,
    @required this.item,
  });

  final String name;
  final List<ItemItem> item;

  factory AuthrequestItem.fromJson(Map<String, dynamic> json) =>
      AuthrequestItem(
        name: json["name"],
        item:
            List<ItemItem>.from(json["item"].map((x) => ItemItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class ItemItem {
  ItemItem({
    required this.name,
    required this.request,
    required this.response,
    required this.event,
  });

  final String name;
  final Request request;
  final List<dynamic> response;
  final List<Event> event;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        name: json["name"],
        request: Request.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
        event: json["event"] == null
            ? null
            : List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
        "event": event == null
            ? null
            : List<dynamic>.from(event.map((x) => x.toJson())),
      };
}

class Request {
  Request({
    required this.method,
    required this.header,
    required this.url,
    required this.auth,
    required this.body,
  });

  final String method;
  final List<Header> header;
  final Url url;
  final Auth auth;
  final Body body;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        method: json["method"],
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        url: Url.fromJson(json["url"]),
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "url": url.toJson(),
        "auth": auth == null ? null : auth.toJson(),
        "body": body == null ? null : body.toJson(),
      };
}

class Auth {
  Auth({
    required this.type,
    required this.bearer,
  });

  final String type;
  final List<Header> bearer;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        type: json["type"],
        bearer:
            List<Header>.from(json["bearer"].map((x) => Header.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "bearer": List<dynamic>.from(bearer.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    required this.key,
    required this.value,
    required this.type,
  });

  final String key;
  final String value;
  final String type;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": type,
      };
}

class Body {
  Body({
    required this.mode,
    required this.raw,
    required this.options,
    required this.formdata,
  });

  final String mode;
  final String raw;
  late final Options options;
  final List<Formdatum> formdata;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: json["mode"],
        raw: json["raw"] == null ? null : json["raw"],
        options:
            json["options"] == null ? null : Options.fromJson(json["options"]),
        formdata: json["formdata"] == null
            ? null
            : List<Formdatum>.from(
                json["formdata"].map((x) => Formdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "raw": raw == null ? null : raw,
        "options": options == null ? null : options.toJson(),
        "formdata": formdata == null
            ? null
            : List<dynamic>.from(formdata.map((x) => x.toJson())),
      };
}

class Formdatum {
  Formdatum({
    required this.key,
    required this.type,
    required this.src,
  });

  final String key;
  final String type;
  final String src;

  factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
        key: json["key"],
        type: json["type"],
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type,
        "src": src,
      };
}

class Options {
  Options({
    required this.raw,
  });

  final Raw raw;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        raw: Raw.fromJson(json["raw"]),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw.toJson(),
      };
}

class Raw {
  Raw({
    required this.language,
  });

  final String language;

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}

class Url {
  Url({
    required this.raw,
    required this.host,
    required this.path,
  });

  final String raw;
  final List<Host> host;
  final List<String> path;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        host: List<Host>.from(json["host"].map((x) => hostValues.map[x])),
        path: List<String>.from(json["path"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
        "path": List<dynamic>.from(path.map((x) => x)),
      };
}

enum Host { URL }

final hostValues = EnumValues({"{{URL}}": Host.URL});

class Variable {
  Variable({
    required this.key,
    required this.value,
  });

  late final String key;
  late final String value;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
*/
