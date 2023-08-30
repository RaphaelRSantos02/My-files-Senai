use empresa;
/*a*/
select Nome_RazaoSocial, UF from lcliente;
/*b*/
select * from llicenca where NumLicenca like '%A%';
/*c*/
select Nome_RazaoSocial from lcliente where Nome_RazaoSocial like 'p%' order by Nome_RazaoSocial asc;
/*d*/
select Nome_RazaoSocial from lcliente where Nome_RazaoSocial like '%ar' order by Nome_RazaoSocial desc;
/*e*/
select Nome_RazaoSocial from lcliente where Nome_RazaoSocial like '%W%' or '%Y%';
/*f*/
select * from llicenca  where ValorAquisicao >=   1200.00 order by ValorAquisicao desc;
/*g*/
select * from lcliente where idCLIENTE >150 and idCLIENTE < 200;
/*h*/
select * from llicenca where ValorAquisicao > 250 and ValorAquisicao < 500 order by ValorAquisicao asc;
/*i*/
select * from llicenca where year(DtAquisicao) > 2008 and (ValorAquisicao > 300 and ValorAquisicao < 450 or ValorAquisicao > 600 and ValorAquisicao < 800) order by DtAquisicao asc;
/*j*/
select * from lcliente where UF in ("SP", "RS", "PR", "MG");
/*k*/
select * from lcliente where UF not in ("RJ","ES","SP","MG");
/*l*/
insert into lcliente values (515,14,6,"Blaze", "Al Santos 301","São Paulo","SP",1018101);
/*M*/
insert into lsoftware values (11, "Windowns");
insert into lversao values (11, "9");
/*N*/
insert into llicenca values ("21452AE6", 515, 11, 9, now(), 3000.6);
select * from llicenca where NumLicenca = "21452AE6";
insert into llicenca values ("21545AE6", 515, 1, 2000, now(), 2004.0);
select * from llicenca where NumLicenca = "21545AE6";
insert into llicenca values ("21515AE6", 515, 1, 2005, now(), 3500.0);
select * from llicenca where NumLicenca = "21515AE6";
/*o*/
update llicenca set ValorAquisicao = valorAquisicao*0.125 where idSOFTWARE_FK_FK = 11 ;
/*p*/
update ltipo_empresa set DescricaoTipo = "Governo" where idTIPO_Empresa = 6;
/*q*/
alter table llicenca add imposto_10 decimal(10,3) after DtAquisicao;
update llicenca set imposto_10 = (ValorAquisicao*0.1) where year(DtAquisicao) > 2011;
alter table llicenca add Valor_liquido decimal(10,3) after ValorAquisicao;
update llicenca set valor_liquido = (ValorAquisicao + imposto_10) where year(DtAquisicao) > 2011;
select NumLicenca, DtAquisicao, imposto_10, ValorAquisicao, valor_liquido from llicenca where year(DtAquisicao) > 2011;
/*r*/
select sf.NomeSoftware, v.Versao from lsoftware sf
join lversao v on v.idSOFTWARE_FK = idSOFTWARE group by sf.NomeSoftware, v.Versao;
/*s*/
select count(*) from lcliente;
/*t*/
select sf.NomeSoftware, l.Versao_FK, ca.Nome_RazaoSocial, e.DescricaoTipo, s.NomeSetor, l.DtAquisicao, l.ValorAquisicao
from lcliente ca
join ltipo_empresa e on ca.idTIPO_Empresa_FK = e.idTIPO_Empresa
join lsetor s on ca.idSETOR_FK = s.idSETOR
join llicenca l on l.idCLIENTE_FK = ca.idCLIENTE
join lsoftware sf on l.idSOFTWARE_FK_FK = sf.idSOFTWARE
order by sf.NomeSoftware, l.Versao_FK, l.DtAquisicao, ca.Nome_RazaoSocial;
/*u*/
select count(*) from llicenca;
/*v*/
select ca.Nome_RazaoSocial, count(li.idCLIENTE_FK) from lcliente ca
join llicenca li on li.idCLIENTE_FK = ca.idCLIENTE
group by li.idCLIENTE_FK order by ca.Nome_RazaoSocial;
