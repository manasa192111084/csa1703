% Facts in the database
planet(mercury, 0.39, 0.38, 0.06, 88).
planet(venus, 0.72, 0.95, 0.82, 225).
planet(earth, 1.0, 1.0, 1.0, 365).
planet(mars, 1.52, 0.53, 0.18, 687).
planet(jupiter, 5.2, 11.2, 318, 4333).
planet(saturn, 9.58, 9.45, 95, 10759).
planet(uranus, 19.18, 4.01, 14.5, 30687).
planet(neptune, 30.05, 3.88, 17.2, 60190).

% Rules to query the database
distance_from_sun(Planet, Distance) :- planet(Planet, Distance, _, _, _).
orbital_period(Planet, Days) :- planet(Planet, _, _, _, Days).
planet_size(Planet, Radius) :- planet(Planet, _, Radius, _, _).
planet_mass(Planet, Mass) :- planet(Planet, _, _, Mass, _).

% Predicate to classify planets
classify(Planet, Type) :-
    planet_size(Planet, Radius),
    planet_mass(Planet, Mass),
    (Radius < 1.0, Mass < 1.0, Type = rocky);
    (Radius >= 1.0, Mass >= 1.0, Type = gas_giant);
    (Radius >= 1.0, Mass < 1.0, Type = ice_giant).

% Predicate to find planets with a specific characteristic
planets_with_characteristic(Characteristic, Planets) :-
    findall(Planet, (planet(Planet, _, _, _, _), classify(Planet, Characteristic)), Planets).
