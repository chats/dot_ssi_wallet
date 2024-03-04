class Connection {
  final String myDid;
  final String invitationMode;
  final String theirRole;
  final String invitaionMsgId;
  final String accept;
  final String connectionId;
  final String requestId;
  final String state;
  final String theirDid;
  final String theirLabel;
  final String connectionProtocol;
  final String rfc23State;
  final String routingState;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String invitationKey;

  Connection({
    required this.invitationMode,
    required this.theirRole,
    required this.invitaionMsgId,
    required this.accept,
    required this.requestId,
    required this.state,
    required this.connectionProtocol,
    required this.rfc23State,
    required this.routingState,
    required this.createdAt,
    required this.updatedAt,
    required this.invitationKey,
    required this.myDid,
    required this.theirDid,
    required this.theirLabel,
    required this.connectionId,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      invitationMode: json['invitation_mode'],
      theirRole: json['their_role'],
      invitaionMsgId: json['invitation_msg_id'],
      accept: json['accept'],
      requestId: json['request_id'],
      state: json['state'],
      connectionProtocol: json['connection_protocol'],
      rfc23State: json['rfc23_state'],
      routingState: json['routing_state'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      invitationKey: json['invitation_key'],
      myDid: json['my_did'],
      theirDid: json['their_did'],
      theirLabel: json['their_label'],
      connectionId: json['connection_id'],
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
