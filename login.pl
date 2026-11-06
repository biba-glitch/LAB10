credentials(ali, pass123).
credentials(sara, sara2024).
credentials(khalid, khalid99).
credentials(nora, nora555).

login :-
    try_login(3).

try_login(Attempts) :-
    Attempts > 0,
    write('Enter username: '), read(Username),
    write('Enter password: '), read(Password),
    ( credentials(Username, Password) ->
        write('Login Successful'), nl
    ; RemainingAttempts is Attempts - 1,
      write('Login Unsuccessful'), nl,
      ( RemainingAttempts > 0 ->
          try_login(RemainingAttempts)
      ; write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl
      )
    ).
