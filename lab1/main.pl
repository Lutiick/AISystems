% mount and blade 2 troops

% fracions
fraction(vlandia).
fraction(sturgia).
fraction(khuzait).
fraction(imperia).
fraction(battania).
fraction(aserai).

% types
type(melee).
type(archer).
type(cavalry).
type(archer_cavalry).


% unit (troop_name, type, fraction, parent)
troop(vlandian_recruit).
troop(vlandian_levy_crossbowman).
troop(vlandian_footman).
troop(vlandian_crossbowman).
troop(vlandian_spearman).
troop(vlandian_infantry).
troop(vlandian_hardened_crossbowman).
troop(vlandia_billman).
troop(vlandian_light_cavalry).
troop(vlandian_swordsman).

troop(aserai_recruit).
troop(aserai_tribesman).
troop(aserai_mameluke_soldier).
troop(aserai_skirmisher).
troop(aserai_footman).
troop(aserai_mameluke_regular).
troop(aserai_mameluke_axeman).
troop(aserai_archer).
troop(aserai_infantry).
troop(aserai_cavalry).
troop(aserai_mameluke_guard).

troop(battanian_volunteer).
troop(battanian_clan_warrior).
troop(battanian_wood_runner).
troop(battanian_trained_warrior).
troop(battanian_raider).
troop(battanian_skirmisher).
troop(battanian_picked_warrior).
troop(battanian_scout).
troop(battanian_falxman).
troop(battanian_veteran_skirmisher).

hasParent(vlandian_levy_crossbowman, vlandian_recruit).
hasParent(vlandian_footman, vlandian_recruit).
hasParent(vlandian_crossbowman, vlandian_levy_crossbowman).
hasParent(vlandian_spearman, vlandian_footman).
hasParent(vlandian_infantry, vlandian_footman).
hasParent(vlandian_hardened_crossbowman, vlandian_crossbowman).
hasParent(vlandia_billman, vlandian_spearman).
hasParent(vlandian_light_cavalry, vlandian_infantry).
hasParent(vlandian_swordsman, vlandian_infantry).

hasParent(aserai_tribesman, aserai_recruit).
hasParent(aserai_mameluke_soldier, aserai_recruit).
hasParent(aserai_skirmisher, aserai_tribesman).
hasParent(aserai_footman, aserai_tribesman).
hasParent(aserai_mameluke_regular, aserai_mameluke_soldier).
hasParent(aserai_mameluke_axeman, aserai_mameluke_soldier).
hasParent(aserai_archer, aserai_skirmisher).
hasParent(aserai_infantry, aserai_footman).
hasParent(aserai_cavalry, aserai_mameluke_regular).
hasParent(aserai_mameluke_guard, aserai_mameluke_axeman).

hasParent(battanian_clan_warrior, battanian_volunteer).
hasParent(battanian_wood_runner, battanian_volunteer).
hasParent(battanian_trained_warrior, battanian_clan_warrior).
hasParent(battanian_raider, battanian_wood_runner).
hasParent(battanian_skirmisher, battanian_wood_runner).
hasParent(battanian_picked_warrior, battanian_trained_warrior).
hasParent(battanian_scout, battanian_trained_warrior).
hasParent(battanian_falxman, battanian_raider).
hasParent(battanian_veteran_skirmisher, battanian_skirmisher).


hasFraction(vlandian_recruit, vlandia).
hasFraction(vlandian_levy_crossbowman, vlandia).
hasFraction(vlandian_footman, vlandia).
hasFraction(vlandian_crossbowman, vlandia).
hasFraction(vlandian_spearman, vlandia).
hasFraction(vlandian_infantry, vlandia).
hasFraction(vlandian_hardened_crossbowman, vlandia).
hasFraction(vlandia_billman, vlandia).
hasFraction(vlandian_light_cavalry, vlandia).
hasFraction(vlandian_swordsman, vlandia).

