class Connection {
  final String invitationMode;
  final String theirRole;
  final String accept;
  final String connectionId;
  final String state;
  final String connectionProtocol;
  final String rfc23State;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String invitationKey;
  final String? myDid;
  final String? invitaionMsgId;
  final String? requestId;
  final String? theirDid;
  final String? theirLabel;
  final String? routingState;
  final String? errorMsg;

  Connection({
    required this.invitationMode,
    required this.theirRole,
    required this.accept,
    required this.state,
    required this.connectionProtocol,
    required this.rfc23State,
    required this.createdAt,
    required this.updatedAt,
    required this.invitationKey,
    required this.connectionId,
    this.requestId,
    this.routingState,
    this.myDid,
    this.theirDid,
    this.theirLabel,
    this.invitaionMsgId,
    this.errorMsg,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      invitationMode: json['invitation_mode'],
      theirRole: json['their_role'],
      accept: json['accept'],
      state: json['state'],
      connectionProtocol: json['connection_protocol'],
      rfc23State: json['rfc23_state'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      invitationKey: json['invitation_key'],
      connectionId: json['connection_id'],
      //Optional fields
      invitaionMsgId: json['invitation_msg_id'] ?? "",
      requestId: json['request_id'] ?? "",
      routingState: json['routing_state'] ?? "",
      myDid: json['my_did'] ?? "",
      theirDid: json['their_did'] ?? "",
      theirLabel: json['their_label'] ?? "",
      errorMsg: json['error_msg'] ?? "",
    );
  }
}

class Invitation {
  final String connectionId;
  final Map<String, dynamic> invitation;
  final String invitationUrl;

  Invitation({
    required this.connectionId,
    required this.invitation,
    required this.invitationUrl,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      connectionId: json['connection_id'],
      invitation: json['invitation'],
      invitationUrl: json['invitation_url'],
    );
  }
}
