create table historicoPonto (
idPonto int primary key auto_increment,
nomeFuncionario varchar(45),
dtPonto date,
hrEntrada time,
hrIntervaloEntrada time,
hrIntervaloSaida time,
hrSaida time);

alter table historicoPonto modify column hrEntrada datetime,
    modify column hrIntervaloEntrada datetime,
    modify column hrIntervaloSaida datetime,
    modify column hrSaida datetime;