hasFraction(aserai_recruit, aserai).
hasFraction(aserai_tribesman, aserai).
hasFraction(aserai_mameluke_soldier, aserai).
hasFraction(aserai_skirmisher, aserai).
hasFraction(aserai_footman, aserai).
hasFraction(aserai_mameluke_regular, aserai).
hasFraction(aserai_mameluke_axeman, aserai).
hasFraction(aserai_archer, aserai).
hasFraction(aserai_infantry, aserai).
hasFraction(aserai_cavalry, aserai).
hasFraction(aserai_mameluke_guard, aserai).

hasFraction(battanian_volunteer, battania).
hasFraction(battanian_clan_warrior, battania).
hasFraction(battanian_wood_runner, battania).
hasFraction(battanian_trained_warrior, battania).
hasFraction(battanian_raider, battania).
hasFraction(battanian_skirmisher, battania).
hasFraction(battanian_picked_warrior, battania).
hasFraction(battanian_scout, battania).
hasFraction(battanian_falxman, battania).
hasFraction(battanian_veteran_skirmisher, battania).

hasType(vlandian_recruit, melee).
hasType(vlandian_levy_crossbowman, archer).
hasType(vlandian_footman, melee).
hasType(vlandian_crossbowman, archer).
hasType(vlandian_spearman, melee).
hasType(vlandian_infantry, melee).
hasType(vlandian_hardened_crossbowman, archer).
hasType(vlandia_billman, melee).
hasType(vlandian_light_cavalry, cavalry).
hasType(vlandian_swordsman, melee).

hasType(aserai_recruit, melee).
hasType(aserai_tribesman, melee).
hasType(aserai_mameluke_soldier, melee).
hasType(aserai_skirmisher, melee).
hasType(aserai_footman, melee).
hasType(aserai_mameluke_regular, cavalry).
hasType(aserai_mameluke_axeman, melee).
hasType(aserai_archer, archer).
hasType(aserai_infantry, melee).
hasType(aserai_cavalry, archer_cavalry).
hasType(aserai_mameluke_guard, melee).

hasType(battanian_volunteer, melee).
hasType(battanian_clan_warrior, melee).
hasType(battanian_wood_runner, melee).
hasType(battanian_trained_warrior, melee).
hasType(battanian_raider, melee).
hasType(battanian_skirmisher, melee).
hasType(battanian_picked_warrior, melee).
hasType(battanian_scout, cavalry).
hasType(battanian_falxman, melee).
hasType(battanian_veteran_skirmisher, melee).

% Поиск войск с типом во фракции %
findTroopWithTypeInFraction(Troop, Type, Fraction) :- hasType(Troop, Type), hasFraction(Troop, Fraction).

/*
isAllTypesInFraction(Fraction) :- hasType(Troop, X), hasFraction(Troop, Fraction), 
                                  hasType(Troop2, Y), hasFraction(Troop2, Fraction),
                                  hasType(Troop3, Z), hasFraction(Troop3, Fraction),
                                  hasType(Troop4, A), hasFraction(Troop4, Fraction),
                                  not(X = Y), not(X = Z), not(X = A),
                                  not(Y = Z), not(Y = A),
                                  not(Z = A).
*/

% Проверяет содержатся ли все типы войск во фракции %
isAllTypesInFraction(Fraction) :- 
    findall(Type, (hasType(Troop, Type), hasFraction(Troop, Fraction)), FractionTypes),
    list_to_set(FractionTypes, UniqueFractionTypes),
    findall(Type, type(Type), Types),
    permutation(Types, UniqueFractionTypes).

% Поиск предка %
findPredessor(Child, Parent) :- hasParent(Child, Parent).
findPredessor(Child, Parent) :- hasParent(Child, Y), findPredessor(Y, Parent).

% Поиск наследника с типом%
findChildWithType(Parent, Child, Type) :- findPredessor(Child, Parent), hasType(Child, Type).


% Проверка на возможность развития %
canBeEvolvedToType(Troop, Type) :- findPredessor(X, Troop), hasType(X, Type).