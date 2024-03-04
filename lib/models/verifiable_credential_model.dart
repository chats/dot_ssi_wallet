class VerifiableCredential {
  final String referent;
  final Map<String, dynamic> attrs;
  final String schemaId;
  final String credDefId;
  final String? revRegId;
  final String? credRevId;

  VerifiableCredential({
    required this.referent,
    required this.attrs,
    required this.schemaId,
    required this.credDefId,
    required this.revRegId,
    required this.credRevId,
  });

  factory VerifiableCredential.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> attrs = {};
    json["attrs"].forEach((key, value) {
      attrs[key] = value;
    });
    return VerifiableCredential(
      referent: json['referent'],
      attrs: attrs,
      schemaId: json['schema_id'],
      credDefId: json['cred_def_id'],
      revRegId: json['revRegId'],
      credRevId: json['cred_rev_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'referent': referent,
        'schema_id': schemaId,
        'cred_def_id': credDefId,
        'rev_reg_id': revRegId,
        'cred_rev_id': credRevId,
        'attrs': attrs
      };
}
