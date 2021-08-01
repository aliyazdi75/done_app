// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Reservation> _$reservationSerializer = new _$ReservationSerializer();
Serializer<Budgets> _$budgetsSerializer = new _$BudgetsSerializer();
Serializer<Budget> _$budgetSerializer = new _$BudgetSerializer();

class _$ReservationSerializer implements StructuredSerializer<Reservation> {
  @override
  final Iterable<Type> types = const [Reservation, _$Reservation];
  @override
  final String wireName = 'Reservation';

  @override
  Iterable<Object?> serialize(Serializers serializers, Reservation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'budget',
      serializers.serialize(object.budget,
          specifiedType: const FullType(Budget)),
    ];

    return result;
  }

  @override
  Reservation deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'budget':
          result.budget.replace(serializers.deserialize(value,
              specifiedType: const FullType(Budget))! as Budget);
          break;
      }
    }

    return result.build();
  }
}

class _$BudgetsSerializer implements StructuredSerializer<Budgets> {
  @override
  final Iterable<Type> types = const [Budgets, _$Budgets];
  @override
  final String wireName = 'Budgets';

  @override
  Iterable<Object?> serialize(Serializers serializers, Budgets object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'budgets',
      serializers.serialize(object.budgets,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Budget)])),
    ];

    return result;
  }

  @override
  Budgets deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BudgetsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'budgets':
          result.budgets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Budget)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$BudgetSerializer implements StructuredSerializer<Budget> {
  @override
  final Iterable<Type> types = const [Budget, _$Budget];
  @override
  final String wireName = 'Budget';

  @override
  Iterable<Object?> serialize(Serializers serializers, Budget object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Budget deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BudgetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Reservation extends Reservation {
  @override
  final String name;
  @override
  final Budget budget;

  factory _$Reservation([void Function(ReservationBuilder)? updates]) =>
      (new ReservationBuilder()..update(updates)).build();

  _$Reservation._({required this.name, required this.budget}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Reservation', 'name');
    BuiltValueNullFieldError.checkNotNull(budget, 'Reservation', 'budget');
  }

  @override
  Reservation rebuild(void Function(ReservationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservationBuilder toBuilder() => new ReservationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reservation && name == other.name && budget == other.budget;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), budget.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Reservation')
          ..add('name', name)
          ..add('budget', budget))
        .toString();
  }
}

class ReservationBuilder implements Builder<Reservation, ReservationBuilder> {
  _$Reservation? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  BudgetBuilder? _budget;
  BudgetBuilder get budget => _$this._budget ??= new BudgetBuilder();
  set budget(BudgetBuilder? budget) => _$this._budget = budget;

  ReservationBuilder();

  ReservationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _budget = $v.budget.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reservation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Reservation;
  }

  @override
  void update(void Function(ReservationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Reservation build() {
    _$Reservation _$result;
    try {
      _$result = _$v ??
          new _$Reservation._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'Reservation', 'name'),
              budget: budget.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'budget';
        budget.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Reservation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Budgets extends Budgets {
  @override
  final BuiltList<Budget> budgets;

  factory _$Budgets([void Function(BudgetsBuilder)? updates]) =>
      (new BudgetsBuilder()..update(updates)).build();

  _$Budgets._({required this.budgets}) : super._() {
    BuiltValueNullFieldError.checkNotNull(budgets, 'Budgets', 'budgets');
  }

  @override
  Budgets rebuild(void Function(BudgetsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BudgetsBuilder toBuilder() => new BudgetsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Budgets && budgets == other.budgets;
  }

  @override
  int get hashCode {
    return $jf($jc(0, budgets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Budgets')..add('budgets', budgets))
        .toString();
  }
}

class BudgetsBuilder implements Builder<Budgets, BudgetsBuilder> {
  _$Budgets? _$v;

  ListBuilder<Budget>? _budgets;
  ListBuilder<Budget> get budgets =>
      _$this._budgets ??= new ListBuilder<Budget>();
  set budgets(ListBuilder<Budget>? budgets) => _$this._budgets = budgets;

  BudgetsBuilder();

  BudgetsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _budgets = $v.budgets.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Budgets other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Budgets;
  }

  @override
  void update(void Function(BudgetsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Budgets build() {
    _$Budgets _$result;
    try {
      _$result = _$v ?? new _$Budgets._(budgets: budgets.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'budgets';
        budgets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Budgets', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Budget extends Budget {
  @override
  final int? minimum;
  @override
  final int? maximum;

  factory _$Budget([void Function(BudgetBuilder)? updates]) =>
      (new BudgetBuilder()..update(updates)).build();

  _$Budget._({this.minimum, this.maximum}) : super._();

  @override
  Budget rebuild(void Function(BudgetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BudgetBuilder toBuilder() => new BudgetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Budget &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Budget')
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class BudgetBuilder implements Builder<Budget, BudgetBuilder> {
  _$Budget? _$v;

  int? _minimum;
  int? get minimum => _$this._minimum;
  set minimum(int? minimum) => _$this._minimum = minimum;

  int? _maximum;
  int? get maximum => _$this._maximum;
  set maximum(int? maximum) => _$this._maximum = maximum;

  BudgetBuilder();

  BudgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _minimum = $v.minimum;
      _maximum = $v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Budget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Budget;
  }

  @override
  void update(void Function(BudgetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Budget build() {
    final _$result = _$v ?? new _$Budget._(minimum: minimum, maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
