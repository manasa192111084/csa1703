% Facts in the database
person(john, date(1990, 5, 15)).
person(susan, date(1985, 9, 28)).
person(mary, date(1995, 3, 10)).
person(david, date(1980, 12, 3)).

% Rules to query the database
is_adult(Name) :-
    person(Name, date(Year, _, _)),
    get_current_year(CurrentYear),
    CurrentYear - Year >= 18.

get_current_year(CurrentYear) :-
    get_time(T),
    stamp_date_time(T, DateTime, local),
    date_time_value(year, DateTime, CurrentYear).
