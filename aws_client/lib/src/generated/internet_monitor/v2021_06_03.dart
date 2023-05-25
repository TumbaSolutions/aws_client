// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon CloudWatch Internet Monitor provides visibility into how internet
/// issues impact the performance and availability between your applications
/// hosted on Amazon Web Services and your end users. It reduces the time it
/// takes for you to diagnose internet issues from days to minutes. Internet
/// Monitor uses the connectivity data that Amazon Web Services captures from
/// its global networking footprint to calculate a baseline of performance and
/// availability for internet traffic. This is the same data that Amazon Web
/// Services uses to monitor internet uptime and availability. With those
/// measurements as a baseline, Internet Monitor raises awareness for you when
/// there are significant problems for your end users in the different
/// geographic locations where your application runs.
///
/// Internet Monitor publishes internet measurements to CloudWatch Logs and
/// CloudWatch Metrics, to easily support using CloudWatch tools with health
/// information for geographies and networks specific to your application.
/// Internet Monitor sends health events to Amazon EventBridge so that you can
/// set up notifications. If an issue is caused by the Amazon Web Services
/// network, you also automatically receive an Amazon Web Services Health
/// Dashboard notification with the steps that Amazon Web Services is taking to
/// mitigate the problem.
///
/// To use Internet Monitor, you create a <i>monitor</i> and associate your
/// application's resources with it, VPCs, CloudFront distributions, or
/// WorkSpaces directories, to enable Internet Monitor to know where your
/// application's internet traffic is. Internet Monitor then provides internet
/// measurements from Amazon Web Services that are specific to the locations and
/// networks that communicate with your application.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-InternetMonitor.html">Using
/// Amazon CloudWatch Internet Monitor</a> in the <i>Amazon CloudWatch User
/// Guide</i>.
class CloudWatchInternetMonitor {
  final _s.RestJsonProtocol _protocol;
  CloudWatchInternetMonitor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'internetmonitor',
            signingName: 'internetmonitor',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a monitor in Amazon CloudWatch Internet Monitor. A monitor is
  /// built based on information from the application resources that you add:
  /// Amazon Virtual Private Clouds (VPCs), Amazon CloudFront distributions, and
  /// WorkSpaces directories. Internet Monitor then publishes internet
  /// measurements from Amazon Web Services that are specific to the
  /// <i>city-networks</i>, that is, the locations and ASNs (typically internet
  /// service providers or ISPs), where clients access your application. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-InternetMonitor.html">Using
  /// Amazon CloudWatch Internet Monitor</a> in the <i>Amazon CloudWatch User
  /// Guide</i>.
  ///
  /// When you create a monitor, you set a maximum limit for the number of
  /// city-networks where client traffic is monitored. The city-network maximum
  /// that you choose is the limit, but you only pay for the number of
  /// city-networks that are actually monitored. You can change the maximum at
  /// any time by updating your monitor. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing
  /// a city-network maximum value</a> in the <i>Amazon CloudWatch User
  /// Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters that you
  /// specify to make an idempotent API request. Don't reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [internetMeasurementsLogDelivery] :
  /// Publish internet measurements for Internet Monitor to an Amazon S3 bucket
  /// in addition to CloudWatch Logs.
  ///
  /// Parameter [maxCityNetworksToMonitor] :
  /// The maximum number of city-networks to monitor for your resources. A
  /// city-network is the location (city) where clients access your application
  /// resources from and the network or ASN, such as an internet service
  /// provider (ISP), that clients access the resources through. This limit
  /// helps control billing costs.
  ///
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing
  /// a city-network maximum value </a> in the Amazon CloudWatch Internet
  /// Monitor section of the <i>CloudWatch User Guide</i>.
  ///
  /// Parameter [resources] :
  /// The resources to include in a monitor, which you provide as a set of
  /// Amazon Resource Names (ARNs).
  ///
  /// You can add a combination of Amazon Virtual Private Clouds (VPCs) and
  /// Amazon CloudFront distributions, or you can add Amazon WorkSpaces
  /// directories. You can't add all three types of resources.
  /// <note>
  /// If you add only VPC resources, at least one VPC must have an Internet
  /// Gateway attached to it, to make sure that it has internet connectivity.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags for a monitor. You can add a maximum of 50 tags in Internet
  /// Monitor.
  ///
  /// Parameter [trafficPercentageToMonitor] :
  /// The percentage of the internet-facing traffic for your application that
  /// you want to monitor with this monitor.
  Future<CreateMonitorOutput> createMonitor({
    required String monitorName,
    String? clientToken,
    InternetMeasurementsLogDelivery? internetMeasurementsLogDelivery,
    int? maxCityNetworksToMonitor,
    List<String>? resources,
    Map<String, String>? tags,
    int? trafficPercentageToMonitor,
  }) async {
    _s.validateNumRange(
      'maxCityNetworksToMonitor',
      maxCityNetworksToMonitor,
      1,
      500000,
    );
    _s.validateNumRange(
      'trafficPercentageToMonitor',
      trafficPercentageToMonitor,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'MonitorName': monitorName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (internetMeasurementsLogDelivery != null)
        'InternetMeasurementsLogDelivery': internetMeasurementsLogDelivery,
      if (maxCityNetworksToMonitor != null)
        'MaxCityNetworksToMonitor': maxCityNetworksToMonitor,
      if (resources != null) 'Resources': resources,
      if (tags != null) 'Tags': tags,
      if (trafficPercentageToMonitor != null)
        'TrafficPercentageToMonitor': trafficPercentageToMonitor,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v20210603/Monitors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMonitorOutput.fromJson(response);
  }

  /// Deletes a monitor in Amazon CloudWatch Internet Monitor.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor to delete.
  Future<void> deleteMonitor({
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v20210603/Monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information the Amazon CloudWatch Internet Monitor has created and
  /// stored about a health event for a specified monitor. This information
  /// includes the impacted locations, and all of the information related to the
  /// event by location.
  ///
  /// The information returned includes the performance, availability, and
  /// round-trip time impact, information about the network providers, the event
  /// type, and so on.
  ///
  /// Information rolled up at the global traffic level is also returned,
  /// including the impact type and total traffic impact.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventId] :
  /// The internally generated identifier of a health event. Because
  /// <code>EventID</code> contains the forward slash (“/”) character, you must
  /// URL-encode the <code>EventID</code> field in the request URL.
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  Future<GetHealthEventOutput> getHealthEvent({
    required String eventId,
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20210603/Monitors/${Uri.encodeComponent(monitorName)}/HealthEvents/${Uri.encodeComponent(eventId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetHealthEventOutput.fromJson(response);
  }

  /// Gets information about a monitor in Amazon CloudWatch Internet Monitor
  /// based on a monitor name. The information returned includes the Amazon
  /// Resource Name (ARN), create time, modified time, resources included in the
  /// monitor, and status information.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  Future<GetMonitorOutput> getMonitor({
    required String monitorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v20210603/Monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMonitorOutput.fromJson(response);
  }

  /// Lists all health events for a monitor in Amazon CloudWatch Internet
  /// Monitor. Returns all information for health events including the client
  /// location information the network cause and status, event start and end
  /// time, percentage of total traffic impacted, and status.
  /// <note>
  /// Health events that have start times during the time frame that is
  /// requested are not included in the list of health events.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [endTime] :
  /// The time when a health event ended. If the health event is still ongoing,
  /// then the end time is not set.
  ///
  /// Parameter [eventStatus] :
  /// The status of a health event.
  ///
  /// Parameter [maxResults] :
  /// The number of health event objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  ///
  /// Parameter [startTime] :
  /// The time when a health event started.
  Future<ListHealthEventsOutput> listHealthEvents({
    required String monitorName,
    DateTime? endTime,
    HealthEventStatus? eventStatus,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'EndTime': [_s.iso8601ToJson(endTime).toString()],
      if (eventStatus != null) 'EventStatus': [eventStatus.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (startTime != null)
        'StartTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20210603/Monitors/${Uri.encodeComponent(monitorName)}/HealthEvents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHealthEventsOutput.fromJson(response);
  }

  /// Lists all of your monitors for Amazon CloudWatch Internet Monitor and
  /// their statuses, along with the Amazon Resource Name (ARN) and name of each
  /// monitor.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The number of monitor objects that you want to return with this call.
  ///
  /// Parameter [monitorStatus] :
  /// The status of a monitor. This includes the status of the data processing
  /// for the monitor and the status of the monitor itself.
  ///
  /// For information about the statuses for a monitor, see <a
  /// href="https://docs.aws.amazon.com/internet-monitor/latest/api/API_Monitor.html">
  /// Monitor</a>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListMonitorsOutput> listMonitors({
    int? maxResults,
    String? monitorStatus,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (monitorStatus != null) 'MonitorStatus': [monitorStatus],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v20210603/Monitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMonitorsOutput.fromJson(response);
  }

  /// Lists the tags for a resource. Tags are supported only for monitors in
  /// Amazon CloudWatch Internet Monitor.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a resource.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Adds a tag to a resource. Tags are supported only for monitors in Amazon
  /// CloudWatch Internet Monitor. You can add a maximum of 50 tags in Internet
  /// Monitor.
  ///
  /// A minimum of one tag is required for this call. It returns an error if you
  /// use the <code>TagResource</code> request with 0 tags.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a tag that you add to a resource. Tags
  /// are supported only for monitors in Amazon CloudWatch Internet Monitor.
  ///
  /// Parameter [tags] :
  /// Tags that you add to a resource. You can add a maximum of 50 tags in
  /// Internet Monitor.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from a resource.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a tag you remove a resource from.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys that you remove from a resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a monitor. You can update a monitor to change the maximum number
  /// of city-networks (locations and ASNs or internet service providers), to
  /// add or remove resources, or to change the status of the monitor. Note that
  /// you can't change the name of a monitor.
  ///
  /// The city-network maximum that you choose is the limit, but you only pay
  /// for the number of city-networks that are actually monitored. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing
  /// a city-network maximum value</a> in the <i>Amazon CloudWatch User
  /// Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorName] :
  /// The name of the monitor.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive string of up to 64 ASCII characters that you
  /// specify to make an idempotent API request. You should not reuse the same
  /// client token for other API requests.
  ///
  /// Parameter [internetMeasurementsLogDelivery] :
  /// Publish internet measurements for Internet Monitor to another location,
  /// such as an Amazon S3 bucket. The measurements are also published to Amazon
  /// CloudWatch Logs.
  ///
  /// Parameter [maxCityNetworksToMonitor] :
  /// The maximum number of city-networks to monitor for your resources. A
  /// city-network is the location (city) where clients access your application
  /// resources from and the network or ASN, such as an internet service
  /// provider, that clients access the resources through.
  ///
  /// Parameter [resourcesToAdd] :
  /// The resources to include in a monitor, which you provide as a set of
  /// Amazon Resource Names (ARNs).
  ///
  /// You can add a combination of Amazon Virtual Private Clouds (VPCs) and
  /// Amazon CloudFront distributions, or you can add Amazon WorkSpaces
  /// directories. You can't add all three types of resources.
  /// <note>
  /// If you add only VPC resources, at least one VPC must have an Internet
  /// Gateway attached to it, to make sure that it has internet connectivity.
  /// </note>
  ///
  /// Parameter [resourcesToRemove] :
  /// The resources to remove from a monitor, which you provide as a set of
  /// Amazon Resource Names (ARNs).
  ///
  /// Parameter [status] :
  /// The status for a monitor. The accepted values for <code>Status</code> with
  /// the <code>UpdateMonitor</code> API call are the following:
  /// <code>ACTIVE</code> and <code>INACTIVE</code>. The following values are
  /// <i>not</i> accepted: <code>PENDING</code>, and <code>ERROR</code>.
  ///
  /// Parameter [trafficPercentageToMonitor] :
  /// The percentage of the internet-facing traffic for your application that
  /// you want to monitor with this monitor.
  Future<UpdateMonitorOutput> updateMonitor({
    required String monitorName,
    String? clientToken,
    InternetMeasurementsLogDelivery? internetMeasurementsLogDelivery,
    int? maxCityNetworksToMonitor,
    List<String>? resourcesToAdd,
    List<String>? resourcesToRemove,
    MonitorConfigState? status,
    int? trafficPercentageToMonitor,
  }) async {
    _s.validateNumRange(
      'maxCityNetworksToMonitor',
      maxCityNetworksToMonitor,
      1,
      500000,
    );
    _s.validateNumRange(
      'trafficPercentageToMonitor',
      trafficPercentageToMonitor,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (internetMeasurementsLogDelivery != null)
        'InternetMeasurementsLogDelivery': internetMeasurementsLogDelivery,
      if (maxCityNetworksToMonitor != null)
        'MaxCityNetworksToMonitor': maxCityNetworksToMonitor,
      if (resourcesToAdd != null) 'ResourcesToAdd': resourcesToAdd,
      if (resourcesToRemove != null) 'ResourcesToRemove': resourcesToRemove,
      if (status != null) 'Status': status.toValue(),
      if (trafficPercentageToMonitor != null)
        'TrafficPercentageToMonitor': trafficPercentageToMonitor,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v20210603/Monitors/${Uri.encodeComponent(monitorName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMonitorOutput.fromJson(response);
  }
}

/// Measurements about the availability for your application on the internet,
/// calculated by Amazon CloudWatch Internet Monitor. Amazon Web Services has
/// substantial historical data about internet performance and availability
/// between Amazon Web Services services and different network providers and
/// geographies. By applying statistical analysis to the data, Internet Monitor
/// can detect when the performance and availability for your application has
/// dropped, compared to an estimated baseline that's already calculated. To
/// make it easier to see those drops, we report that information to you in the
/// form of health scores: a performance score and an availability score.
///
/// Availability in Internet Monitor represents the estimated percentage of
/// traffic that is not seeing an availability drop. For example, an
/// availability score of 99% for an end user and service location pair is
/// equivalent to 1% of the traffic experiencing an availability drop for that
/// pair.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How
/// Internet Monitor calculates performance and availability scores</a> in the
/// Amazon CloudWatch Internet Monitor section of the <i>Amazon CloudWatch User
/// Guide</i>.
class AvailabilityMeasurement {
  /// Experience scores, or health scores are calculated for different geographic
  /// and network provider combinations (that is, different granularities) and
  /// also summed into global scores. If you view performance or availability
  /// scores without filtering for any specific geography or service provider,
  /// Amazon CloudWatch Internet Monitor provides global health scores.
  ///
  /// The Amazon CloudWatch Internet Monitor chapter in the <i>CloudWatch User
  /// Guide</i> includes detailed information about how Internet Monitor
  /// calculates health scores, including performance and availability scores, and
  /// when it creates and resolves health events. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How
  /// Amazon Web Services calculates performance and availability scores</a> in
  /// the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User
  /// Guide</i>.
  final double? experienceScore;

  /// The percentage of impact caused by a health event for client location
  /// traffic globally.
  ///
  /// For information about how Internet Monitor calculates impact, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html">Inside
  /// Internet Monitor</a> in the Amazon CloudWatch Internet Monitor section of
  /// the Amazon CloudWatch User Guide.
  final double? percentOfClientLocationImpacted;

  /// The percentage of impact caused by a health event for total traffic
  /// globally.
  ///
  /// For information about how Internet Monitor calculates impact, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html">Inside
  /// Internet Monitor</a> in the Amazon CloudWatch Internet Monitor section of
  /// the Amazon CloudWatch User Guide.
  final double? percentOfTotalTrafficImpacted;

  AvailabilityMeasurement({
    this.experienceScore,
    this.percentOfClientLocationImpacted,
    this.percentOfTotalTrafficImpacted,
  });

  factory AvailabilityMeasurement.fromJson(Map<String, dynamic> json) {
    return AvailabilityMeasurement(
      experienceScore: json['ExperienceScore'] as double?,
      percentOfClientLocationImpacted:
          json['PercentOfClientLocationImpacted'] as double?,
      percentOfTotalTrafficImpacted:
          json['PercentOfTotalTrafficImpacted'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final experienceScore = this.experienceScore;
    final percentOfClientLocationImpacted =
        this.percentOfClientLocationImpacted;
    final percentOfTotalTrafficImpacted = this.percentOfTotalTrafficImpacted;
    return {
      if (experienceScore != null) 'ExperienceScore': experienceScore,
      if (percentOfClientLocationImpacted != null)
        'PercentOfClientLocationImpacted': percentOfClientLocationImpacted,
      if (percentOfTotalTrafficImpacted != null)
        'PercentOfTotalTrafficImpacted': percentOfTotalTrafficImpacted,
    };
  }
}

class CreateMonitorOutput {
  /// The Amazon Resource Name (ARN) of the monitor.
  final String arn;

  /// The status of a monitor.
  final MonitorConfigState status;

  CreateMonitorOutput({
    required this.arn,
    required this.status,
  });

  factory CreateMonitorOutput.fromJson(Map<String, dynamic> json) {
    return CreateMonitorOutput(
      arn: json['Arn'] as String,
      status: (json['Status'] as String).toMonitorConfigState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    return {
      'Arn': arn,
      'Status': status.toValue(),
    };
  }
}

class DeleteMonitorOutput {
  DeleteMonitorOutput();

  factory DeleteMonitorOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMonitorOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetHealthEventOutput {
  /// The Amazon Resource Name (ARN) of the event.
  final String eventArn;

  /// The internally generated identifier of a health event.
  final String eventId;

  /// The type of impairment of a specific health event.
  final HealthEventImpactType impactType;

  /// The locations affected by a health event.
  final List<ImpactedLocation> impactedLocations;

  /// The time when a health event was last updated or recalculated.
  final DateTime lastUpdatedAt;

  /// The time when a health event started.
  final DateTime startedAt;

  /// The status of a health event.
  final HealthEventStatus status;

  /// The time when a health event was created.
  final DateTime? createdAt;

  /// The time when a health event was resolved. If the health event is still
  /// active, the end time is not set.
  final DateTime? endedAt;

  /// The impact on total traffic that a health event has.
  final double? percentOfTotalTrafficImpacted;

  GetHealthEventOutput({
    required this.eventArn,
    required this.eventId,
    required this.impactType,
    required this.impactedLocations,
    required this.lastUpdatedAt,
    required this.startedAt,
    required this.status,
    this.createdAt,
    this.endedAt,
    this.percentOfTotalTrafficImpacted,
  });

  factory GetHealthEventOutput.fromJson(Map<String, dynamic> json) {
    return GetHealthEventOutput(
      eventArn: json['EventArn'] as String,
      eventId: json['EventId'] as String,
      impactType: (json['ImpactType'] as String).toHealthEventImpactType(),
      impactedLocations: (json['ImpactedLocations'] as List)
          .whereNotNull()
          .map((e) => ImpactedLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] as Object),
      status: (json['Status'] as String).toHealthEventStatus(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      endedAt: timeStampFromJson(json['EndedAt']),
      percentOfTotalTrafficImpacted:
          json['PercentOfTotalTrafficImpacted'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventArn = this.eventArn;
    final eventId = this.eventId;
    final impactType = this.impactType;
    final impactedLocations = this.impactedLocations;
    final lastUpdatedAt = this.lastUpdatedAt;
    final startedAt = this.startedAt;
    final status = this.status;
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final percentOfTotalTrafficImpacted = this.percentOfTotalTrafficImpacted;
    return {
      'EventArn': eventArn,
      'EventId': eventId,
      'ImpactType': impactType.toValue(),
      'ImpactedLocations': impactedLocations,
      'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'StartedAt': iso8601ToJson(startedAt),
      'Status': status.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (percentOfTotalTrafficImpacted != null)
        'PercentOfTotalTrafficImpacted': percentOfTotalTrafficImpacted,
    };
  }
}

class GetMonitorOutput {
  /// The time when the monitor was created.
  final DateTime createdAt;

  /// The last time that the monitor was modified.
  final DateTime modifiedAt;

  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The resources that have been added for the monitor. Resources are listed by
  /// their Amazon Resource Names (ARNs).
  final List<String> resources;

  /// The status of the monitor.
  final MonitorConfigState status;

  /// Publish internet measurements for Internet Monitor to another location, such
  /// as an Amazon S3 bucket. The measurements are also published to Amazon
  /// CloudWatch Logs.
  final InternetMeasurementsLogDelivery? internetMeasurementsLogDelivery;

  /// The maximum number of city-networks to monitor for your resources. A
  /// city-network is the location (city) where clients access your application
  /// resources from and the network or ASN, such as an internet service provider
  /// (ISP), that clients access the resources through. This limit helps control
  /// billing costs.
  ///
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing
  /// a city-network maximum value </a> in the Amazon CloudWatch Internet Monitor
  /// section of the <i>CloudWatch User Guide</i>.
  final int? maxCityNetworksToMonitor;

  /// The health of the data processing for the monitor.
  final MonitorProcessingStatusCode? processingStatus;

  /// Additional information about the health of the data processing for the
  /// monitor.
  final String? processingStatusInfo;

  /// The tags that have been added to monitor.
  final Map<String, String>? tags;

  /// The percentage of the internet-facing traffic for your application that you
  /// want to monitor with this monitor.
  final int? trafficPercentageToMonitor;

  GetMonitorOutput({
    required this.createdAt,
    required this.modifiedAt,
    required this.monitorArn,
    required this.monitorName,
    required this.resources,
    required this.status,
    this.internetMeasurementsLogDelivery,
    this.maxCityNetworksToMonitor,
    this.processingStatus,
    this.processingStatusInfo,
    this.tags,
    this.trafficPercentageToMonitor,
  });

  factory GetMonitorOutput.fromJson(Map<String, dynamic> json) {
    return GetMonitorOutput(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      monitorArn: json['MonitorArn'] as String,
      monitorName: json['MonitorName'] as String,
      resources: (json['Resources'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String).toMonitorConfigState(),
      internetMeasurementsLogDelivery:
          json['InternetMeasurementsLogDelivery'] != null
              ? InternetMeasurementsLogDelivery.fromJson(
                  json['InternetMeasurementsLogDelivery']
                      as Map<String, dynamic>)
              : null,
      maxCityNetworksToMonitor: json['MaxCityNetworksToMonitor'] as int?,
      processingStatus: (json['ProcessingStatus'] as String?)
          ?.toMonitorProcessingStatusCode(),
      processingStatusInfo: json['ProcessingStatusInfo'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trafficPercentageToMonitor: json['TrafficPercentageToMonitor'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final resources = this.resources;
    final status = this.status;
    final internetMeasurementsLogDelivery =
        this.internetMeasurementsLogDelivery;
    final maxCityNetworksToMonitor = this.maxCityNetworksToMonitor;
    final processingStatus = this.processingStatus;
    final processingStatusInfo = this.processingStatusInfo;
    final tags = this.tags;
    final trafficPercentageToMonitor = this.trafficPercentageToMonitor;
    return {
      'CreatedAt': iso8601ToJson(createdAt),
      'ModifiedAt': iso8601ToJson(modifiedAt),
      'MonitorArn': monitorArn,
      'MonitorName': monitorName,
      'Resources': resources,
      'Status': status.toValue(),
      if (internetMeasurementsLogDelivery != null)
        'InternetMeasurementsLogDelivery': internetMeasurementsLogDelivery,
      if (maxCityNetworksToMonitor != null)
        'MaxCityNetworksToMonitor': maxCityNetworksToMonitor,
      if (processingStatus != null)
        'ProcessingStatus': processingStatus.toValue(),
      if (processingStatusInfo != null)
        'ProcessingStatusInfo': processingStatusInfo,
      if (tags != null) 'Tags': tags,
      if (trafficPercentageToMonitor != null)
        'TrafficPercentageToMonitor': trafficPercentageToMonitor,
    };
  }
}

/// Information about a health event created in a monitor in Amazon CloudWatch
/// Internet Monitor.
class HealthEvent {
  /// The Amazon Resource Name (ARN) of the event.
  final String eventArn;

  /// The internally generated identifier of a specific network traffic impairment
  /// health event.
  final String eventId;

  /// The type of impairment for a health event.
  final HealthEventImpactType impactType;

  /// The locations impacted by the health event.
  final List<ImpactedLocation> impactedLocations;

  /// When the health event was last updated.
  final DateTime lastUpdatedAt;

  /// When a health event started.
  final DateTime startedAt;

  /// Health event list member.
  final HealthEventStatus status;

  /// When the health event was created.
  final DateTime? createdAt;

  /// The time when a health event ended. If the health event is still active,
  /// then the end time is not set.
  final DateTime? endedAt;

  /// The impact on global traffic monitored by this monitor for this health
  /// event.
  final double? percentOfTotalTrafficImpacted;

  HealthEvent({
    required this.eventArn,
    required this.eventId,
    required this.impactType,
    required this.impactedLocations,
    required this.lastUpdatedAt,
    required this.startedAt,
    required this.status,
    this.createdAt,
    this.endedAt,
    this.percentOfTotalTrafficImpacted,
  });

  factory HealthEvent.fromJson(Map<String, dynamic> json) {
    return HealthEvent(
      eventArn: json['EventArn'] as String,
      eventId: json['EventId'] as String,
      impactType: (json['ImpactType'] as String).toHealthEventImpactType(),
      impactedLocations: (json['ImpactedLocations'] as List)
          .whereNotNull()
          .map((e) => ImpactedLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] as Object),
      status: (json['Status'] as String).toHealthEventStatus(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      endedAt: timeStampFromJson(json['EndedAt']),
      percentOfTotalTrafficImpacted:
          json['PercentOfTotalTrafficImpacted'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventArn = this.eventArn;
    final eventId = this.eventId;
    final impactType = this.impactType;
    final impactedLocations = this.impactedLocations;
    final lastUpdatedAt = this.lastUpdatedAt;
    final startedAt = this.startedAt;
    final status = this.status;
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final percentOfTotalTrafficImpacted = this.percentOfTotalTrafficImpacted;
    return {
      'EventArn': eventArn,
      'EventId': eventId,
      'ImpactType': impactType.toValue(),
      'ImpactedLocations': impactedLocations,
      'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'StartedAt': iso8601ToJson(startedAt),
      'Status': status.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (percentOfTotalTrafficImpacted != null)
        'PercentOfTotalTrafficImpacted': percentOfTotalTrafficImpacted,
    };
  }
}

enum HealthEventImpactType {
  availability,
  performance,
}

extension HealthEventImpactTypeValueExtension on HealthEventImpactType {
  String toValue() {
    switch (this) {
      case HealthEventImpactType.availability:
        return 'AVAILABILITY';
      case HealthEventImpactType.performance:
        return 'PERFORMANCE';
    }
  }
}

extension HealthEventImpactTypeFromString on String {
  HealthEventImpactType toHealthEventImpactType() {
    switch (this) {
      case 'AVAILABILITY':
        return HealthEventImpactType.availability;
      case 'PERFORMANCE':
        return HealthEventImpactType.performance;
    }
    throw Exception('$this is not known in enum HealthEventImpactType');
  }
}

enum HealthEventStatus {
  active,
  resolved,
}

extension HealthEventStatusValueExtension on HealthEventStatus {
  String toValue() {
    switch (this) {
      case HealthEventStatus.active:
        return 'ACTIVE';
      case HealthEventStatus.resolved:
        return 'RESOLVED';
    }
  }
}

extension HealthEventStatusFromString on String {
  HealthEventStatus toHealthEventStatus() {
    switch (this) {
      case 'ACTIVE':
        return HealthEventStatus.active;
      case 'RESOLVED':
        return HealthEventStatus.resolved;
    }
    throw Exception('$this is not known in enum HealthEventStatus');
  }
}

/// Information about a location impacted by a health event in Amazon CloudWatch
/// Internet Monitor.
///
/// Geographic regions are hierarchically categorized into country, subdivision,
/// metro and city geographic granularities. The geographic region is identified
/// based on the IP address used at the client locations.
class ImpactedLocation {
  /// The name of the network at an impacted location.
  final String aSName;

  /// The Autonomous System Number (ASN) of the network at an impacted location.
  final int aSNumber;

  /// The name of the country where the health event is located.
  final String country;

  /// The status of the health event at an impacted location.
  final HealthEventStatus status;

  /// The cause of the impairment. There are two types of network impairments:
  /// Amazon Web Services network issues or internet issues. Internet issues are
  /// typically a problem with a network provider, like an internet service
  /// provider (ISP).
  final NetworkImpairment? causedBy;

  /// The name of the city where the health event is located.
  final String? city;

  /// The country code where the health event is located. The ISO 3166-2 codes for
  /// the country is provided, when available.
  final String? countryCode;

  /// The calculated health at a specific location.
  final InternetHealth? internetHealth;

  /// The latitude where the health event is located.
  final double? latitude;

  /// The longitude where the health event is located.
  final double? longitude;

  /// The metro area where the health event is located.
  ///
  /// Metro indicates a metropolitan region in the United States, such as the
  /// region around New York City. In non-US countries, this is a second-level
  /// subdivision. For example, in the United Kingdom, it could be a county, a
  /// London borough, a unitary authority, council area, and so on.
  final String? metro;

  /// The service location where the health event is located.
  final String? serviceLocation;

  /// The subdivision location where the health event is located. The subdivision
  /// usually maps to states in most countries (including the United States). For
  /// United Kingdom, it maps to a country (England, Scotland, Wales) or province
  /// (Northern Ireland).
  final String? subdivision;

  /// The subdivision code where the health event is located. The ISO 3166-2 codes
  /// for country subdivisions is provided, when available.
  final String? subdivisionCode;

  ImpactedLocation({
    required this.aSName,
    required this.aSNumber,
    required this.country,
    required this.status,
    this.causedBy,
    this.city,
    this.countryCode,
    this.internetHealth,
    this.latitude,
    this.longitude,
    this.metro,
    this.serviceLocation,
    this.subdivision,
    this.subdivisionCode,
  });

  factory ImpactedLocation.fromJson(Map<String, dynamic> json) {
    return ImpactedLocation(
      aSName: json['ASName'] as String,
      aSNumber: json['ASNumber'] as int,
      country: json['Country'] as String,
      status: (json['Status'] as String).toHealthEventStatus(),
      causedBy: json['CausedBy'] != null
          ? NetworkImpairment.fromJson(json['CausedBy'] as Map<String, dynamic>)
          : null,
      city: json['City'] as String?,
      countryCode: json['CountryCode'] as String?,
      internetHealth: json['InternetHealth'] != null
          ? InternetHealth.fromJson(
              json['InternetHealth'] as Map<String, dynamic>)
          : null,
      latitude: json['Latitude'] as double?,
      longitude: json['Longitude'] as double?,
      metro: json['Metro'] as String?,
      serviceLocation: json['ServiceLocation'] as String?,
      subdivision: json['Subdivision'] as String?,
      subdivisionCode: json['SubdivisionCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aSName = this.aSName;
    final aSNumber = this.aSNumber;
    final country = this.country;
    final status = this.status;
    final causedBy = this.causedBy;
    final city = this.city;
    final countryCode = this.countryCode;
    final internetHealth = this.internetHealth;
    final latitude = this.latitude;
    final longitude = this.longitude;
    final metro = this.metro;
    final serviceLocation = this.serviceLocation;
    final subdivision = this.subdivision;
    final subdivisionCode = this.subdivisionCode;
    return {
      'ASName': aSName,
      'ASNumber': aSNumber,
      'Country': country,
      'Status': status.toValue(),
      if (causedBy != null) 'CausedBy': causedBy,
      if (city != null) 'City': city,
      if (countryCode != null) 'CountryCode': countryCode,
      if (internetHealth != null) 'InternetHealth': internetHealth,
      if (latitude != null) 'Latitude': latitude,
      if (longitude != null) 'Longitude': longitude,
      if (metro != null) 'Metro': metro,
      if (serviceLocation != null) 'ServiceLocation': serviceLocation,
      if (subdivision != null) 'Subdivision': subdivision,
      if (subdivisionCode != null) 'SubdivisionCode': subdivisionCode,
    };
  }
}

/// Internet health includes measurements calculated by Amazon CloudWatch
/// Internet Monitor about the performance and availability for your application
/// on the internet. Amazon Web Services has substantial historical data about
/// internet performance and availability between Amazon Web Services services
/// and different network providers and geographies. By applying statistical
/// analysis to the data, Internet Monitor can detect when the performance and
/// availability for your application has dropped, compared to an estimated
/// baseline that's already calculated. To make it easier to see those drops, we
/// report that information to you in the form of health scores: a performance
/// score and an availability score.
class InternetHealth {
  /// Availability in Internet Monitor represents the estimated percentage of
  /// traffic that is not seeing an availability drop. For example, an
  /// availability score of 99% for an end user and service location pair is
  /// equivalent to 1% of the traffic experiencing an availability drop for that
  /// pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How
  /// Internet Monitor calculates performance and availability scores</a> in the
  /// Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User
  /// Guide</i>.
  final AvailabilityMeasurement? availability;

  /// Performance in Internet Monitor represents the estimated percentage of
  /// traffic that is not seeing a performance drop. For example, a performance
  /// score of 99% for an end user and service location pair is equivalent to 1%
  /// of the traffic experiencing a performance drop for that pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How
  /// Internet Monitor calculates performance and availability scores</a> in the
  /// Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User
  /// Guide</i>.
  final PerformanceMeasurement? performance;

  InternetHealth({
    this.availability,
    this.performance,
  });

  factory InternetHealth.fromJson(Map<String, dynamic> json) {
    return InternetHealth(
      availability: json['Availability'] != null
          ? AvailabilityMeasurement.fromJson(
              json['Availability'] as Map<String, dynamic>)
          : null,
      performance: json['Performance'] != null
          ? PerformanceMeasurement.fromJson(
              json['Performance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final availability = this.availability;
    final performance = this.performance;
    return {
      if (availability != null) 'Availability': availability,
      if (performance != null) 'Performance': performance,
    };
  }
}

/// Publish internet measurements to an Amazon S3 bucket in addition to
/// CloudWatch Logs.
class InternetMeasurementsLogDelivery {
  /// The configuration information for publishing Internet Monitor internet
  /// measurements to Amazon S3. The configuration includes the bucket name and
  /// (optionally) prefix for the S3 bucket to store the measurements, and the
  /// delivery status. The delivery status is <code>ENABLED</code> or
  /// <code>DISABLED</code>, depending on whether you choose to deliver internet
  /// measurements to S3 logs.
  final S3Config? s3Config;

  InternetMeasurementsLogDelivery({
    this.s3Config,
  });

  factory InternetMeasurementsLogDelivery.fromJson(Map<String, dynamic> json) {
    return InternetMeasurementsLogDelivery(
      s3Config: json['S3Config'] != null
          ? S3Config.fromJson(json['S3Config'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Config = this.s3Config;
    return {
      if (s3Config != null) 'S3Config': s3Config,
    };
  }
}

class ListHealthEventsOutput {
  /// A list of health events.
  final List<HealthEvent> healthEvents;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  ListHealthEventsOutput({
    required this.healthEvents,
    this.nextToken,
  });

  factory ListHealthEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListHealthEventsOutput(
      healthEvents: (json['HealthEvents'] as List)
          .whereNotNull()
          .map((e) => HealthEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthEvents = this.healthEvents;
    final nextToken = this.nextToken;
    return {
      'HealthEvents': healthEvents,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMonitorsOutput {
  /// A list of monitors.
  final List<Monitor> monitors;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  ListMonitorsOutput({
    required this.monitors,
    this.nextToken,
  });

  factory ListMonitorsOutput.fromJson(Map<String, dynamic> json) {
    return ListMonitorsOutput(
      monitors: (json['Monitors'] as List)
          .whereNotNull()
          .map((e) => Monitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitors = this.monitors;
    final nextToken = this.nextToken;
    return {
      'Monitors': monitors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// Tags for a resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum LogDeliveryStatus {
  enabled,
  disabled,
}

extension LogDeliveryStatusValueExtension on LogDeliveryStatus {
  String toValue() {
    switch (this) {
      case LogDeliveryStatus.enabled:
        return 'ENABLED';
      case LogDeliveryStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension LogDeliveryStatusFromString on String {
  LogDeliveryStatus toLogDeliveryStatus() {
    switch (this) {
      case 'ENABLED':
        return LogDeliveryStatus.enabled;
      case 'DISABLED':
        return LogDeliveryStatus.disabled;
    }
    throw Exception('$this is not known in enum LogDeliveryStatus');
  }
}

/// The description of and information about a monitor in Amazon CloudWatch
/// Internet Monitor.
class Monitor {
  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The name of the monitor.
  final String monitorName;

  /// The status of a monitor.
  final MonitorConfigState status;

  /// The health of data processing for the monitor.
  final MonitorProcessingStatusCode? processingStatus;

  Monitor({
    required this.monitorArn,
    required this.monitorName,
    required this.status,
    this.processingStatus,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      monitorArn: json['MonitorArn'] as String,
      monitorName: json['MonitorName'] as String,
      status: (json['Status'] as String).toMonitorConfigState(),
      processingStatus: (json['ProcessingStatus'] as String?)
          ?.toMonitorProcessingStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final monitorName = this.monitorName;
    final status = this.status;
    final processingStatus = this.processingStatus;
    return {
      'MonitorArn': monitorArn,
      'MonitorName': monitorName,
      'Status': status.toValue(),
      if (processingStatus != null)
        'ProcessingStatus': processingStatus.toValue(),
    };
  }
}

enum MonitorConfigState {
  pending,
  active,
  inactive,
  error,
}

extension MonitorConfigStateValueExtension on MonitorConfigState {
  String toValue() {
    switch (this) {
      case MonitorConfigState.pending:
        return 'PENDING';
      case MonitorConfigState.active:
        return 'ACTIVE';
      case MonitorConfigState.inactive:
        return 'INACTIVE';
      case MonitorConfigState.error:
        return 'ERROR';
    }
  }
}

extension MonitorConfigStateFromString on String {
  MonitorConfigState toMonitorConfigState() {
    switch (this) {
      case 'PENDING':
        return MonitorConfigState.pending;
      case 'ACTIVE':
        return MonitorConfigState.active;
      case 'INACTIVE':
        return MonitorConfigState.inactive;
      case 'ERROR':
        return MonitorConfigState.error;
    }
    throw Exception('$this is not known in enum MonitorConfigState');
  }
}

enum MonitorProcessingStatusCode {
  ok,
  inactive,
  collectingData,
  insufficientData,
  faultService,
  faultAccessCloudwatch,
}

extension MonitorProcessingStatusCodeValueExtension
    on MonitorProcessingStatusCode {
  String toValue() {
    switch (this) {
      case MonitorProcessingStatusCode.ok:
        return 'OK';
      case MonitorProcessingStatusCode.inactive:
        return 'INACTIVE';
      case MonitorProcessingStatusCode.collectingData:
        return 'COLLECTING_DATA';
      case MonitorProcessingStatusCode.insufficientData:
        return 'INSUFFICIENT_DATA';
      case MonitorProcessingStatusCode.faultService:
        return 'FAULT_SERVICE';
      case MonitorProcessingStatusCode.faultAccessCloudwatch:
        return 'FAULT_ACCESS_CLOUDWATCH';
    }
  }
}

extension MonitorProcessingStatusCodeFromString on String {
  MonitorProcessingStatusCode toMonitorProcessingStatusCode() {
    switch (this) {
      case 'OK':
        return MonitorProcessingStatusCode.ok;
      case 'INACTIVE':
        return MonitorProcessingStatusCode.inactive;
      case 'COLLECTING_DATA':
        return MonitorProcessingStatusCode.collectingData;
      case 'INSUFFICIENT_DATA':
        return MonitorProcessingStatusCode.insufficientData;
      case 'FAULT_SERVICE':
        return MonitorProcessingStatusCode.faultService;
      case 'FAULT_ACCESS_CLOUDWATCH':
        return MonitorProcessingStatusCode.faultAccessCloudwatch;
    }
    throw Exception('$this is not known in enum MonitorProcessingStatusCode');
  }
}

/// An internet service provider (ISP) or network in Amazon CloudWatch Internet
/// Monitor.
class Network {
  /// The internet provider name or network name.
  final String aSName;

  /// The Autonomous System Number (ASN) of the internet provider or network.
  final int aSNumber;

  Network({
    required this.aSName,
    required this.aSNumber,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      aSName: json['ASName'] as String,
      aSNumber: json['ASNumber'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final aSName = this.aSName;
    final aSNumber = this.aSNumber;
    return {
      'ASName': aSName,
      'ASNumber': aSNumber,
    };
  }
}

/// Information about the network impairment for a specific network measured by
/// Amazon CloudWatch Internet Monitor.
class NetworkImpairment {
  /// The combination of the Autonomous System Number (ASN) of the network and the
  /// name of the network.
  final List<Network> asPath;

  /// Type of network impairment.
  final TriangulationEventType networkEventType;

  /// The networks that could be impacted by a network impairment event.
  final List<Network> networks;

  NetworkImpairment({
    required this.asPath,
    required this.networkEventType,
    required this.networks,
  });

  factory NetworkImpairment.fromJson(Map<String, dynamic> json) {
    return NetworkImpairment(
      asPath: (json['AsPath'] as List)
          .whereNotNull()
          .map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkEventType:
          (json['NetworkEventType'] as String).toTriangulationEventType(),
      networks: (json['Networks'] as List)
          .whereNotNull()
          .map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final asPath = this.asPath;
    final networkEventType = this.networkEventType;
    final networks = this.networks;
    return {
      'AsPath': asPath,
      'NetworkEventType': networkEventType.toValue(),
      'Networks': networks,
    };
  }
}

/// Measurements about the performance for your application on the internet
/// calculated by Amazon CloudWatch Internet Monitor. Amazon Web Services has
/// substantial historical data about internet performance and availability
/// between Amazon Web Services services and different network providers and
/// geographies. By applying statistical analysis to the data, Internet Monitor
/// can detect when the performance and availability for your application has
/// dropped, compared to an estimated baseline that's already calculated. To
/// make it easier to see those drops, we report that information to you in the
/// form of health scores: a performance score and an availability score.
///
/// Performance in Internet Monitor represents the estimated percentage of
/// traffic that is not seeing a performance drop. For example, a performance
/// score of 99% for an end user and service location pair is equivalent to 1%
/// of the traffic experiencing a performance drop for that pair.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How
/// Internet Monitor calculates performance and availability scores</a> in the
/// Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User
/// Guide</i>.
class PerformanceMeasurement {
  /// Experience scores, or health scores, are calculated for different geographic
  /// and network provider combinations (that is, different granularities) and
  /// also totaled into global scores. If you view performance or availability
  /// scores without filtering for any specific geography or service provider,
  /// Amazon CloudWatch Internet Monitor provides global health scores.
  ///
  /// The Amazon CloudWatch Internet Monitor chapter in the CloudWatch User Guide
  /// includes detailed information about how Internet Monitor calculates health
  /// scores, including performance and availability scores, and when it creates
  /// and resolves health events. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How
  /// Amazon Web Services calculates performance and availability scores</a> in
  /// the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User
  /// Guide</i>.
  final double? experienceScore;

  /// How much performance impact was caused by a health event at a client
  /// location. For performance, this is the percentage of how much latency
  /// increased during the event compared to typical performance for traffic, from
  /// this client location to an Amazon Web Services location, using a specific
  /// client network.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMHealthEventStartStop">When
  /// Amazon Web Services creates and resolves health events</a> in the Amazon
  /// CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.
  final double? percentOfClientLocationImpacted;

  /// How much performance impact was caused by a health event for total traffic
  /// globally. For performance, this is the percentage of how much latency
  /// increased during the event compared to typical performance for your
  /// application traffic globally.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMHealthEventStartStop">When
  /// Amazon Web Services creates and resolves health events</a> in the Amazon
  /// CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.
  final double? percentOfTotalTrafficImpacted;

  /// This is the percentage of how much round-trip time increased during the
  /// event compared to typical round-trip time for your application for traffic.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMHealthEventStartStop">When
  /// Amazon Web Services creates and resolves health events</a> in the Amazon
  /// CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.
  final RoundTripTime? roundTripTime;

  PerformanceMeasurement({
    this.experienceScore,
    this.percentOfClientLocationImpacted,
    this.percentOfTotalTrafficImpacted,
    this.roundTripTime,
  });

  factory PerformanceMeasurement.fromJson(Map<String, dynamic> json) {
    return PerformanceMeasurement(
      experienceScore: json['ExperienceScore'] as double?,
      percentOfClientLocationImpacted:
          json['PercentOfClientLocationImpacted'] as double?,
      percentOfTotalTrafficImpacted:
          json['PercentOfTotalTrafficImpacted'] as double?,
      roundTripTime: json['RoundTripTime'] != null
          ? RoundTripTime.fromJson(
              json['RoundTripTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experienceScore = this.experienceScore;
    final percentOfClientLocationImpacted =
        this.percentOfClientLocationImpacted;
    final percentOfTotalTrafficImpacted = this.percentOfTotalTrafficImpacted;
    final roundTripTime = this.roundTripTime;
    return {
      if (experienceScore != null) 'ExperienceScore': experienceScore,
      if (percentOfClientLocationImpacted != null)
        'PercentOfClientLocationImpacted': percentOfClientLocationImpacted,
      if (percentOfTotalTrafficImpacted != null)
        'PercentOfTotalTrafficImpacted': percentOfTotalTrafficImpacted,
      if (roundTripTime != null) 'RoundTripTime': roundTripTime,
    };
  }
}

/// Round-trip time (RTT) is how long it takes for a request from the user to
/// return a response to the user. Amazon CloudWatch Internet Monitor calculates
/// RTT at different percentiles: p50, p90, and p95.
class RoundTripTime {
  /// RTT at the 50th percentile (p50).
  final double? p50;

  /// RTT at the 90th percentile (p90).
  final double? p90;

  /// RTT at the 95th percentile (p95).
  final double? p95;

  RoundTripTime({
    this.p50,
    this.p90,
    this.p95,
  });

  factory RoundTripTime.fromJson(Map<String, dynamic> json) {
    return RoundTripTime(
      p50: json['P50'] as double?,
      p90: json['P90'] as double?,
      p95: json['P95'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final p50 = this.p50;
    final p90 = this.p90;
    final p95 = this.p95;
    return {
      if (p50 != null) 'P50': p50,
      if (p90 != null) 'P90': p90,
      if (p95 != null) 'P95': p95,
    };
  }
}

/// The configuration for publishing Amazon CloudWatch Internet Monitor internet
/// measurements to Amazon S3. The configuration includes the bucket name and
/// (optionally) prefix for the S3 bucket to store the measurements, and the
/// delivery status. The delivery status is <code>ENABLED</code> or
/// <code>DISABLED</code>, depending on whether you choose to deliver internet
/// measurements to S3 logs.
class S3Config {
  /// The Amazon S3 bucket name.
  final String? bucketName;

  /// The Amazon S3 bucket prefix.
  final String? bucketPrefix;

  /// The status of publishing Internet Monitor internet measurements to an Amazon
  /// S3 bucket.
  final LogDeliveryStatus? logDeliveryStatus;

  S3Config({
    this.bucketName,
    this.bucketPrefix,
    this.logDeliveryStatus,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      bucketName: json['BucketName'] as String?,
      bucketPrefix: json['BucketPrefix'] as String?,
      logDeliveryStatus:
          (json['LogDeliveryStatus'] as String?)?.toLogDeliveryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    final logDeliveryStatus = this.logDeliveryStatus;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (bucketPrefix != null) 'BucketPrefix': bucketPrefix,
      if (logDeliveryStatus != null)
        'LogDeliveryStatus': logDeliveryStatus.toValue(),
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TriangulationEventType {
  aws,
  internet,
}

extension TriangulationEventTypeValueExtension on TriangulationEventType {
  String toValue() {
    switch (this) {
      case TriangulationEventType.aws:
        return 'AWS';
      case TriangulationEventType.internet:
        return 'Internet';
    }
  }
}

extension TriangulationEventTypeFromString on String {
  TriangulationEventType toTriangulationEventType() {
    switch (this) {
      case 'AWS':
        return TriangulationEventType.aws;
      case 'Internet':
        return TriangulationEventType.internet;
    }
    throw Exception('$this is not known in enum TriangulationEventType');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMonitorOutput {
  /// The Amazon Resource Name (ARN) of the monitor.
  final String monitorArn;

  /// The status of a monitor.
  final MonitorConfigState status;

  UpdateMonitorOutput({
    required this.monitorArn,
    required this.status,
  });

  factory UpdateMonitorOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMonitorOutput(
      monitorArn: json['MonitorArn'] as String,
      status: (json['Status'] as String).toMonitorConfigState(),
    );
  }

  Map<String, dynamic> toJson() {
    final monitorArn = this.monitorArn;
    final status = this.status;
    return {
      'MonitorArn': monitorArn,
      'Status': status.toValue(),
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
