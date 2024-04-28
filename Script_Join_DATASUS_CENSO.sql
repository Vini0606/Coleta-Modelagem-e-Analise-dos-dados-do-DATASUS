CREATE OR REPLACE VIEW "DATASUS_16_ANOS" AS 
SELECT 	
	q."Mês",
	q."Ano",
	c.*,
	q."Acoes_Promocao_Qtd",
	q."Procedimentos_Finalidade_Qtd",
	q."Procedimentos_Clinicos_Qtd",
	q."Procedimentos_Cirurgicos_Qtd",
	q."Transplantes_Orgaos_Qtd",
	q."Medicamentos_Qtd",
	q."Orteses_Proteses_Qtd",
	q."Acoes_Complementares_Qtd",
	q."Total_Qtd",
	v."02 Procedimentos com finalidade",
	v."03 Procedimentos clínicos",
	v."04 Procedimentos cirúrgicos",
	v."05 Transplantes de orgãos, tec",
	v."06 Medicamentos",
	v."07 Órteses, próteses e materi",
	v."08 Ações complementares da ate",
	(v."02 Procedimentos com finalidade" + v."03 Procedimentos clínicos" + v."04 Procedimentos cirúrgicos" + 
	v."05 Transplantes de orgãos, tec" + v."06 Medicamentos" + v."07 Órteses, próteses e materi" + 
	v."08 Ações complementares da ate") as Valor_Total
FROM public."DATASUS_16_ANOS_QTD" q
left JOIN public."DATASUS_16_ANOS_VALOR" v ON cast(v."Cod_Município" as numeric) = q."Cod_Municipio" and v."Mês" = q."Mês" and v."Ano" = cast(q."Ano" as text) 
left JOIN public."CENSO_DEMOGRAFICO_2022" c ON c."CODIGO_MUNICIPIO" = q."Cod_Municipio"; 
     