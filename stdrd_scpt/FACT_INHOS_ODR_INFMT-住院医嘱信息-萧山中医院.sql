/*

*version : v2.01

*script name : FACT_INHOS_ODR_INFMT (住院医嘱信息)

*creat date : 2021-06-28

*author name : zhangxin

*/
SELECT 
'' AS mdc_org_cd,  --医疗机构代码
y.yzbxh AS odr_no,   --医嘱号
y.yzzh AS odr_grp_no , --医嘱组号
y.zyh AS inhos_no,   --住院号
'' AS inhos_tms,  --住院次数
y.brks AS dpt_cd,   --科室代码
ks.ksmc AS dpt_nm,   --科室名称
y.brbq wrd_cd ,  --病区代码
ks.ksmc  AS wrd_nm ,  --病区名称
y.xmid AS odr_itm_cd,  --医嘱项目代码
y.yzmc AS odr_itm_nm , --医嘱项目名称
y.xmlb oAS dr_itm_tp_cd,  --医嘱项目类型代码
e.lbmc AS odr_itm_tp_nm , --医嘱项目类型名称  药品(西药、成药、草药)、治疗、护理、检验、检查…
y.yzqx AS odr_cgy_cd,  --医嘱类别代码
(CASE 
	WHEN y.yzqx='1' THEN '常嘱' 
	WHEN y.yzqx='0' THEN '临嘱' 
	ELSE  NULL
END) AS odr_cgy_nm,  --医嘱类别名称  1常嘱,0临嘱
y.xmid AS drg_cd , --药品代码
y.yzmc AS drg_nm,  --药物名称
'' AS odr_sqnc_no,  --医嘱顺序号
'' AS emg_odr_flg , --紧急医嘱标识
'' AS antbtc_lvl ,  --抗生素级别
b.yewyh AS dscg_drg_flg,  --出院带药标识 0代表出院带药 1代表非出院带药（没有字典表 只是猜测值域）
y.jldw AS drg_dosg_fom_cd , --药物剂型代码
b.ypdj AS drg_unt_prc,  --药品单价
y.jldw AS drg_spcf,  --药物规格
y.zl AS drg_use_tot_dosg , --药物使用总剂量
y.zldw AS drg_use_tot_dosg_unt , --药品使用总剂量单位
y.ycjl AS drg_use_once_dosg , --药物使用次剂量
y.jldw AS drg_use_once_dosg_un,  --药品使用次剂量单位
b.pzpc AS drg_use_frq_cd,  --药物使用频次代码
'' AS drg_use_frq_nm , --药品使用频次名称
y.gytj AS dos_rut_cd,   --用药途径代码
'' AS odr_exec_stts_cd , --医嘱执行状态代码
y.kzsj AS odr_strt_dt,  --医嘱开始日期
y.tzsj AS odr_end_dt ,  --医嘱结束日期
y.tzys AS odr_opn_dct_cd , --医嘱开立医生工号
yg.ygxm AS odr_opn_dct_nm , --医嘱开立医生姓名
y.kzsj AS odr_opn_dpt_cd,  --医嘱开立科室代码
yg.ygxm AS odr_opn_dpt,  --医嘱开立科室
y.kzsj AS odr_opn_dt_tm,  --医嘱开立日期时间
'' AS odr_pln_strt_dt_tm,  --医嘱计划开始日期时间
'' AS odr_pln_end_dt_tm , --医嘱计划结束日期时间
'' AS odr_adt_stff_cd , --医嘱审核职工工号
'' AS odr_adt_stff_nm , --医嘱审核职工姓名
b.fhgh AS odr_chk_nus_cd ,--医嘱核对护士工号
yg1.ygxm AS odr_chk_nus_nm, --医嘱核对护士姓名
'' AS odr_chk_dt_tm,  --医嘱核对日期时间
'' AS odr_adt_dt_tm , --医嘱审核日期时间
'' AS odr_exec_dpt_cd, -- 医嘱执行科室代码
'' AS odr_exec_dpt_nm  ,--医嘱执行科室名称
b.zxgh AS odr_exec_nus_cd,  --医嘱执行护士工号
yg2.ygxm AS odr_exec_nus_nm , --医嘱执行护士姓名
b.zxsj AS odr_exec_strt_dt , --医嘱执行开始日期
'' AS odr_exec_cplt_dt , --医嘱执行完成日期
'' AS odr_stp_stff_cd,  -- 医嘱停止职工工号
'' AS odr_stp_stff_nm ,-- 医嘱停止职工姓名
'' AS odr_stp_dt_tm,  --医嘱停止日期时间
'' AS odr_ccl_flg , --医嘱取消标识
'' AS odr_ccl_stff_cd,  --医嘱取消职工工号
'' AS odr_ccl_stff_nm , --医嘱取消职工姓名
'' AS odr_ccl_dt_tm , --医嘱取消日期时间
b.jfbz AS chrg_flg,  --收费标志
'' AS chrg_dt , --收费日期
'' AS inft_flg , --婴儿标志
'' AS dct_etst,  --医生嘱托
'' AS crt_rcd_dt_tm,  --建档日期时间
'' AS crt_rcd_stff_cd , --建档职工工号
'' AS crt_rcd_stff_nm , --建档者姓名
'' AS upd_dt , --更新日期
'' AS upd_stff_cd , --更新职工工号
'' AS upd_stff_nm , --更新职工姓名
'' AS vld_flg  --有效标识
FROM bsrun.emr_yzb y
INNER JOIN bsrun.zy_bqyz b
	ON y.yzbxh=b.ysyzbh
INNER JOIN bsrun.gy_ksdm ks
	ON ks.ksdm = y.brks
INNER JOIN 	bsrun.emr_ydyzlb e
	ON e.ydyzlb=y.xmlb
INNER JOIN bsrun.gy.ygdm yg
	ON y.kzys=yg.ygdm
INNER JOIN bsrun.gy.ygdm yg1
	ON b.fhgh=yg.ygdm	
INNER JOIN bsrun.gy.ygdm yg2
	ON b.zxgh=yg.ygdm	

	
