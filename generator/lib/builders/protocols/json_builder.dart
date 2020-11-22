import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

import '../builder_utils.dart';

class JsonServiceBuilder extends ServiceBuilder {
  final Api api;

  JsonServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : '@_s.required';
    return '''
  final _s.JsonProtocol _protocol;
  ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.JsonProtocol(client: client, service: ${buildServiceMetadata(api)}, region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final inputClass = operation.input?.shapeClass;

    final payloadMembers = inputClass?.members?.map((member) {
      final buffer = StringBuffer();
      if (!member.isRequired) {
        buffer.writeln('if (${member.fieldName} != null)');
      }
      final encodeCode = encodeJsonCode(member.shapeClass, member.fieldName,
          member: member, maybeNull: member.isRequired);
      final location =
          member.locationName ?? member.shapeClass.locationName ?? member.name;
      buffer.writeln("'$location': $encodeCode,");
      return '$buffer';
    })?.join();
    var payload = '';
    if (payloadMembers?.isNotEmpty == true) {
      payload = 'payload: {$payloadMembers},';
    }

    final outputClass = operation.output?.shapeClass?.className;

    buf.writeln('''
      final headers = <String, String>{
        'Content-Type': 'application/x-amz-json-${api.metadata.jsonVersion ?? '1.0'}',
        'X-Amz-Target': '${api.metadata.targetPrefix}.${operation.name}'
      };''');

    buf.writeln('''
     final jsonResponse = await _protocol.send(
        method: '${operation.http.method}',
        requestUri: '${operation.http.requestUri}',
        exceptionFnMap: _exceptionFns,
        // TODO queryParams
        headers: headers,
        $payload
''');
    buf.writeln(');\n');

    if (outputClass != null) {
      buf.writeln('return $outputClass.fromJson(jsonResponse.body);');
    }
    return '$buf';
  }
}
