// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profileImageUrlMeta = const VerificationMeta(
    'profileImageUrl',
  );
  @override
  late final GeneratedColumn<String> profileImageUrl = GeneratedColumn<String>(
    'profile_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserGoalModel, String>
  longTermGoal = GeneratedColumn<String>(
    'long_term_goal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<UserGoalModel>($UsersTableTable.$converterlongTermGoal);
  @override
  late final GeneratedColumnWithTypeConverter<UserGoalModel, String> dailyGoal =
      GeneratedColumn<String>(
        'daily_goal',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UserGoalModel>($UsersTableTable.$converterdailyGoal);
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    name,
    email,
    profileImageUrl,
    age,
    gender,
    height,
    weight,
    longTermGoal,
    dailyGoal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('profile_image_url')) {
      context.handle(
        _profileImageUrlMeta,
        profileImageUrl.isAcceptableOrUnknown(
          data['profile_image_url']!,
          _profileImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {email},
  ];
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      uid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}uid'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      profileImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_image_url'],
      ),
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      longTermGoal: $UsersTableTable.$converterlongTermGoal.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}long_term_goal'],
        )!,
      ),
      dailyGoal: $UsersTableTable.$converterdailyGoal.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}daily_goal'],
        )!,
      ),
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserGoalModel, String, Map<String, Object?>>
  $converterlongTermGoal = const UserGoalTypeConverter();
  static JsonTypeConverter2<UserGoalModel, String, Map<String, Object?>>
  $converterdailyGoal = const UserGoalTypeConverter();
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final String uid;
  final String name;
  final String email;
  final String? profileImageUrl;
  final int? age;
  final String? gender;
  final double? height;
  final double? weight;
  final UserGoalModel longTermGoal;
  final UserGoalModel dailyGoal;
  const UsersTableData({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.age,
    this.gender,
    this.height,
    this.weight,
    required this.longTermGoal,
    required this.dailyGoal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || profileImageUrl != null) {
      map['profile_image_url'] = Variable<String>(profileImageUrl);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    {
      map['long_term_goal'] = Variable<String>(
        $UsersTableTable.$converterlongTermGoal.toSql(longTermGoal),
      );
    }
    {
      map['daily_goal'] = Variable<String>(
        $UsersTableTable.$converterdailyGoal.toSql(dailyGoal),
      );
    }
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      uid: Value(uid),
      name: Value(name),
      email: Value(email),
      profileImageUrl:
          profileImageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(profileImageUrl),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      longTermGoal: Value(longTermGoal),
      dailyGoal: Value(dailyGoal),
    );
  }

  factory UsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      profileImageUrl: serializer.fromJson<String?>(json['profileImageUrl']),
      age: serializer.fromJson<int?>(json['age']),
      gender: serializer.fromJson<String?>(json['gender']),
      height: serializer.fromJson<double?>(json['height']),
      weight: serializer.fromJson<double?>(json['weight']),
      longTermGoal: $UsersTableTable.$converterlongTermGoal.fromJson(
        serializer.fromJson<Map<String, Object?>>(json['longTermGoal']),
      ),
      dailyGoal: $UsersTableTable.$converterdailyGoal.fromJson(
        serializer.fromJson<Map<String, Object?>>(json['dailyGoal']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'profileImageUrl': serializer.toJson<String?>(profileImageUrl),
      'age': serializer.toJson<int?>(age),
      'gender': serializer.toJson<String?>(gender),
      'height': serializer.toJson<double?>(height),
      'weight': serializer.toJson<double?>(weight),
      'longTermGoal': serializer.toJson<Map<String, Object?>>(
        $UsersTableTable.$converterlongTermGoal.toJson(longTermGoal),
      ),
      'dailyGoal': serializer.toJson<Map<String, Object?>>(
        $UsersTableTable.$converterdailyGoal.toJson(dailyGoal),
      ),
    };
  }

  UsersTableData copyWith({
    String? uid,
    String? name,
    String? email,
    Value<String?> profileImageUrl = const Value.absent(),
    Value<int?> age = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<double?> height = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    UserGoalModel? longTermGoal,
    UserGoalModel? dailyGoal,
  }) => UsersTableData(
    uid: uid ?? this.uid,
    name: name ?? this.name,
    email: email ?? this.email,
    profileImageUrl:
        profileImageUrl.present ? profileImageUrl.value : this.profileImageUrl,
    age: age.present ? age.value : this.age,
    gender: gender.present ? gender.value : this.gender,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
    longTermGoal: longTermGoal ?? this.longTermGoal,
    dailyGoal: dailyGoal ?? this.dailyGoal,
  );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      profileImageUrl:
          data.profileImageUrl.present
              ? data.profileImageUrl.value
              : this.profileImageUrl,
      age: data.age.present ? data.age.value : this.age,
      gender: data.gender.present ? data.gender.value : this.gender,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      longTermGoal:
          data.longTermGoal.present
              ? data.longTermGoal.value
              : this.longTermGoal,
      dailyGoal: data.dailyGoal.present ? data.dailyGoal.value : this.dailyGoal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('profileImageUrl: $profileImageUrl, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('longTermGoal: $longTermGoal, ')
          ..write('dailyGoal: $dailyGoal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    name,
    email,
    profileImageUrl,
    age,
    gender,
    height,
    weight,
    longTermGoal,
    dailyGoal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.email == this.email &&
          other.profileImageUrl == this.profileImageUrl &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.longTermGoal == this.longTermGoal &&
          other.dailyGoal == this.dailyGoal);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<String> uid;
  final Value<String> name;
  final Value<String> email;
  final Value<String?> profileImageUrl;
  final Value<int?> age;
  final Value<String?> gender;
  final Value<double?> height;
  final Value<double?> weight;
  final Value<UserGoalModel> longTermGoal;
  final Value<UserGoalModel> dailyGoal;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.profileImageUrl = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.longTermGoal = const Value.absent(),
    this.dailyGoal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String uid,
    required String name,
    required String email,
    this.profileImageUrl = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    required UserGoalModel longTermGoal,
    required UserGoalModel dailyGoal,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       name = Value(name),
       email = Value(email),
       longTermGoal = Value(longTermGoal),
       dailyGoal = Value(dailyGoal);
  static Insertable<UsersTableData> custom({
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? profileImageUrl,
    Expression<int>? age,
    Expression<String>? gender,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<String>? longTermGoal,
    Expression<String>? dailyGoal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (profileImageUrl != null) 'profile_image_url': profileImageUrl,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (longTermGoal != null) 'long_term_goal': longTermGoal,
      if (dailyGoal != null) 'daily_goal': dailyGoal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith({
    Value<String>? uid,
    Value<String>? name,
    Value<String>? email,
    Value<String?>? profileImageUrl,
    Value<int?>? age,
    Value<String?>? gender,
    Value<double?>? height,
    Value<double?>? weight,
    Value<UserGoalModel>? longTermGoal,
    Value<UserGoalModel>? dailyGoal,
    Value<int>? rowid,
  }) {
    return UsersTableCompanion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      longTermGoal: longTermGoal ?? this.longTermGoal,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (profileImageUrl.present) {
      map['profile_image_url'] = Variable<String>(profileImageUrl.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (longTermGoal.present) {
      map['long_term_goal'] = Variable<String>(
        $UsersTableTable.$converterlongTermGoal.toSql(longTermGoal.value),
      );
    }
    if (dailyGoal.present) {
      map['daily_goal'] = Variable<String>(
        $UsersTableTable.$converterdailyGoal.toSql(dailyGoal.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('profileImageUrl: $profileImageUrl, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('longTermGoal: $longTermGoal, ')
          ..write('dailyGoal: $dailyGoal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTableTable extends ExercisesTable
    with TableInfo<$ExercisesTableTable, ExercisesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ExerciseType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ExerciseType>($ExercisesTableTable.$convertertype);
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    type,
    duration,
    repetitions,
    calories,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExercisesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExercisesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisesTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      type: $ExercisesTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      ),
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $ExercisesTableTable createAlias(String alias) {
    return $ExercisesTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ExerciseType, String> $convertertype =
      const ExerciseTypeConverter();
}

class ExercisesTableData extends DataClass
    implements Insertable<ExercisesTableData> {
  final int id;
  final int userId;
  final String name;
  final ExerciseType type;
  final int? duration;
  final int? repetitions;
  final double? calories;
  final DateTime createdAt;
  const ExercisesTableData({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    this.duration,
    this.repetitions,
    this.calories,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>(
        $ExercisesTableTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || repetitions != null) {
      map['repetitions'] = Variable<int>(repetitions);
    }
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double>(calories);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExercisesTableCompanion toCompanion(bool nullToAbsent) {
    return ExercisesTableCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      type: Value(type),
      duration:
          duration == null && nullToAbsent
              ? const Value.absent()
              : Value(duration),
      repetitions:
          repetitions == null && nullToAbsent
              ? const Value.absent()
              : Value(repetitions),
      calories:
          calories == null && nullToAbsent
              ? const Value.absent()
              : Value(calories),
      createdAt: Value(createdAt),
    );
  }

  factory ExercisesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisesTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<ExerciseType>(json['type']),
      duration: serializer.fromJson<int?>(json['duration']),
      repetitions: serializer.fromJson<int?>(json['repetitions']),
      calories: serializer.fromJson<double?>(json['calories']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<ExerciseType>(type),
      'duration': serializer.toJson<int?>(duration),
      'repetitions': serializer.toJson<int?>(repetitions),
      'calories': serializer.toJson<double?>(calories),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExercisesTableData copyWith({
    int? id,
    int? userId,
    String? name,
    ExerciseType? type,
    Value<int?> duration = const Value.absent(),
    Value<int?> repetitions = const Value.absent(),
    Value<double?> calories = const Value.absent(),
    DateTime? createdAt,
  }) => ExercisesTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    type: type ?? this.type,
    duration: duration.present ? duration.value : this.duration,
    repetitions: repetitions.present ? repetitions.value : this.repetitions,
    calories: calories.present ? calories.value : this.calories,
    createdAt: createdAt ?? this.createdAt,
  );
  ExercisesTableData copyWithCompanion(ExercisesTableCompanion data) {
    return ExercisesTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      duration: data.duration.present ? data.duration.value : this.duration,
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
      calories: data.calories.present ? data.calories.value : this.calories,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('duration: $duration, ')
          ..write('repetitions: $repetitions, ')
          ..write('calories: $calories, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    type,
    duration,
    repetitions,
    calories,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisesTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.type == this.type &&
          other.duration == this.duration &&
          other.repetitions == this.repetitions &&
          other.calories == this.calories &&
          other.createdAt == this.createdAt);
}

class ExercisesTableCompanion extends UpdateCompanion<ExercisesTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<ExerciseType> type;
  final Value<int?> duration;
  final Value<int?> repetitions;
  final Value<double?> calories;
  final Value<DateTime> createdAt;
  const ExercisesTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.duration = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.calories = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExercisesTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required ExerciseType type,
    this.duration = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.calories = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name),
       type = Value(type);
  static Insertable<ExercisesTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? duration,
    Expression<int>? repetitions,
    Expression<double>? calories,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (duration != null) 'duration': duration,
      if (repetitions != null) 'repetitions': repetitions,
      if (calories != null) 'calories': calories,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExercisesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? name,
    Value<ExerciseType>? type,
    Value<int?>? duration,
    Value<int?>? repetitions,
    Value<double?>? calories,
    Value<DateTime>? createdAt,
  }) {
    return ExercisesTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      type: type ?? this.type,
      duration: duration ?? this.duration,
      repetitions: repetitions ?? this.repetitions,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ExercisesTableTable.$convertertype.toSql(type.value),
      );
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('duration: $duration, ')
          ..write('repetitions: $repetitions, ')
          ..write('calories: $calories, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ActivityHistoryTableTable extends ActivityHistoryTable
    with TableInfo<$ActivityHistoryTableTable, ActivityHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
    'exercise_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    exerciseId,
    source,
    date,
    duration,
    steps,
    distance,
    calories,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityHistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityHistoryTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityHistoryTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_id'],
          )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_id'],
      ),
      source:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}source'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      ),
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      ),
      calories:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}calories'],
          )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ActivityHistoryTableTable createAlias(String alias) {
    return $ActivityHistoryTableTable(attachedDatabase, alias);
  }
}

class ActivityHistoryTableData extends DataClass
    implements Insertable<ActivityHistoryTableData> {
  final int id;
  final int userId;
  final int? exerciseId;
  final String source;
  final DateTime date;
  final int? duration;
  final int? steps;
  final double? distance;
  final double calories;
  final String? notes;
  const ActivityHistoryTableData({
    required this.id,
    required this.userId,
    this.exerciseId,
    required this.source,
    required this.date,
    this.duration,
    this.steps,
    this.distance,
    required this.calories,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || exerciseId != null) {
      map['exercise_id'] = Variable<int>(exerciseId);
    }
    map['source'] = Variable<String>(source);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || steps != null) {
      map['steps'] = Variable<int>(steps);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<double>(distance);
    }
    map['calories'] = Variable<double>(calories);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ActivityHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityHistoryTableCompanion(
      id: Value(id),
      userId: Value(userId),
      exerciseId:
          exerciseId == null && nullToAbsent
              ? const Value.absent()
              : Value(exerciseId),
      source: Value(source),
      date: Value(date),
      duration:
          duration == null && nullToAbsent
              ? const Value.absent()
              : Value(duration),
      steps:
          steps == null && nullToAbsent ? const Value.absent() : Value(steps),
      distance:
          distance == null && nullToAbsent
              ? const Value.absent()
              : Value(distance),
      calories: Value(calories),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory ActivityHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      exerciseId: serializer.fromJson<int?>(json['exerciseId']),
      source: serializer.fromJson<String>(json['source']),
      date: serializer.fromJson<DateTime>(json['date']),
      duration: serializer.fromJson<int?>(json['duration']),
      steps: serializer.fromJson<int?>(json['steps']),
      distance: serializer.fromJson<double?>(json['distance']),
      calories: serializer.fromJson<double>(json['calories']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'exerciseId': serializer.toJson<int?>(exerciseId),
      'source': serializer.toJson<String>(source),
      'date': serializer.toJson<DateTime>(date),
      'duration': serializer.toJson<int?>(duration),
      'steps': serializer.toJson<int?>(steps),
      'distance': serializer.toJson<double?>(distance),
      'calories': serializer.toJson<double>(calories),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ActivityHistoryTableData copyWith({
    int? id,
    int? userId,
    Value<int?> exerciseId = const Value.absent(),
    String? source,
    DateTime? date,
    Value<int?> duration = const Value.absent(),
    Value<int?> steps = const Value.absent(),
    Value<double?> distance = const Value.absent(),
    double? calories,
    Value<String?> notes = const Value.absent(),
  }) => ActivityHistoryTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    exerciseId: exerciseId.present ? exerciseId.value : this.exerciseId,
    source: source ?? this.source,
    date: date ?? this.date,
    duration: duration.present ? duration.value : this.duration,
    steps: steps.present ? steps.value : this.steps,
    distance: distance.present ? distance.value : this.distance,
    calories: calories ?? this.calories,
    notes: notes.present ? notes.value : this.notes,
  );
  ActivityHistoryTableData copyWithCompanion(
    ActivityHistoryTableCompanion data,
  ) {
    return ActivityHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      source: data.source.present ? data.source.value : this.source,
      date: data.date.present ? data.date.value : this.date,
      duration: data.duration.present ? data.duration.value : this.duration,
      steps: data.steps.present ? data.steps.value : this.steps,
      distance: data.distance.present ? data.distance.value : this.distance,
      calories: data.calories.present ? data.calories.value : this.calories,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityHistoryTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('source: $source, ')
          ..write('date: $date, ')
          ..write('duration: $duration, ')
          ..write('steps: $steps, ')
          ..write('distance: $distance, ')
          ..write('calories: $calories, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    exerciseId,
    source,
    date,
    duration,
    steps,
    distance,
    calories,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityHistoryTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exerciseId == this.exerciseId &&
          other.source == this.source &&
          other.date == this.date &&
          other.duration == this.duration &&
          other.steps == this.steps &&
          other.distance == this.distance &&
          other.calories == this.calories &&
          other.notes == this.notes);
}

class ActivityHistoryTableCompanion
    extends UpdateCompanion<ActivityHistoryTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int?> exerciseId;
  final Value<String> source;
  final Value<DateTime> date;
  final Value<int?> duration;
  final Value<int?> steps;
  final Value<double?> distance;
  final Value<double> calories;
  final Value<String?> notes;
  const ActivityHistoryTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.source = const Value.absent(),
    this.date = const Value.absent(),
    this.duration = const Value.absent(),
    this.steps = const Value.absent(),
    this.distance = const Value.absent(),
    this.calories = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ActivityHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.exerciseId = const Value.absent(),
    required String source,
    required DateTime date,
    this.duration = const Value.absent(),
    this.steps = const Value.absent(),
    this.distance = const Value.absent(),
    required double calories,
    this.notes = const Value.absent(),
  }) : userId = Value(userId),
       source = Value(source),
       date = Value(date),
       calories = Value(calories);
  static Insertable<ActivityHistoryTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? exerciseId,
    Expression<String>? source,
    Expression<DateTime>? date,
    Expression<int>? duration,
    Expression<int>? steps,
    Expression<double>? distance,
    Expression<double>? calories,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (source != null) 'source': source,
      if (date != null) 'date': date,
      if (duration != null) 'duration': duration,
      if (steps != null) 'steps': steps,
      if (distance != null) 'distance': distance,
      if (calories != null) 'calories': calories,
      if (notes != null) 'notes': notes,
    });
  }

  ActivityHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int?>? exerciseId,
    Value<String>? source,
    Value<DateTime>? date,
    Value<int?>? duration,
    Value<int?>? steps,
    Value<double?>? distance,
    Value<double>? calories,
    Value<String?>? notes,
  }) {
    return ActivityHistoryTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exerciseId: exerciseId ?? this.exerciseId,
      source: source ?? this.source,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      steps: steps ?? this.steps,
      distance: distance ?? this.distance,
      calories: calories ?? this.calories,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('source: $source, ')
          ..write('date: $date, ')
          ..write('duration: $duration, ')
          ..write('steps: $steps, ')
          ..write('distance: $distance, ')
          ..write('calories: $calories, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $ExercisesTableTable exercisesTable = $ExercisesTableTable(this);
  late final $ActivityHistoryTableTable activityHistoryTable =
      $ActivityHistoryTableTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final ActivityHistoryDao activityHistoryDao = ActivityHistoryDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usersTable,
    exercisesTable,
    activityHistoryTable,
  ];
}

typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      required String uid,
      required String name,
      required String email,
      Value<String?> profileImageUrl,
      Value<int?> age,
      Value<String?> gender,
      Value<double?> height,
      Value<double?> weight,
      required UserGoalModel longTermGoal,
      required UserGoalModel dailyGoal,
      Value<int> rowid,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<String> uid,
      Value<String> name,
      Value<String> email,
      Value<String?> profileImageUrl,
      Value<int?> age,
      Value<String?> gender,
      Value<double?> height,
      Value<double?> weight,
      Value<UserGoalModel> longTermGoal,
      Value<UserGoalModel> dailyGoal,
      Value<int> rowid,
    });

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileImageUrl => $composableBuilder(
    column: $table.profileImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserGoalModel, UserGoalModel, String>
  get longTermGoal => $composableBuilder(
    column: $table.longTermGoal,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<UserGoalModel, UserGoalModel, String>
  get dailyGoal => $composableBuilder(
    column: $table.dailyGoal,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileImageUrl => $composableBuilder(
    column: $table.profileImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get longTermGoal => $composableBuilder(
    column: $table.longTermGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dailyGoal => $composableBuilder(
    column: $table.dailyGoal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get profileImageUrl => $composableBuilder(
    column: $table.profileImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserGoalModel, String> get longTermGoal =>
      $composableBuilder(
        column: $table.longTermGoal,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<UserGoalModel, String> get dailyGoal =>
      $composableBuilder(column: $table.dailyGoal, builder: (column) => column);
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTableTable,
          UsersTableData,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (
            UsersTableData,
            BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>,
          ),
          UsersTableData,
          PrefetchHooks Function()
        > {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> profileImageUrl = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<UserGoalModel> longTermGoal = const Value.absent(),
                Value<UserGoalModel> dailyGoal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersTableCompanion(
                uid: uid,
                name: name,
                email: email,
                profileImageUrl: profileImageUrl,
                age: age,
                gender: gender,
                height: height,
                weight: weight,
                longTermGoal: longTermGoal,
                dailyGoal: dailyGoal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String name,
                required String email,
                Value<String?> profileImageUrl = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                required UserGoalModel longTermGoal,
                required UserGoalModel dailyGoal,
                Value<int> rowid = const Value.absent(),
              }) => UsersTableCompanion.insert(
                uid: uid,
                name: name,
                email: email,
                profileImageUrl: profileImageUrl,
                age: age,
                gender: gender,
                height: height,
                weight: weight,
                longTermGoal: longTermGoal,
                dailyGoal: dailyGoal,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTableTable,
      UsersTableData,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (
        UsersTableData,
        BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>,
      ),
      UsersTableData,
      PrefetchHooks Function()
    >;
typedef $$ExercisesTableTableCreateCompanionBuilder =
    ExercisesTableCompanion Function({
      Value<int> id,
      required int userId,
      required String name,
      required ExerciseType type,
      Value<int?> duration,
      Value<int?> repetitions,
      Value<double?> calories,
      Value<DateTime> createdAt,
    });
typedef $$ExercisesTableTableUpdateCompanionBuilder =
    ExercisesTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> name,
      Value<ExerciseType> type,
      Value<int?> duration,
      Value<int?> repetitions,
      Value<double?> calories,
      Value<DateTime> createdAt,
    });

class $$ExercisesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ExerciseType, ExerciseType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExercisesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ExerciseType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExercisesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTableTable,
          ExercisesTableData,
          $$ExercisesTableTableFilterComposer,
          $$ExercisesTableTableOrderingComposer,
          $$ExercisesTableTableAnnotationComposer,
          $$ExercisesTableTableCreateCompanionBuilder,
          $$ExercisesTableTableUpdateCompanionBuilder,
          (
            ExercisesTableData,
            BaseReferences<
              _$AppDatabase,
              $ExercisesTableTable,
              ExercisesTableData
            >,
          ),
          ExercisesTableData,
          PrefetchHooks Function()
        > {
  $$ExercisesTableTableTableManager(
    _$AppDatabase db,
    $ExercisesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ExercisesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ExercisesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ExercisesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<ExerciseType> type = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int?> repetitions = const Value.absent(),
                Value<double?> calories = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExercisesTableCompanion(
                id: id,
                userId: userId,
                name: name,
                type: type,
                duration: duration,
                repetitions: repetitions,
                calories: calories,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String name,
                required ExerciseType type,
                Value<int?> duration = const Value.absent(),
                Value<int?> repetitions = const Value.absent(),
                Value<double?> calories = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExercisesTableCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                type: type,
                duration: duration,
                repetitions: repetitions,
                calories: calories,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExercisesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTableTable,
      ExercisesTableData,
      $$ExercisesTableTableFilterComposer,
      $$ExercisesTableTableOrderingComposer,
      $$ExercisesTableTableAnnotationComposer,
      $$ExercisesTableTableCreateCompanionBuilder,
      $$ExercisesTableTableUpdateCompanionBuilder,
      (
        ExercisesTableData,
        BaseReferences<_$AppDatabase, $ExercisesTableTable, ExercisesTableData>,
      ),
      ExercisesTableData,
      PrefetchHooks Function()
    >;
typedef $$ActivityHistoryTableTableCreateCompanionBuilder =
    ActivityHistoryTableCompanion Function({
      Value<int> id,
      required int userId,
      Value<int?> exerciseId,
      required String source,
      required DateTime date,
      Value<int?> duration,
      Value<int?> steps,
      Value<double?> distance,
      required double calories,
      Value<String?> notes,
    });
typedef $$ActivityHistoryTableTableUpdateCompanionBuilder =
    ActivityHistoryTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int?> exerciseId,
      Value<String> source,
      Value<DateTime> date,
      Value<int?> duration,
      Value<int?> steps,
      Value<double?> distance,
      Value<double> calories,
      Value<String?> notes,
    });

class $$ActivityHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityHistoryTableTable> {
  $$ActivityHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityHistoryTableTable> {
  $$ActivityHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityHistoryTableTable> {
  $$ActivityHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ActivityHistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityHistoryTableTable,
          ActivityHistoryTableData,
          $$ActivityHistoryTableTableFilterComposer,
          $$ActivityHistoryTableTableOrderingComposer,
          $$ActivityHistoryTableTableAnnotationComposer,
          $$ActivityHistoryTableTableCreateCompanionBuilder,
          $$ActivityHistoryTableTableUpdateCompanionBuilder,
          (
            ActivityHistoryTableData,
            BaseReferences<
              _$AppDatabase,
              $ActivityHistoryTableTable,
              ActivityHistoryTableData
            >,
          ),
          ActivityHistoryTableData,
          PrefetchHooks Function()
        > {
  $$ActivityHistoryTableTableTableManager(
    _$AppDatabase db,
    $ActivityHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ActivityHistoryTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ActivityHistoryTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ActivityHistoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int?> exerciseId = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int?> steps = const Value.absent(),
                Value<double?> distance = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ActivityHistoryTableCompanion(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                source: source,
                date: date,
                duration: duration,
                steps: steps,
                distance: distance,
                calories: calories,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                Value<int?> exerciseId = const Value.absent(),
                required String source,
                required DateTime date,
                Value<int?> duration = const Value.absent(),
                Value<int?> steps = const Value.absent(),
                Value<double?> distance = const Value.absent(),
                required double calories,
                Value<String?> notes = const Value.absent(),
              }) => ActivityHistoryTableCompanion.insert(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                source: source,
                date: date,
                duration: duration,
                steps: steps,
                distance: distance,
                calories: calories,
                notes: notes,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityHistoryTableTable,
      ActivityHistoryTableData,
      $$ActivityHistoryTableTableFilterComposer,
      $$ActivityHistoryTableTableOrderingComposer,
      $$ActivityHistoryTableTableAnnotationComposer,
      $$ActivityHistoryTableTableCreateCompanionBuilder,
      $$ActivityHistoryTableTableUpdateCompanionBuilder,
      (
        ActivityHistoryTableData,
        BaseReferences<
          _$AppDatabase,
          $ActivityHistoryTableTable,
          ActivityHistoryTableData
        >,
      ),
      ActivityHistoryTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$ExercisesTableTableTableManager get exercisesTable =>
      $$ExercisesTableTableTableManager(_db, _db.exercisesTable);
  $$ActivityHistoryTableTableTableManager get activityHistoryTable =>
      $$ActivityHistoryTableTableTableManager(_db, _db.activityHistoryTable);
}
